import 'package:core/assets/images/images.dart';
import 'package:core/common/color/core_color.dart';
import 'package:core/common/common.dart';
import 'package:core/common/enums/status_enum.dart';
import 'package:core/common/text_style.dart';
import 'package:core/components/core_component.dart';
import 'package:core/components/vhs9_notification/bloc/vhs9_notification_bloc.dart';
import 'package:core/components/vhs9_notification/bloc/vhs9_notification_filter_bloc.dart';
import 'package:core/components/vhs9_notification/bloc/vhs9_notification_filter_state.dart';
import 'package:core/components/vhs9_notification/view/widgets/vhs9_notification_filter_checkbox.dart';
import 'package:core/language/app_localizations.dart';
import 'package:core/shared_preferences/local_storage_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core/common/dimension.dart';

// ignore: must_be_immutable
class VHS9NotificationFilterWidget extends StatelessWidget {
  final VHS9NotificationBloc notificationBloc;
  VHS9NotificationFilterWidget({Key? key, required this.notificationBloc}) : super(key: key);
  List<int> _listBlock = <int>[];
  List<int> _listStatus = <int>[];
  // final VHS9NotificationBloc _notificationBloc = getItSuper();
  final List<BlockModel> listStatus = <BlockModel>[
    BlockModel(statusEnum.seen.index, '', 'seen', "", Colors.white),
    BlockModel(statusEnum.notSeen.index, '', 'not_seen', "", Colors.white),
  ];

