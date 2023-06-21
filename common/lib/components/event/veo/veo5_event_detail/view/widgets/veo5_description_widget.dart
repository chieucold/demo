import 'package:core/common/color/core_color.dart';
import 'package:core/components/html/text_html_widget.dart';
import 'package:core/language/app_localizations.dart';
import 'package:core/common/text_style.dart';
import 'package:flutter/material.dart';

class VEO5DescriptionWidget extends StatelessWidget {
  final String title;
  final String content;

  const VEO5DescriptionWidget({Key? key, required this.title, required this.content}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          AppLocalizations.of(context)!.translate(title),
          style: textStyleBodyMedium.copyWith(
            color: CoreColor.textColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        TextHtmlWidget(
          content,
          textStyle: textStyleBodyDefault.copyWith(
            color: CoreColor.textColor,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }
}
