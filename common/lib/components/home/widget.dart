import 'package:common/common/color/common_color.dart';
import 'package:core/common/text_style.dart';
import 'package:core/language/app_localizations.dart';
import 'package:flutter/material.dart';

class HomeTitleWidget extends StatelessWidget {
  final String title;
  final Icon? iconRight;
  final VoidCallback? onPressed;
  final TextStyle? style;
  final int totalCount;
  final bool isShowAction;

  HomeTitleWidget({
    Key? key,
    required this.title,
    this.iconRight,
    this.onPressed,
    this.totalCount = 0,
    this.style,
    this.isShowAction = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Container(
          margin: const EdgeInsetsDirectional.only(start: 16),
          child: Row(
            // ignore: always_specify_types
            children: [
              Expanded(
                  child: Text(
                title,
                style: style ?? textStyleBodyLargeBold.copyWith(color: CommonColor.textColor),
              )),
              if (isShowAction)
                Builder(builder: (_) {
                  if (totalCount > 0) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(AppLocalizations.of(context)!.translate('all'),
                            style: textStyleBodySmall.copyWith(color: CommonColor.textColor)),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        //   child: VGECircleTextWidget(amount: totalCount, color: CustomTheme.vhe8_1CategoryCountColor),
                        // ),
                        Icon(
                          Icons.navigate_next,
                          color: CommonColor.textColor,
                        )
                      ],
                    );
                  } else {
                    return Container(
                      alignment: AlignmentDirectional.centerEnd,
                      child: iconRight ??
                          Icon(
                            Icons.navigate_next,
                            color: CommonColor.textColor,
                          ),
                    );
                  }
                })
            ],
          ),
        ));
  }
}
