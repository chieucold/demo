import 'package:core/components/form/form_builder_field.dart';
import 'package:flutter/material.dart';
import 'package:core/common/extension/string_extension.dart';

// ignore: must_be_immutable
class BNDDateTimePickerDropdown extends FormBuilderField<DateTime> {
  final bool isDropdownHideUnderline;
  final int startYear;
  final int? endYear;
  final double dropDownExpandMaxHeight;
  final InputDecoration? dropDecoration;

  BNDDateTimePickerDropdown({
    Key? key,
    //From Super
    required String name,
    FormFieldValidator<DateTime>? validator,
    DateTime? initialValue,
    InputDecoration decoration = const InputDecoration(),
    ValueChanged<DateTime?>? onChanged,
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
    this.isDropdownHideUnderline = false,
    this.startYear = 1900,
    this.dropDownExpandMaxHeight = 300,
    this.endYear,
    this.dropDecoration,
  }) : super(
          key: key,
          initialValue: initialValue,
          name: name,
          validator: validator,
          onChanged: onChanged,
          autovalidateMode: autovalidateMode,
          builder: (FormFieldState<DateTime?> field) {
            final _BNDDateTimePickerDropdownState state = field as _BNDDateTimePickerDropdownState;

            late InputDecoration decoration =
                state.decoration().copyWith(border: OutlineInputBorder(borderRadius: BorderRadius.circular(70)));

            return state.buildBody(state.context, decoration);
          },
        );

  @override
  _BNDDateTimePickerDropdownState createState() => _BNDDateTimePickerDropdownState();
}

class _BNDDateTimePickerDropdownState extends FormBuilderFieldState<BNDDateTimePickerDropdown, DateTime> {
  String monthselVal = '';
  String dayselVal = '';
  String yearselVal = '';
  int daysIn = 32;
  late List<int> listdates = <int>[];
  late List<int> listyears = <int>[];
  late List<dynamic> listMonths = <dynamic>[];
  double get _dropDownExpandMaxHeight => widget.dropDownExpandMaxHeight;

  @override
  void initState() {
    super.initState();
    listdates = Iterable<int>.generate(daysIn).skip(1).toList();
    listyears = Iterable<int>.generate((widget.endYear ?? DateTime.now().year) + 1)
        .skip(widget.startYear)
        .toList()
        .reversed
        .toList();

    listMonths = <dynamic>[
      {"id": 1, "value": "Tháng 1"},
      {"id": 2, "value": "Tháng 2"},
      {"id": 3, "value": "Tháng 3"},
      {"id": 4, "value": "Tháng 4"},
      {"id": 5, "value": "Tháng 5"},
      {"id": 6, "value": "Tháng 6"},
      {"id": 7, "value": "Tháng 7"},
      {"id": 8, "value": "Tháng 8"},
      {"id": 9, "value": "Tháng 9"},
      {"id": 10, "value": "Tháng 10"},
      {"id": 11, "value": "Tháng 11"},
      {"id": 12, "value": "Tháng 12"}
    ];
    setValueFromInitialValue();
  }

  void setValueFromInitialValue() {
    if (initialValue != null) {
      monthselVal = initialValue!.month.toString();
      dayselVal = initialValue!.day.toString();
      yearselVal = initialValue!.year.toString();
    }
  }

  @override
  void didUpdateWidget(covariant FormField<DateTime?> oldWidget) {
    if (oldWidget.initialValue != widget.initialValue) {
      setValue(widget.initialValue);
      setState(() {
        setValueFromInitialValue();
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  ///update function
  void update() {
    setState(() {});
    if (!monthselVal.isNullOrEmpty && !yearselVal.isNullOrEmpty && !dayselVal.isNullOrEmpty)
      didChange(DateTime(
        int.parse(yearselVal),
        int.parse(monthselVal),
        int.parse(dayselVal),
      ));
    else
      didChange(null);
  }

  Widget buildBody(BuildContext context, InputDecoration decoration) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 3,
          child: ButtonTheme(
            alignedDropdown: true,
            child: widget.isDropdownHideUnderline
                ? DropdownButtonHideUnderline(
                    child: dayDropdown(),
                  )
                : dayDropdown(),
          ),
        ),
        Expanded(
          flex: 4,
          child: ButtonTheme(
            alignedDropdown: true,
            child: widget.isDropdownHideUnderline
                ? DropdownButtonHideUnderline(
                    child: _monthDropdown(),
                  )
                : _monthDropdown(),
          ),
        ),
        Expanded(
          flex: 3,
          child: ButtonTheme(
            alignedDropdown: true,
            child: widget.isDropdownHideUnderline
                ? DropdownButtonHideUnderline(
                    child: yearDropdown(),
                  )
                : yearDropdown(),
          ),
        ),
      ],
    );
  }

