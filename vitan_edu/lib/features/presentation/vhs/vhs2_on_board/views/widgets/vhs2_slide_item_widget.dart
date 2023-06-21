import 'package:api/system/model/system_index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:core/assets/images/images.dart';
import 'package:core/common/text_style.dart';
import 'package:core/components/bnd_image.dart';
import 'package:core/language/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:core/common/dimension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vitan_edu/core/theme/custom.dart';

Widget VHS2SlideItemWidget(OnBoarding data, BuildContext context) {
  final double paddingDefault = width(context, 36);
  final double paddingText = width(context, 45);
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 8.sp),
    child: Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: paddingDefault, right: paddingDefault),
          child: BNDImage(
            imageUrl: data.urlImage,
            height: 150.sp,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: paddingDefault),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(left: paddingText, right: paddingText),
            child: Column(
              children: <Widget>[
                AutoSizeText(
                  data.title,
                  style: textStyleHeadline5,
                  maxLines: 2,
                ),
                SizedBox(height: height(context, 20)),
                Expanded(
                  child: AutoSizeText(
                    data.content,
                    style: textStyleBodyDefault,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
