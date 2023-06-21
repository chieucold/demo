import 'package:core/common/extension/string_extension.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OTPShowWidget extends StatefulWidget {
  const OTPShowWidget({
    Key? key,
    this.dotColor = const Color(0xffB2BAC8),
    required this.otpCode,
    this.textStyle = const TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
  }) : super(key: key);

  final Color dotColor;
  final String otpCode;
  final TextStyle textStyle;

  @override
  _OTPShowWidgetState createState() => _OTPShowWidgetState();
}

class _OTPShowWidgetState extends State<OTPShowWidget> {
  final int _lengthOtp = 6;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.fromLTRB(16.sp, 0, 16.sp, 0),
      child: Stack(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List<Widget>.generate(
                    _lengthOtp,
                    (int index) => DottedBorder(
                      borderType: BorderType.RRect,
                      color: widget.dotColor,
                      radius: Radius.circular(6.sp),
                      dashPattern: <double>[6, 3],
                      child: Container(
                        height: 52.sp,
                        width: 43.sp,
                        child: Center(
                          child: Text(
                            widget.otpCode.isNullOrEmpty ? '' : widget.otpCode[index],
                            style: widget.textStyle,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
