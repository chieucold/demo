import 'package:core/assets/images/images.dart';
import 'package:core/common/color/core_color.dart';
import 'package:core/common/dimension.dart';
import 'package:core/language/app_localizations.dart';
import 'package:core/common/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class VEO2NoEventWidget extends StatelessWidget {
  VEO2NoEventWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: height(context, 115),
          ),
          Images.svgAssets(Images.icOfflineEvent,height: height(context, 202)),
          SizedBox(
            height: height(context, 30),
          ),
          Flexible(
              child: Text(
            AppLocalizations.of(context)!.translate("no_event"),
            style: textStyleHeadline5.copyWith(color: CoreColor.textColor),
            textAlign: TextAlign.center,
          ))
        ],
      ),
    );
  }
}
