import 'package:core/assets/images/images.dart';
import 'package:core/components/button/circle_button_widget.dart';
import 'package:flutter/material.dart';

class CommonLeadingWidget extends StatelessWidget {
  final VoidCallback? onPress;
  final Color? iconColor;
  final double? paddingLeft;
  final AlignmentGeometry? alignment;

  CommonLeadingWidget({Key? key, this.onPress, this.iconColor = Colors.white, this.paddingLeft , this.alignment = Alignment.center}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CircleButtonWidget(
      padding: EdgeInsets.zero,
      onTap: onPress ??
          () {
            Navigator.of(context).pop();
          },
      iconWidget: Container(
        padding: EdgeInsets.only(left: paddingLeft??  10, right: 10),
        alignment: alignment ,
        color: Colors.transparent,
        child: Images.svgAssets(Images.icChevronLeft, color: iconColor, height: 14),
      ),
    );
  }
}
