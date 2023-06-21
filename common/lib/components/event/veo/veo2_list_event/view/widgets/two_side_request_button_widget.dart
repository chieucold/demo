import 'package:common/components/event/veo/veo2_list_event/view/widgets/button_request_widget.dart';
import 'package:core/common/color/core_color.dart';
import 'package:flutter/material.dart';

class TwoSideRequestButtonWidget extends StatelessWidget {
  final String leftTitle;
  final String rightTitle;
  final VoidCallback onLeftPress;
  final VoidCallback onRightPress;
  final Color? borderLeftColor;
  final Color? borderRightColor;
  final EdgeInsets? padding;
  final TextStyle? textStyleLeft;
  final TextStyle? textStyleRight;

  TwoSideRequestButtonWidget(
      {Key? key,
      required this.leftTitle,
      required this.rightTitle,
      required this.onLeftPress,
      required this.onRightPress,
      this.borderLeftColor,
      this.borderRightColor,
      this.padding,
      this.textStyleRight,
      this.textStyleLeft})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ButtonRequestWidget(
          title: leftTitle,
          borderColor: borderLeftColor ?? CoreColor.requestBtnAcceptColor,
          onPress: onLeftPress,
          textColor: borderLeftColor ?? CoreColor.requestBtnAcceptColor,
          padding: padding,
          textStyle: textStyleLeft,
        ),
        const SizedBox(
          width: 12,
        ),
        ButtonRequestWidget(
          title: rightTitle,
          borderColor: borderRightColor ?? CoreColor.requestBtnDeniedColor,
          onPress: onRightPress,
          padding: padding,
          textStyle: textStyleRight,
        ),
      ],
    );
  }
}
