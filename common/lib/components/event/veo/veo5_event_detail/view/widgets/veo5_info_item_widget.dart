import 'package:core/assets/images/images.dart';
import 'package:core/common/color/core_color.dart';
import 'package:core/common/constants/block_settings.dart';
import 'package:core/common/text_style.dart';
import 'package:core/shared_preferences/local_storage_manager.dart';
import 'package:flutter/material.dart';

class VEO5InfoItemWidget extends StatelessWidget {
  final String icon;
  final String? title;
  final String description;
  final Widget? startWidget;
  final Widget? endWidget;

  VEO5InfoItemWidget(
      {Key? key, required this.icon, required this.title, required this.description, this.startWidget, this.endWidget})
      : super(key: key);

  final int _blockId = LocalStoreManager.getInt(BlockSettings.blockKey);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        startWidget ??
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: CoreColor.veo5InviteTextColor.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
              child: Images.svgAssets(icon,
                  color: listBlockWithVitan.firstWhere((BlockModel e) => e.id == _blockId).backgroundColor),
            ),
        const SizedBox(
          width: 14,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            if (title != null)
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      title ?? '',
                      style: textStyleBodyDefault.copyWith(
                        color: CoreColor.textColor,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            const SizedBox(
              height: 2,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    description,
                    style: textStyleBodySmallest.copyWith(
                      color: CoreColor.textColor,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          ],
        )),
        endWidget ?? const SizedBox(),
      ],
    );
  }
}