  ///month dropdown
  DropdownButtonFormField<String> _monthDropdown() {
    return DropdownButtonFormField<String>(
        menuMaxHeight: _dropDownExpandMaxHeight,
        decoration: widget.dropDecoration ?? (widget.isDropdownHideUnderline ? removeUnderline() : null),
        hint: const Text('Tháng'),
        icon: const Icon(Icons.expand_more, color: Colors.grey),
        value: monthselVal == '' ? null : monthselVal,
        onChanged: (String? value) {
          monthSelected(value ?? "");
        },
        validator: (String? value) {
          // return widget.isFormValidator
          //     ? value == null
          //         ? widget.errorMonth
          //         : null
          //     : null;
        },
        items: listMonths.map((dynamic item) {
          return DropdownMenuItem<String>(
            value: item["id"].toString(),
            child: Text(
              item["value"].toString(),
              // style:
              //     widget.textStyle ?? const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
            ),
          );
        }).toList());
  }

  ///Remove underline from dropdown
  InputDecoration removeUnderline() {
    return const InputDecoration(enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)));
  }

  ///Month selection dropdown function
  void monthSelected(String value) {
    monthselVal = value;
    final int days = daysInMonth(yearselVal == '' ? DateTime.now().year : int.parse(yearselVal), int.parse(value));
    listdates = Iterable<int>.generate(days + 1).skip(1).toList();
    checkDates(days);
    update();
  }

  ///find days in month and year
  int daysInMonth(int year, int month) =>
      DateTimeRange(start: DateTime(year, month, 1), end: DateTime(year, month + 1)).duration.inDays;

  void checkDates(int days) {
    if (dayselVal != '') {
      if (int.parse(dayselVal) > days) {
        dayselVal = '';
        //didUpdateWidget();
      }
    }
  }

  ///year dropdown
  DropdownButtonFormField<String> yearDropdown() {
    return DropdownButtonFormField<String>(
        menuMaxHeight: _dropDownExpandMaxHeight,
        decoration: widget.dropDecoration ?? (widget.isDropdownHideUnderline ? removeUnderline() : null),
        hint: const Text('Năm'),
        // isExpanded: widget.isExpanded,
        icon: const Icon(Icons.expand_more, color: Colors.grey),
        value: yearselVal == '' ? null : yearselVal,
        onChanged: (String? value) {
          yearsSelected(value ?? "");
        },
        // validator: (value) {
        //   return widget.isFormValidator
        //       ? value == null
        //           ? widget.errorYear
        //           : null
        //       : null;
        // },
        items: listyears.map((int item) {
          return DropdownMenuItem<String>(
            value: item.toString(),
            child: Text(
              item.toString(),
              // style:
              //     widget.textStyle ?? const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
            ),
          );
        }).toList());
  }

  void yearsSelected(String value) {
    // widget.onChangedYear!(value);
    yearselVal = value;
    if (monthselVal != '') {
      final int days =
          daysInMonth(yearselVal == '' ? DateTime.now().year : int.parse(yearselVal), int.parse(monthselVal));
      listdates = Iterable<int>.generate(days + 1).skip(1).toList();
      checkDates(days);
      update();
    }
    update();
  }

  ///day dropdown
  DropdownButtonFormField<String> dayDropdown() {
    return DropdownButtonFormField<String>(
        menuMaxHeight: _dropDownExpandMaxHeight,
        decoration: widget.dropDecoration ?? (widget.isDropdownHideUnderline ? removeUnderline() : null),
        hint: const Text('Ngày'),
        // isExpanded: widget.isExpanded,
        icon: const Icon(Icons.expand_more, color: Colors.grey),
        value: dayselVal == '' ? null : dayselVal,
        onChanged: (String? value) {
          daysSelected(value ?? "");
        },
        // validator: (value) {
        //   return widget.isFormValidator
        //       ? value == null
        //           ? widget.errorDay
        //           : null
        //       : null;
        // },
        items: listdates.map((int item) {
          return DropdownMenuItem<String>(
            value: item.toString(),
            child: Text(
              item.toString(),
              // style:
              //     widget.textStyle ?? const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
            ),
          );
        }).toList());
  }

  void daysSelected(String value) {
    // widget.onChangedDay!(value);
    dayselVal = value;
    update();
  }
}
