import 'dart:ui';
import 'package:core/common/dimension.dart';
import 'package:core/components/appbar/app_bar_background.dart';
import 'package:core/components/appbar/sliver_appbar_delegate.dart';
import 'package:core/components/common_leading_widget.dart';
import 'package:flutter/material.dart';

///class VGE2InformationExpertsDetail extends StatelessWidget {
/// const VGE2InformationExpertsDetail({Key? key}) : super(key: key);

/// @override
/// Widget build(BuildContext context) {
///   return BackgroundHomeImage(
///     child: _buildBody(context),
///     image: Container(
///         color: CoreColor.primaryColor,
///        height: MediaQuery.of(context).size.height,
///        width: MediaQuery.of(context).size.width),
///   );
/// }

///Widget _buildBody(BuildContext context) {
///   return NestedScrollView(
///      headerSliverBuilder: (context, innerBoxIsScrolled) => [
///        // SliverAppBarDefaultWidget(header: _buildBody(context))
///        CollapsingAppBar(
///          actionButtons: [
///           Container(
///             margin: const EdgeInsets.symmetric(horizontal: 16),
///             width: 50,
///             height: 50,
///            child: Images.svgAssets(Images.icLoginAppleId),
///             )
///       ],
///           color: Theme.of(context).cardColor,
///          header: _buildHeader(context),
///          openWidget: Container(),
///           minHeight: 120,
///         )
///      ],
///       body: Container(
///          decoration: const BoxDecoration(
///             color: Colors.white,
///            borderRadius: BorderRadius.only(topLeft: Radius.circular(36), topRight: Radius.circular(36))),
///       child: SingleChildScrollView(
///           child: Column(
///            children: List.generate(
///                 (index) => Column(
///                   children: [
///                    Container(
///                      alignment: Alignment.center,
///                      width: double.infinity,
///                     // color: Colors.green,
///                     padding: EdgeInsets.symmetric(vertical: 10),
///                     height: 100,
///                     child: Text('10 Câu hỏi'),
///                    ),
///                    Divider()
///                  ],
///)),
///           ),
///        ),
///      ));
///}

///  Widget _buildHeader(BuildContext context) {
///    final height = AppBar().preferredSize.height + MediaQuery.of(context).padding.top;
///   return SizedBox(
///      height: 100,
///      child: Text(
///        'Holland',
///        style: textStyleBodyMediumBold.copyWith(fontSize: 32, color: kTextWhiteColor),
///      ),
///   );
/// }
///}

class CollapsingAppBar extends StatelessWidget {
  final Widget? header;
  final List<Widget>? actionButtons;
  final Stream<bool>? loadingStream;
  final Widget? openWidget;
  final Widget? backgroundWidget;
  final Color? color;
  final bool showLeading;
  final double? minHeight;
  final Alignment? alignmentHeader;
  final double? maxHeightAppBar;
  final Widget? leading;

