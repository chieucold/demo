import 'package:core/common/text_style.dart';
import 'package:core/components/bnd_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vitan_edu/core/theme/custom.dart';

class LoginTextFieldWidget extends StatelessWidget {
  final Object? initialValue;
  final TextEditingController? controller;
  final String labelText;
  final bool obscureText;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? textInputType;
  final int? maxLength;
  final bool enabled;
  final EdgeInsetsGeometry? contentPadding;
  const LoginTextFieldWidget({
    Key? key,
    this.initialValue,
    this.controller,
    this.labelText = '',
    this.obscureText = false,
    this.suffixIcon,
    this.inputFormatters,
    this.textInputType,
    this.maxLength,
    this.enabled = true,
    this.contentPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BNDTextField(
      autofocus: true,
      maxLines: 1,
      obscureText: obscureText,
      initialValue: initialValue,
      controller: controller,
      labelText: labelText,
      textInputType: textInputType,
      inputFormatters: inputFormatters,
      maxLength: maxLength,
      enabled: enabled,
      textCapitalization: TextCapitalization.none,
      labelTextStyle:
          textStyleBodySmall.copyWith(color: CustomTheme.vhsTextFormWeb, fontSize: 16, fontWeight: FontWeight.w400),
      style: textStyleBodyDefault.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w400),
      decoration: InputDecoration(
        contentPadding: contentPadding ?? CustomTheme.paddingBodyDefault.copyWith(top: 16, bottom: 16),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(color: CustomTheme.vhsTextFormWeb)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(color: CustomTheme.vhsTextFormWeb)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(color: CustomTheme.vhsTextFormWeb)),
        filled: true,
        fillColor: Colors.white70,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
