import 'package:core/common/color/core_color.dart';
import 'package:core/common/text_style.dart';
import 'package:core/components/vhs9_notification/bloc/vhs9_notification_filter_bloc.dart';
import 'package:core/components/vhs9_notification/bloc/vhs9_notification_filter_state.dart';
import 'package:core/language/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VHS9NotificationFilterCheckBox<T> extends StatefulWidget {
  final List<T> items;
  final ValueChanged<List<int>> onChange;
  final double scale;
  final bool isChooseOne;
  final List<int> listChoose;
  const VHS9NotificationFilterCheckBox({
    Key? key,
    required this.items,
    required this.onChange,
    this.scale = 1.2,
    this.isChooseOne = false,
    required this.listChoose,
  }) : super(key: key);

  @override
  _VHS9NotificationFilterCheckBoxState createState() => _VHS9NotificationFilterCheckBoxState();
}

class _VHS9NotificationFilterCheckBoxState extends State<VHS9NotificationFilterCheckBox> {
  late List<bool> _check;
  final List<int> _listChoose = <int>[];

  @override
  void initState() {
    super.initState();
    _check = <bool>[];
    _listChoose.addAll(widget.listChoose);
    _check = List<bool>.filled(widget.items.length, false);
    for (final int element in widget.listChoose) {
      for (int i = 0; i < widget.items.length; i++) {
        if (widget.items[i].id == element) {
          _check[i] = true;
        }
      }
    }
    widget.onChange(_listChoose);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VHS9NotificationFilterBloc, VHS9NotificationFilterState>(
      builder: (BuildContext context, VHS9NotificationFilterState state) {
        if (state is VHS9NotificationFilterClearAll) {
          _check = List<bool>.filled(_check.length, false);
        }
        return ListView.builder(
          primary: false,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: widget.items.length,
          itemBuilder: (BuildContext context, int i) {
            return GestureDetector(
              onTap: () {
                widget.isChooseOne ? _onCheckboxChooseOne(i) : _onCheckbox(i);
              },
              child: Container(
                height: 40,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Transform.scale(
                      scale: widget.scale,
                      child: Container(
                        height: 22,
                        width: 22,
                        child: Checkbox(
                          value: _check[i],
                          onChanged: (_) {
                            widget.isChooseOne ? _onCheckboxChooseOne(i) : _onCheckbox(i);
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        (widget.items[i].name.toString().isNotEmpty ? '${widget.items[i].name} - ' : '') +
                            AppLocalizations.of(context)!.translate(widget.items[i].title),
                        style: textStyleBodyDefault.copyWith(
                          color: CoreColor.textColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _onCheckbox(int i) {
    BlocProvider.of<VHS9NotificationFilterBloc>(context).init();
    _check[i] = !_check[i];

    final int id = widget.items[i].id as int;
    if (_listChoose.contains(id)) {
      _listChoose.remove(id);
    } else {
      _listChoose.add(id);
    }
    widget.onChange(_listChoose);
    setState(() {});
  }

  void _onCheckboxChooseOne(int i) {
    BlocProvider.of<VHS9NotificationFilterBloc>(context).init();
    _check = List<bool>.filled(_check.length, false);

    _check[i] = true;
    final int id = widget.items[i].id as int;
    _listChoose.clear();
    _listChoose.add(id);
    widget.onChange(_listChoose);
    setState(() {});
  }
}