  const CollapsingAppBar({
    Key? key,
    this.header,
    this.actionButtons,
    this.loadingStream,
    this.openWidget,
    this.showLeading = true,
    this.color,
    this.backgroundWidget,
    this.alignmentHeader,
    this.leading,
    this.minHeight,
    this.maxHeightAppBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double topPadding = MediaQuery.of(context).padding.top;
    final AppBar appBar = AppBar();
    final double _minHeight = minHeight ?? appBar.preferredSize.height + topPadding + 50;
    final double maxHeight = maxHeightAppBar ?? APPBAR_MAX_HEIGHT;
    final double maxExpanded = maxHeight - _minHeight;
    return SliverPersistentHeader(
      pinned: true,
      floating: true,
      delegate: SliverAppBarDelegate(
        minHeight: _minHeight,
        maxHeight: maxHeight,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final double delta = 1 - (constraints.maxHeight - _minHeight) / maxExpanded;
            return Container(
              color: color ?? Theme.of(context).scaffoldBackgroundColor,
              child: Stack(
                children: <Widget>[
                  backgroundWidget ?? appBarBackgroundWidget(color: color),
                  if (showLeading)
                    Positioned(
                      left: 0,
                      top: 0,
                      child: SafeArea(
                        child: leading ?? CommonLeadingWidget(),
                      ),
                    ),
                  // Transform.translate(
                  //   child: Opacity(
                  //     opacity: lerpDouble(1.0, 0.0, delta)??0.0,
                  //     child: Container(
                  //       padding:
                  //      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  //       alignment: Alignment.bottomCenter,
                  //       // child: openWidget == null
                  //       //     ? SearchBar()
                  //       //     : goWithAnimation(context,
                  //       //         openWidget: openWidget, closeWidget: SearchBar()),
                  //     ),
                  //   ),
                  //   offset: Offset(0, -(delta * minHeight)),
                  // ),
                  Column(
                    children: <Widget>[
                      Expanded(
                        child: Align(
                          alignment: alignmentHeader ??
                              Alignment.lerp(
                                Alignment.topLeft,
                                const Alignment(0, 0.5),
                                delta,
                              ) ??
                              Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(top: topPadding + 6, left: 40, right: 40),
                            child: header,
                          ),
                        ),
                      ),
                      Transform.translate(
                        child: Opacity(
                          opacity: lerpDouble(0.0, 1.0, delta) ?? 0.0,
                          child: Container(
                            margin: EdgeInsets.only(top: lerpDouble(0.0, 0.0, delta) ?? 0.0),
                            height: 1,
                            color: Theme.of(context).dividerColor,
                          ),
                        ),
                        offset: const Offset(1, 1),
                      ),
                    ],
                  ),
                  if (actionButtons != null)
                    Container(
                      padding: EdgeInsets.only(top: topPadding + 8),
                      alignment: Alignment.topRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: actionButtons ?? <Widget>[],
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

//  Widget backHomeWidget(String title,Function? onBack,Function? goSuperApp){
//   return Align(
//      alignment: AlignmentDirectional.bottomCenter,
//      child: Container(
//        height: 40,
//        margin: const EdgeInsetsDirectional.only(start: 16),
//        child: Row(
//          children: <Widget>[
//            GestureDetector(
//                onTap: () {
//                  if (onBack != null) {
//                    onBack();
//                  } else {
//                    goSuperApp;
//
//                  }
//                },
//                child: Container(
//                    width: 40,
//                    height: 40,
//                    color: Colors.transparent,
//                    padding: const EdgeInsets.all(6),
//                    child: Images.svgAssets(Images.home_icon))),
//            Container(
//              margin: const EdgeInsetsDirectional.only(
//                start: 14,
//                end: 14,
//              ),
//              width: 1,
//              height: 21,
//              color: CoreColor.textWhiteColor,
//            ),
//            Expanded(
//              child: Text(
//                title ?? 'Thi trực tuyến',
//                style: textStyleHeadline6Default.copyWith(color: CoreColor.textWhiteColor),
//              ),
//              flex: 8,
//            ),
//            // Expanded(
//            //   child: GestureDetector(
//            //     onTap: () {
//            //       goToVHSLoginQRCode(context);
//            //     },
//            //     child: Images.svgAssets(
//            //       Images.icQRCode,
//            //       package: 'core',
//            //       color: Colors.white,
//            //       height: 20,
//            //     ),
//            //   ),
//            //   flex: 1,
//            // ),
//
//            Expanded(
//              child: Stack(children: <Widget>[
//                Row(
//                  children: <Widget>[
//                    Expanded(
//                      child: CustomPaint(
//                        painter: IconMenuAppBarPathPainting(),
//                        child: Container(),
//                      ),
//                    )
//                  ],
//                ),
//                Row(
//                  children: <Widget>[
//                    const Expanded(flex: 2, child: SizedBox()),
//                    Expanded(
//                        flex: 3,
//                        child: Align(
//                          child: MenuBarWidgetWidget(
//                            idMiniApp: BlockEnum.Exam.index,
//                            colorMiniApp: CustomTheme.primaryColor,
//                          ),
//                          alignment: Alignment.center,
//                        )),
//                  ],
//                )
//              ]),
//              flex: 3,
//            )
//          ],
//        ),
//      ),
//    );
// }