  final int _blockIdLocal = LocalStoreManager.getInt(BlockSettings.blockKey);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView(
            children: <Widget>[
              _blockIdLocal == BlockEnum.SupperApp.index
                  ? BuildBlock<BlockModel>(
                      list: listBlock,
                      title: AppLocalizations.of(context)!.translate("block_function"),
                      onChange: (List<int> list) {
                        _listBlock = list;
                        print(list);
                      },
                      listChoose: notificationBloc.blocksId,
                    )
                  : _buildSingleBlock(context),
              Divider(
                thickness: height(context, 6),
                color: CoreColor.driverColor,
              ),
              BuildBlock<BlockModel>(
                isChooseOne: true,
                list: listStatus,
                title: AppLocalizations.of(context)!.translate("status"),
                onChange: (List<int> list) {
                  _listStatus = list;
                  print(list);
                },
                listChoose: notificationBloc.statusId,
              ),
              const SizedBox(height: 12),
              // BuildBlock<ListBlockModel>(
              //   list: listTitle,
              //   title: AppLocalizations.of(context)!.translate("title"),
              // ),
            ],
          ),
        ),
        VDE2BottomButtonWidget(context)
      ],
    );
  }

  Widget _buildSingleBlock(BuildContext context) {
    _listBlock = <int>[_blockIdLocal];
    final BlockModel _currentBlock = listBlock.firstWhere((BlockModel e) => e.id == _blockIdLocal);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextButton(
          onPressed: null,
          child: Container(
            margin: const EdgeInsetsDirectional.only(start: 20, end: 20),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Text(
                      AppLocalizations.of(context)!.translate("block_function"),
                      style: textStyleHeadline6.copyWith(
                        color: CoreColor.textColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: CoreColor.paddingBodyDefault,
          child: Text(
            '${_currentBlock.name} - ' + AppLocalizations.of(context)!.translate(_currentBlock.title),
            style: textStyleBodyDefault.copyWith(
              color: CoreColor.textColor,
            ),
          ),
        )
      ],
    );
  }

  Widget VDE2BottomButtonWidget(BuildContext context) {
    return BlocBuilder<VHS9NotificationFilterBloc, VHS9NotificationFilterState>(
      builder: (BuildContext context, VHS9NotificationFilterState state) {
        return SafeArea(
          top: false,
          child: Container(
            height: 60,
            padding: CoreColor.paddingBodyDefault.copyWith(top: 10, bottom: 10),
            decoration: BoxDecoration(
                color: CoreColor.textWhiteColor,
                border: Border(top: const BorderSide(color: CoreColor.vhs9BottomBorder))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildBottomLeftWidget(
                    title: AppLocalizations.of(context)!.translate("delete_filter"),
                    onPress: () {
                      _onDelete(context);
                    }),
                BnDButton(
                  onPressed: () {
                    _onApply(context);
                    // Navigator.of(context).pop(_resource.examFilterSelectedIdKey);
                  },
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(90))), // add to remove blue background
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  radius: 90,
                  backGroundColor:
                      listBlockWithVitan.firstWhere((BlockModel e) => e.id == _blockIdLocal).backgroundColor,
                  // gradient: CustomTheme.bottomRightButton,
                  title: Row(
                    children: <Widget>[
                      Text(
                        AppLocalizations.of(context)!.translate("apply").toUpperCase(),
                        style: textStyleBodySmallest.copyWith(
                            color: CoreColor.textWhiteColor, fontWeight: FontWeight.w700),
                      ),
                      //Todo Call api lấy số lượng
                      // Container(
                      //   margin: const EdgeInsets.only(left: 4, right: 4),
                      //   width: 4,
                      //   height: 4,
                      //   decoration: BoxDecoration(
                      //       color: CustomTheme.textWhiteColor,
                      //       shape: BoxShape.circle),
                      // ),
                      // Text(
                      //   state.toString(),
                      //   style: textStyleBodySmallest.copyWith(
                      //       color: CustomTheme.textWhiteColor,
                      //       fontWeight: FontWeight.w700),
                      // ),
                      const SizedBox(
                        width: 10,
                      ),
                      Images.svgAssets(
                        Images.icChevronRight,
                        color: CoreColor.iconAppbar,
                        width: 4,
                        height: 7,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBottomLeftWidget({String title = "", VoidCallback? onPress}) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: CoreColor.textColor))),
        child: Text(title.toUpperCase(), style: textStyleBodySmallest.copyWith(color: CoreColor.textColor)),
      ),
    );
  }

  Future<void> _onDelete(BuildContext context) async {
    notificationBloc.init();
    if (_blockIdLocal == BlockEnum.SupperApp.index) {
      _listBlock.clear();
    }
    _listStatus.clear();
    BlocProvider.of<VHS9NotificationFilterBloc>(context).clearAll();
  }

  Future<void> _onApply(BuildContext context) async {
    Navigator.pop(context);
    await notificationBloc.getFilter(_listBlock, _listStatus);
  }
}

// ignore: must_be_immutable
class BuildBlock<T> extends StatefulWidget {
  final List<T> list;
  final String title;
  final bool isChooseOne;
  final List<int> listChoose;
  ValueChanged<List<int>> onChange;
  BuildBlock({
    Key? key,
    required this.list,
    required this.title,
    required this.onChange,
    required this.listChoose,
    this.isChooseOne = false,
  }) : super(key: key);

  @override
  _BuildBlockState<T> createState() => _BuildBlockState<T>();
}

class _BuildBlockState<T> extends State<BuildBlock<T>> {
  bool _isExpanded = true;

  @override
  void initState() {
    super.initState();
    widget.onChange(<int>[]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 8, top: 8),
      child: ListView(
        primary: false,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          TextButton(
            onPressed: _onChangeExpand,
            child: Container(
              margin: const EdgeInsetsDirectional.only(start: 20, end: 20),
              child: Row(
                // ignore: always_specify_types
                children: [
                  Expanded(
                    child: Container(
                      child: Text(
                        widget.title,
                        style: textStyleHeadline6.copyWith(
                          color: CoreColor.textColor,
                        ),
                      ),
                    ),
                  ),
                  Images.svgAssets(
                    _isExpanded ? Images.vhs9IcMinusFilter : Images.vhs9IcAddFilter,
                    color: CoreColor.textColor,
                  ),
                ],
              ),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 750),
            curve: Curves.fastOutSlowIn,
            height: _isExpanded ? (widget.list.length) * 40 : 0,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: VHS9NotificationFilterCheckBox<T>(
              isChooseOne: widget.isChooseOne,
              items: widget.list,
              onChange: (List<int> checks) {
                widget.onChange(checks);
                // print(checks);
              },
              listChoose: widget.listChoose,
            ),
          ),
        ],
      ),
    );
  }

  void _onChangeExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }
}
