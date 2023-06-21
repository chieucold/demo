import 'package:common/common/color/common_color.dart';
import 'package:core/common/color/core_color.dart';
import 'package:core/common/text_style.dart';
import 'package:core/components/bnd_touch.dart';
import 'package:core/language/app_localizations.dart';
import 'package:flutter/material.dart';

class PersonalCategoryFieldWidget extends StatelessWidget {
  final String label;
  final Function onTap;
  final int amount;

  const PersonalCategoryFieldWidget({
    Key? key,
    required this.onTap,
    required this.label,
    this.amount = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BndTouch(
      onPressed: () => onTap(),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        child: Row(
          children: <Widget>[
            Text(AppLocalizations.of(context)!.translate(label),
                style: textStyleBodyMedium.copyWith(
                    color: CommonColor.cricleBackgroundColor, fontWeight: FontWeight.w600)),
            const Spacer(),
            amount > 0
                ? Container(
                    // width: 16,
                    height: 16,
                    alignment: Alignment.center,
                    child: Text(
                      amount.toString(),
                      style: textStyleBodySmall.copyWith(color: CommonColor.cricleBackgroundColor.withOpacity(0.5)),
                    ),
                  )
                : const SizedBox(),
            const Icon(Icons.keyboard_arrow_right, color: kTextColor, size: 24)
          ],
        ),
      ),
    );
  }
}
