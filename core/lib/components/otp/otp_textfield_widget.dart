import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OTPTextFieldWidget extends StatefulWidget {
  const OTPTextFieldWidget({
    Key? key,
    required this.onComplete,
    this.dotColor = const Color(0xffB2BAC8),
    this.errorColor = Colors.red,
    this.textStyle = const TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
    this.isError = false,
  }) : super(key: key);
  final Color dotColor;
  final Color errorColor;
  final TextStyle textStyle;
  final ValueChanged<String> onComplete;
  final bool isError;
  @override
  _OTPTextFieldState createState() => _OTPTextFieldState();
}

class _OTPTextFieldState extends State<OTPTextFieldWidget> {
  final TextEditingController _otpController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final int _lengthOtp = 6;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.fromLTRB(16.sp, 0, 16.sp, 0),
      child: Stack(
        children: <Widget>[
          Opacity(
            opacity: 0,
            child: TextField(
              autofocus: true,
              toolbarOptions: null,
              controller: _otpController,
              focusNode: _focusNode,
              showCursor: false,
              selectionControls: null,
              maxLength: _lengthOtp,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                filled: true,
                fillColor: Colors.red,
              ),
              onChanged: (String value) {
                setState(() {});
                if (value.length == _lengthOtp) {
                  _focusNode.unfocus();
                  widget.onComplete(value);
                }
              },
              onTap: () {
                _otpController.selection = TextSelection(
                  baseOffset: _otpController.text.length,
                  extentOffset: _otpController.text.length,
                );
              },
            ),
          ),
          Container(
            child: GestureDetector(
              onTap: () {
                _focusNode.requestFocus();
                _otpController.selection = TextSelection(
                  baseOffset: _otpController.text.length,
                  extentOffset: _otpController.text.length,
                );
              },
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List<Widget>.generate(
                      _lengthOtp,
                      (int index) => DottedBorder(
                        borderType: BorderType.RRect,
                        color: _getColorBorder,
                        radius: Radius.circular(6.sp),
                        dashPattern: <double>[6, 3],
                        child: Container(
                          height: 52.sp,
                          width: 43.sp,
                          child: Center(
                            child: Text(
                              _otpController.text.length > index ? _otpController.text.split('')[index] : '',
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
          ),
        ],
      ),
    );
  }

  Color get _getColorBorder {
    if (widget.isError && _otpController.text.length == _lengthOtp) {
      return widget.errorColor;
    }
    return widget.dotColor;
  }
}
