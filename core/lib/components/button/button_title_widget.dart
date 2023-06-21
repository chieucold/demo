import 'package:core/common/color/core_color.dart';
import 'package:core/common/text_style.dart';
import 'package:core/components/bnd_touch.dart';
import 'package:core/components/button/circle_text_widget.dart';
import 'package:core/language/app_localizations.dart';
import 'package:flutter/material.dart';

class ButtonTitleWidget extends StatelessWidget {
  final String title;
  final Icon? iconRight;
  final VoidCallback? onPressed;
  final TextStyle? style;
  final int totalCount;
  final bool isShowAction;
  final EdgeInsets? margin;

  ButtonTitleWidget({
    Key? key,
    required this.title,
    this.iconRight,
    this.onPressed,
    this.style,
    this.totalCount = 0,
    this.isShowAction = true,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return onPressed != null
        // ? TextButton(
        //     onPressed: onPressed,
        //     child: _buildChild(context)
        //   )
        ? BndTouch(
            onPressed: onPressed,
            child: _buildChild(context),
          )
        : _buildChild(context);
  }

  Widget _buildChild(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: margin ?? CoreColor.paddingBodyDefault,
          child: Row(
            // ignore: always_specify_types
            children: [
              Expanded(
                  child: Container(
                      child: Text(
                title,
                style: style ?? textStyleBodyLargeBold.copyWith(color: CoreColor.textColor),
              ))),
              if (isShowAction) ...[
                if (totalCount != null && totalCount > 0)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(AppLocalizations.of(context)!.translate('all'),
                          style: textStyleBodySmall.copyWith(color: kTextColor)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: CircleTextWidget(amount: totalCount, color: CoreColor.vhe8_1CategoryCountColor),
                      ),
                      Icon(
                        Icons.navigate_next,
                        color: CoreColor.textColor,
                      )
                    ],
                  )
                else
                  Container(
                    alignment: AlignmentDirectional.centerEnd,
                    child: iconRight ??
                        Icon(
                          Icons.navigate_next,
                          size: 24,
                          color: CoreColor.textColor,
                        ),
                  )
              ]
            ],
          ),
        ),
      ],
    );
  }
}
