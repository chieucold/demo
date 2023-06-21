import 'package:core/assets/images/images.dart';
import 'package:core/common/color/core_color.dart';
import 'package:core/components/button/border_button_widget.dart';
import 'package:core/components/button/primary_button_widget.dart';
import 'package:core/language/app_localizations.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:core/common/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BndBottomSheetWidget extends StatelessWidget {
  final String? alertContent;
  final String labelButton1;
  final String labelButton2;
  final String? iconName;
  final String? titleName;
  final Widget? icon;
  final VoidCallback? onPressButton1;
  final VoidCallback? onPressButton2;
  final String? description;
  final Gradient? iconGradientColor;
  final Color? dottedBorderColor;
  final VoidCallback? onClear;
  final int maxLineDescription;

  const BndBottomSheetWidget(
      {Key? key,
      this.alertContent,
      this.labelButton1 = "",
      this.iconName,
      this.icon,
      this.titleName,
      this.labelButton2 = "",
      this.onPressButton1,
      this.onPressButton2,
      this.description,
      this.iconGradientColor,
      this.dottedBorderColor,
      this.onClear,
      this.maxLineDescription = 6})
      : super(key: key);

  Widget _height(double height) => SizedBox(height: height);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        final bool isLandscape = orientation == Orientation.landscape;
        return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20)
                .copyWith(top: isLandscape ? 13 : 26, bottom: isLandscape ? 24 : 49),
            decoration: BoxDecoration(
                color: CoreColor.textWhiteColor,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: isLandscape ? 24 : 0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      onTap: onClear ?? () => Navigator.of(context).pop(),
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        color: Colors.transparent,
                        child: Images.svgAssets(
                          Images.icClear,
                          package: 'core',
                          width: 14,
                          height: 14,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32.0),
                  child: Text(titleName ?? AppLocalizations.of(context)!.translate('cancel'),
                      style: textStyleBodyMediumBold),
                ),
                DottedBorder(
                  padding: const EdgeInsets.all(10),
                  radius: const Radius.circular(16),
                  color: dottedBorderColor ?? CoreColor.borderRedDottedColor,
                  borderType: BorderType.Circle,
                  child: Container(
                    height: 90,
                    width: 90,
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, gradient: iconGradientColor ?? CoreColor.dottedRedColor),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        icon ?? Images.svgAssets(iconName ?? Images.icChangeCompetition),
                        _height(2),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(32.sp, 18.sp, 32.sp, 24.sp),
                  child: Text(
                    description ?? AppLocalizations.of(context)!.translate('not_complete_answer_for_question'),
                    style: textStyleBodyDefault.copyWith(color: CoreColor.textColor),
                    textAlign: TextAlign.center,
                    maxLines: maxLineDescription,
                  ),
                ),
                onPressButton1 != null || onPressButton2 != null
                    ? Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: BorderButtonWidget(
                                  iconSize: 0,
                                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
                                  onPressed: () {
                                    if (onPressButton1 != null) onPressButton1?.call();
                                  },
                                  title: AppLocalizations.of(context)!.translate(labelButton1).toUpperCase()),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: PrimaryButtonWidget(
                                title: AppLocalizations.of(context)!.translate(labelButton2).toUpperCase(),
                                onPressed: () {
                                  if (onPressButton2 != null) onPressButton2?.call();
                                },
                                iconSize: 0,
                                margin: EdgeInsets.zero,
                                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
                              ),
                            )
                          ],
                        ),
                      )
                    : _height(0),
              ],
            ));
      },
    );
  }
}
