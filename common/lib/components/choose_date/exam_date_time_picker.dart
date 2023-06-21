import 'package:common/common/theme/form_setting.dart';
import 'package:core/assets/images/images.dart';
import 'package:core/components/bnd_date_time_picker.dart';
import 'package:core/common/text_style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class ExamDateTimePicker extends BNDDateTimePicker {
  ExamDateTimePicker(
      {Key? key,
      bool isDefault = false,
      DateFormat? format,
      String? name,
      DateTime? initialValue,
      FormFieldValidator<DateTime?>? validator,
      TextStyle? style,
      ValueChanged<DateTime?>? onChanged,
      Color? backgroundColor,
      TextEditingController? timeController,
      InputDecoration? decoration,
      EdgeInsets? contentPadding,
      bool isShowLeftIcon = true,
      InputType inputType = InputType.date,
      bool isShowRightIcon = false,
      double? sizeHeight,
      bool? isShowAfterTime})
      : super(
          key: key,
          onChanged: onChanged,
          name: name ?? "dateTime",
          decoration: isDefault ? inputDecorationNone : decoration ?? dateTimePickerDecoration,
          controller: timeController,
          backgroundColor: isDefault ? Colors.transparent : backgroundColor ?? Colors.white,
          style: style ?? textStyleBodyMedium.copyWith(fontWeight: FontWeight.w600),
          contentPadding: contentPadding ?? const EdgeInsets.symmetric(vertical: 12),
          validator: validator,
          leftIcon: isShowLeftIcon ? DateTimeIconLeft() : null,
          initialValue: initialValue,
          inputType: inputType,
          format: format,
          sizeHeight: sizeHeight,
          isShowAfterTime: isShowAfterTime ?? true,
          rightIcon: isShowRightIcon ? DateTimeIconRight() : null,
        );
}

Widget DateTimeIconLeft() {
  return Container(
    width: 40,
    height: 20,
    color: Colors.transparent,
    child: Align(
      alignment: Alignment.center,
      child: Images.svgAssets(
        Images.icCalendar,
        width: 14,
        height: 14,
      ),
    ),
  );
}

Widget DateTimeIconRight() {
  return Container(
    width: 40,
    height: 20,
    color: Colors.transparent,
    child: Align(
      alignment: Alignment.center,
      child: Images.svgAssets(
        Images.icCalendar2,
        width: 14,
        height: 14,
      ),
    ),
  );
}
