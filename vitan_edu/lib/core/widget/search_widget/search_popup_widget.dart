// ignore_for_file: must_be_immutable

import 'package:core/common/constants/block_settings.dart';
import 'package:core/common/enums/block_enum.dart';
import 'package:core/common/text_style.dart';
import 'package:core/components/block/widgets/block_item_widget.dart';
import 'package:core/components/bnd_touch.dart';
import 'package:core/language/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vitan_edu/core/theme/custom.dart';

class SearchPopupWidget extends StatelessWidget {
  final List<BlockModel> listBlockModel;
  Function onChoose;
  BlockModel currentBlock;
  SearchPopupWidget({
    Key? key,
    required this.listBlockModel,
    required this.onChoose,
    required this.currentBlock,
  }) : super(key: key);

  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: CustomTheme.borderSearchColor),
          borderRadius: BorderRadius.circular(8),
          color: CustomTheme.white),
      margin: CustomTheme.paddingBodyDefault,
      child: Scrollbar(
        isAlwaysShown: true,
        controller: _controller,
        radius: Radius.circular(4.5),
        thickness: 4.5,
        child: ListView.separated(
          controller: _controller,
          itemCount: listBlockModel.length,
          itemBuilder: (_, int i) {
            final _item = listBlockModel[i];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (i == 0)
                  Container(
                      padding: EdgeInsets.only(top: 16.sp, left: 16.sp, right: 16.sp),
                      child:
                          Text(AppLocalizations.of(context)!.translate('search_in'), style: textStyleBodyDefaultBold)),
                // ListTile(
                //   onTap: () {
                //     onChoose(_item);
                //   },
                //   leading: Images.svgAssets(_item.icon, width: 36),
                //   // title: Text(
                //   //   listBlockModel[i].name,
                //   //   style: textStyleBodyDefaultBold.copyWith(fontWeight: FontWeight.w600),
                //   // ),
                //   title: RichText(
                //     text: TextSpan(
                //       children: <TextSpan>[
                //         TextSpan(
                //             text: 'Vitan',
                //             style: textStyleBodyDefaultBold.copyWith(
                //                 fontWeight: FontWeight.w600, color: CustomTheme.textColor)),
                //         TextSpan(
                //           text: AppLocalizations.of(context)!.translate(_item.name).replaceAll('Vitan', ''),
                //           style: textStyleBodyDefaultBold.copyWith(
                //               fontWeight: FontWeight.w600,
                //               color: _item.isActive ? _item.backgroundColor : CustomTheme.textColor),
                //         ),
                //       ],
                //     ),
                //     maxLines: 1,
                //     overflow: TextOverflow.ellipsis,
                //   ),
                //   subtitle: Text(
                //     AppLocalizations.of(context)!.translate(_item.title),
                //     style: textStyleBodySmallest,
                //   ),
                //   trailing: _item.id == currentBlock.id ? Icon(Icons.check, size: 12) : null,
                // ),
                BndTouch(
                  onPressed: _canChooseItem(_item) ? () => onChoose(_item) : null,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                              padding: EdgeInsets.symmetric(vertical: 12), child: BlockItemWidget(item: _item)),
                        ),
                        if (_item.id == currentBlock.id)
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 6),
                              child: Icon(
                                Icons.check,
                                size: 12,
                                color: CustomTheme.colorBorder3,
                              ))
                      ],
                    ),
                  ),
                )
              ],
            );
          },
          separatorBuilder: (_, __) => Container(padding: CustomTheme.paddingBodyDefault, child: Divider(height: 0)),
        ),
      ),
    );
  }

  bool _canChooseItem(BlockModel item) {
    if ((item.isActive || item.id == BlockEnum.SupperApp.index) && item.id != currentBlock.id) return true;
    return false;
  }
}
