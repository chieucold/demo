import 'package:core/assets/images/images.dart';
import 'package:core/common/color/core_color.dart';
import 'package:core/common/constants/block_settings.dart';
import 'package:core/common/text_style.dart';
import 'package:core/components/bnd_button.dart';
import 'package:core/language/app_localizations.dart';
import 'package:core/shared_preferences/local_storage_manager.dart';
import 'package:flutter/material.dart';

class BottomFilterWidget extends StatelessWidget {
  BottomFilterWidget({
    Key? key,
    required this.onTapLeft,
    required this.onTapRight,
  }) : super(key: key);

  final int _blockIdLocal = LocalStoreManager.getInt(BlockSettings.blockKey);
  final VoidCallback? onTapLeft;
  final VoidCallback? onTapRight;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 60,
      padding: CoreColor.paddingBodyDefault.copyWith(top: 10, bottom: 10),
      decoration: BoxDecoration(
          color: CoreColor.textWhiteColor, border: const Border(top: BorderSide(color: CoreColor.vhs9BottomBorder))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildBottomLeftWidget(
            title: AppLocalizations.of(context)!.translate("delete_filter"),
            onPress: onTapLeft,
          ),
          BnDButton(
            onPressed: onTapRight,
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(90))),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
            radius: 90,
            backGroundColor: listBlockWithVitan.firstWhere((BlockModel e) => e.id == _blockIdLocal).backgroundColor,
            // gradient: CustomTheme.bottomRightButton,
            title: Row(
              children: <Widget>[
                Text(
                  AppLocalizations.of(context)!.translate("apply").toUpperCase(),
                  style: textStyleBodyDefault.copyWith(color: CoreColor.textWhiteColor, fontWeight: FontWeight.w700),
                ),
                const SizedBox(width: 10),
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
}
