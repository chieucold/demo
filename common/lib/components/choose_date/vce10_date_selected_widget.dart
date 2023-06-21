import 'package:common/common/color/common_color.dart';
import 'package:common/common/theme/form_setting.dart';
import 'package:common/components/choose_date/exam_date_time_picker.dart';
import 'package:common/components/choose_date/fieldset_widget.dart';
import 'package:core/common/color/core_color.dart';
import 'package:core/components/bnd_date_time_picker.dart';
import 'package:core/components/form/form_builder_validators.dart';
import 'package:core/language/app_localizations.dart';
import 'package:core/common/text_style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class VCE10DateSelectedWidget extends StatefulWidget {
  final DateTime? fromDate;
  final DateTime? toDate;
  final Function getDate;

  VCE10DateSelectedWidget({Key? key, this.fromDate, this.toDate, required this.getDate}) : super(key: key);

  @override
  _VCE10DateSelectedWidgetState createState() => _VCE10DateSelectedWidgetState();
}

class _VCE10DateSelectedWidgetState extends State<VCE10DateSelectedWidget> {
  bool validate = true;

  @override
  void initState() {
    // fromDate = widget.fromDate;
    // toDate = widget.toDate;
    super.initState();
  }

  bool _checkValidate(DateTime? _fromDate, DateTime? _toDate) {
    if (_fromDate == null || _toDate == null) return true;
    return _fromDate.isBefore(_toDate);
  }

  @override
  Widget build(BuildContext context) {
    late DateTime? fromDate = widget.fromDate;
    late DateTime? toDate = widget.toDate;
    return Container(
        padding: CommonColor.paddingBodyDefault.copyWith(
          top: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(
              child: _dateSelectedWidget(
                context,
                AppLocalizations.of(context)!.translate("from_date"),
                'fromDate',
                validateDateTime: validate,
                initDate: fromDate,
                getDate: (DateTime _date) {
                  setState(() {
                    fromDate = _date;
                    validate = _checkValidate(fromDate, toDate);
                    widget.getDate(fromDate, toDate, validate);
                  });
                },
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _dateSelectedWidget(
                context,
                AppLocalizations.of(context)!.translate("to_date"),
                'toDate',
                initDate: toDate,
                validateDateTime: validate,
                getDate: (DateTime _date) {
                  setState(() {
                    toDate = _date;
                    validate = _checkValidate(fromDate, toDate);
                    widget.getDate(fromDate, toDate, validate);
                  });
                },
              ),
            ),
          ],
        ));
  }

  Widget _dateSelectedWidget(BuildContext context, String title, String name,
      {DateTime? initDate, required Function getDate, bool validateDateTime = true}) {
    DateTime? selectedDate = initDate;
    final DateTime now = DateTime.now();
    return FieldSetWidget(
        title,
        ExamDateTimePicker(
          format: DateFormat.yMd(),
          inputType: InputType.date,
          isShowRightIcon: true,
          isShowLeftIcon: false,
          isDefault: true,
          sizeHeight: 34,
          backgroundColor: Colors.transparent,
          decoration: getInputDecorationNone(),
          validator: FormBuilderValidators.dateGreaterThanNow(context),
          initialValue: selectedDate ?? now,
          style: textStyleBodyDefault.copyWith(color: kTextColor, fontSize: 16),
          name: name,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          onChanged: (DateTime? _datetime) {
            if (_datetime != null && _datetime != selectedDate) {
              selectedDate = _datetime;
              getDate(_datetime);
              setState(() {});
            }
          },
        ),
        titleTextStyle: textStyleBodySmall.copyWith(
          color: CommonColor.vce10LabelColor,
          fontWeight: FontWeight.w400,
        ),
        legendFontSize: 16,
        padding: const EdgeInsets.only(top: 8, left: 0, right: 0),
        borderRadius: 70,
        borderColor: validateDateTime ? CommonColor.fieldSetBorderColor : CommonColor.validateColor);
  }
}
