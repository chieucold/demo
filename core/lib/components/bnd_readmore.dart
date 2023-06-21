import 'package:core/language/app_localizations.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BNDReadMore extends StatefulWidget {
  BNDReadMore(this.textWidget, {this.viewMoreWidget, this.viewShortened, this.shortHeight = 50});

  final Widget textWidget;
  final Widget? viewMoreWidget;
  final Widget? viewShortened;
  final double shortHeight;

  bool isExpanded = false;

  @override
  _BNDReadMoreState createState() => _BNDReadMoreState();
}

class _BNDReadMoreState extends State<BNDReadMore>
    with TickerProviderStateMixin<BNDReadMore>, AutomaticKeepAliveClientMixin {
  final GlobalKey _keyRed = GlobalKey();
  bool isShowReadmore = false;

  Widget? get _viewMoreWidget =>
      widget.viewMoreWidget ??
          Text(
            AppLocalizations.of(context)!.translate("view_more"),
            style: const TextStyle(fontSize: 16, color: Colors.blue, decoration: TextDecoration.underline),
          );

  Widget? get _viewShortened =>
      widget.viewShortened ??
          Text(
            AppLocalizations.of(context)!.translate("view_shortened"),
            style: const TextStyle(fontSize: 16, color: Colors.blue, decoration: TextDecoration.underline),
          );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      setState(() {
        isShowReadmore = (_keyRed.currentContext?.size?.height ?? 0) >= widget.shortHeight;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: <Widget>[
        Stack(alignment: Alignment.bottomCenter, children: <Widget>[
          AnimatedSize(
            vsync: this,
            duration: const Duration(milliseconds: 500),
            child: ConstrainedBox(
                key: _keyRed,
                constraints: widget.isExpanded ? const BoxConstraints() : BoxConstraints(maxHeight: widget.shortHeight),
                child: widget.textWidget),
          ),
          if (isShowReadmore && !widget.isExpanded)
            Container(
              width: double.infinity,
              height: 0.4 * widget.shortHeight,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Colors.white.withOpacity(0.1),
                    Colors.white.withOpacity(0.9),
                  ],
                ),
              ),
            )
        ]),
        if (isShowReadmore)
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: widget.isExpanded
                  ? GestureDetector(
                child: _viewShortened,
                onTap: () => setState(() => widget.isExpanded = false),
              )
                  : GestureDetector(
                child: _viewMoreWidget,
                onTap: () => setState(() => widget.isExpanded = true),
              ),
            ),
          ),
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
