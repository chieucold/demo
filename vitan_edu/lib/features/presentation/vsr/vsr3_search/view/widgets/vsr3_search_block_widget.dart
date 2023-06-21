import 'package:core/assets/images/images.dart';
import 'package:core/common/constants/block_settings.dart';
import 'package:core/common/text_style.dart';
import 'package:core/components/bnd_select/bnd_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vitan_edu/core/theme/custom.dart';
import 'package:vitan_edu/core/widget/search_widget/search_popup_widget.dart';

class VSR3SearchBlockWidget extends StatefulWidget {
  final Function onChangeItem;
  final BlockModel blockModel;
  const VSR3SearchBlockWidget({Key? key, required this.onChangeItem, required this.blockModel}) : super(key: key);

  @override
  State<VSR3SearchBlockWidget> createState() => _VSR3SearchBlockWidgetState();
}

class _VSR3SearchBlockWidgetState extends State<VSR3SearchBlockWidget> {
  double get _heightBarSize => 50.sp;
  late BlockModel _blockModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _blockModel = widget.blockModel;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _heightBarSize,
      child: BNDSelect<BlockModel>(
        isFullWidthPopup: true,
        items: listBlockWithVitan,
        isShowRemove: false,
        isReturnObject: false,
        propertyIdName: 'id',
        propertyTitleName: 'title',
        activeColor: CustomTheme.primaryColor,
        textStyle: textStyleBodyDefault,
        value: _blockModel,
        onItemChanged: (_) {},
        chooseItem: Container(
          margin: EdgeInsets.only(left: 8),
          padding: EdgeInsets.symmetric(horizontal: 8),
          height: _heightBarSize,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 1, color: CustomTheme.borderSearchColor),
          ),
          child: Row(
            children: [
              Images.svgAssets(_blockModel.icon, width: 32),
              Images.svgAssets(Images.icChevronDown, width: 9, color: CustomTheme.vhe10colorBorderCard),
            ],
          ),
        ),
        buildItem: _buildPopupBlock,
      ),
    );
  }

  Widget get _buildPopupBlock => Container(
        padding: EdgeInsets.only(top: 8),
        height: 345.sp,
        child: SearchPopupWidget(
          listBlockModel: listBlockWithVitan,
          currentBlock: _blockModel,
          onChoose: (BlockModel c) {
            _blockModel = c;
            Navigator.pop(context);
            setState(() {});
            widget.onChangeItem(c);
          },
        ),
      );
}
