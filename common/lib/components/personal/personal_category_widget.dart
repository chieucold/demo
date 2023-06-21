import 'package:common/common/color/common_color.dart';
import 'package:common/components/personal/personal_category_field_widget.dart';
import 'package:core/assets/images/images.dart';
import 'package:core/common/color/core_color.dart';
import 'package:core/common/text_style.dart';
import 'package:core/components/bnd_touch.dart';
import 'package:core/language/app_localizations.dart';
import 'package:flutter/material.dart';

class PersonalCategoryWidget extends StatelessWidget {
  final String label;
  final String iconLabel;
  final List<PersonalCategoryFieldWidget> option;
  final Color? iconColor;
  const PersonalCategoryWidget({
    Key? key,
    required this.option,
    this.label = '',
    this.iconLabel = '',
    this.iconColor,
  }) : super(key: key);

  Widget _widget(double width) => SizedBox(width: width);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Builder(builder: (_) {
        if (option.length == 1) return _buildSingleOption(context);
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: CommonColor.vhe10colorBorderCard),
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            color: CommonColor.white,
            boxShadow: CommonColor.vhe10DropShadow,
          ),
          child: Column(
            children: <Widget>[_buildTitle(context), ...option],
          ),
        );
      }),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: CommonColor.vhe10colorBorderCard))),
      child: Row(
        children: <Widget>[
          Images.svgAssets(iconLabel, height: 20, width: 20, color: iconColor),
          _widget(10),
          Text(AppLocalizations.of(context)!.translate(label),
              style: textStyleBodyDefaultBold.copyWith(color: kTextColor))
        ],
      ),
    );
  }

  Widget _buildSingleOption(BuildContext context) {
    return BndTouch(
      onPressed: () => option[0].onTap(),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: CommonColor.vhe10colorBorderCard),
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          color: CommonColor.white,
          boxShadow: CommonColor.vhe10DropShadow,
        ),
        child: Row(
          children: <Widget>[
            Images.svgAssets(iconLabel, height: 20, width: 20, color: iconColor),
            _widget(10),
            Text(AppLocalizations.of(context)!.translate(option[0].label),
                style: textStyleBodyMedium.copyWith(
                    color: CommonColor.cricleBackgroundColor, fontWeight: FontWeight.w600)),
            const Spacer(),
            option[0].amount > 0
                ? Container(
                    // width: 16,
                    height: 16,
                    alignment: Alignment.center,
                    child: Text(
                      option[0].amount.toString(),
                      style: textStyleBodySmall.copyWith(color: CommonColor.cricleBackgroundColor.withOpacity(0.5)),
                    ),
                  )
                : _widget(0),
            const Icon(Icons.keyboard_arrow_right, color: kTextColor, size: 24)
          ],
        ),
      ),
    );
  }
}
