import 'package:core/assets/images/images.dart';
import 'package:core/common/color/core_color.dart';
import 'package:core/common/constants/block_settings.dart';
import 'package:core/common/text_style.dart';
import 'package:core/language/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          border: Border.all(width: 1, color: CoreColor.borderSearchColor),
          borderRadius: BorderRadius.circular(8),
          color: CoreColor.white),
      margin: CoreColor.paddingBodyDefault,
      child: Scrollbar(
        isAlwaysShown: true,
        controller: _controller,
        radius: const Radius.circular(4.5),
        thickness: 4.5,
        child: ListView.separated(
          controller: _controller,
          itemCount: listBlockModel.length,
          itemBuilder: (_, int i) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (i == 0)
                  Container(
                      padding: EdgeInsets.only(top: 16.sp, left: 16.sp, right: 16.sp),
                      child:
                          Text(AppLocalizations.of(context)!.translate('search_in'), style: textStyleBodyDefaultBold)),
                ListTile(
                  onTap: () {
                    onChoose(listBlockModel[i]);
                  },
                  leading: Images.svgAssets(listBlockModel[i].icon, width: 36),
                  title: Text(
                    'Vitan' + listBlockModel[i].title,
                    style: textStyleBodyDefaultBold.copyWith(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    AppLocalizations.of(context)!.translate(listBlockModel[i].title),
                    style: textStyleBodySmallest,
                  ),
                  trailing: listBlockModel[i].id == currentBlock.id ? const Icon(Icons.check, size: 12) : null,
                ),
              ],
            );
          },
          separatorBuilder: (_, __) =>
              Container(padding: CoreColor.paddingBodyDefault, child: const Divider(height: 0)),
        ),
      ),
    );
  }
}
