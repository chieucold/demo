import 'package:api/api/commondata_api.dart';
import 'package:common/common/color/common_color.dart';
import 'package:core/assets/images/images.dart';
import 'package:core/common/color/core_color.dart';
import 'package:core/common/common.dart';
import 'package:core/common/enums/block_enum.dart' as coreEnum;
import 'package:core/language/app_localizations.dart';
import 'package:core/common/text_style.dart';
import 'package:flutter/material.dart';

Widget EventContentItemWidget(BuildContext context, EventPublicResource item, {bool isShowBlock = false}) {
  return Container(
    margin: const EdgeInsets.only(top: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        RichText(
          text: TextSpan(children: <InlineSpan>[
            WidgetSpan(
              child: Container(
                child: Text(
                  'Hot',
                  style: textStyleBodySmall.copyWith(
                    color: CommonColor.textWhiteColor,
                  ),
                ),
                decoration: BoxDecoration(
                    color: CommonColor.colorHotEvent, borderRadius: const BorderRadius.all(Radius.circular(4))),
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                margin: const EdgeInsets.only(right: 5, top: 2),
              ),
            ),
            TextSpan(
              text: item.title,
              style: textStyleBodyMediumBold.copyWith(
                  height: 1.4, fontWeight: FontWeight.bold, color: CoreColor.textColor),
            ),
          ]),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        Container(
            margin: const EdgeInsets.only(top: 6),
            alignment: AlignmentDirectional.topStart,
            child: Row(
              children: <Widget>[
                if (isShowBlock)
                  Expanded(
                    child: Text(
                      AppLocalizations.of(context)!
                          .translate(coreEnum.BlockEnum.values[item.blockId].toString().split(".").last),
                      style: textStyleBodySmall.copyWith(color: CommonColor.colorSubTitle),
                    ),
                  ),
                Images.svgAssets(Images.users, color: CommonColor.colorSubTitle),
                const SizedBox(
                  width: 8,
                ),
                Container(
                    margin: const EdgeInsets.only(top: 2),
                    child: Text(
                      item.totalEventUser.toString(),
                      textAlign: TextAlign.start,
                      style: TextStyle(color: CommonColor.colorSubTitle),
                    )),
              ],
            ))
      ],
    ),
  );
}
