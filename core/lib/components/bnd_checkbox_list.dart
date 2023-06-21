import 'dart:convert';

import 'package:core/common/utils/app_utils.dart';
import 'package:core/components/bnd_checkbox.dart';
import 'package:core/components/form/form_builder_field.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class BNDCheckboxList<T> extends FormBuilderField<List<T>> {
  final List<Object> items;
  final Color? activeColor;
  final Color? checkColor;
  final Color? focusColor;
  final Color? hoverColor;
  final List<T>? disabled;
  final MaterialTapTargetSize? materialTapTargetSize;
  final bool tristate;
  final Axis wrapDirection;
  final WrapAlignment wrapAlignment;
  final double wrapSpacing;
  final WrapAlignment wrapRunAlignment;
  final double wrapRunSpacing;
  final WrapCrossAlignment wrapCrossAxisAlignment;
  final TextDirection? wrapTextDirection;
  final VerticalDirection wrapVerticalDirection;
  final Widget? separator;
  final ControlAffinity controlAffinity;
  final OptionsOrientation orientation;
  final TextStyle? titleTextStyle;
  final EdgeInsets? margin;
  final double scale;
  final bool isReturnObject;
  final String propertyIdName;
  final String propertyTitleName;

  BNDCheckboxList({
    Key? key,
    //From Super
    String name = "checkbox",
    FormFieldValidator<List<T>>? validator,
    List<T>? initialValue,
    InputDecoration decoration = const InputDecoration(
      border: InputBorder.none,
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
    ),
    ValueChanged<List<T>?>? onChanged,
    ValueTransformer<List<T>?>? valueTransformer,
    bool enabled = true,
    FormFieldSetter<List<T>>? onSaved,
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
    VoidCallback? onReset,
    FocusNode? focusNode,
    required this.items,
    this.activeColor,
    this.checkColor,
    this.focusColor,
    this.hoverColor,
    this.disabled,
    this.materialTapTargetSize,
    this.tristate = false,
    this.wrapDirection = Axis.horizontal,
    this.wrapAlignment = WrapAlignment.start,
    this.wrapSpacing = 0.0,
    this.wrapRunAlignment = WrapAlignment.start,
    this.wrapRunSpacing = 0.0,
    this.wrapCrossAxisAlignment = WrapCrossAlignment.start,
    this.wrapTextDirection,
    this.wrapVerticalDirection = VerticalDirection.down,
    this.separator,
    this.controlAffinity = ControlAffinity.leading,
    this.orientation = OptionsOrientation.wrap,
    this.titleTextStyle,
    this.margin,
    this.scale = 1.2,
    this.isReturnObject = true,
    this.propertyTitleName = "title",
    this.propertyIdName = "id",
  }) : super(
          key: key,
          initialValue: initialValue,
          name: name,
          validator: validator,
          valueTransformer: valueTransformer,
          onChanged: onChanged,
          autovalidateMode: autovalidateMode,
          onSaved: onSaved,
          enabled: enabled,
          onReset: onReset,
          decoration: decoration,
          focusNode: focusNode,
          builder: (FormFieldState<List<T>?> field) {
            final _BNDCheckboxListState<T> state = field as _BNDCheckboxListState<T>;
            return InputDecorator(
                decoration: state.decoration(),
                child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (_, int index) {
                      final Object item = items[index];
                      return BNDCheckbox(
                        isAlone: false,
                        activeColor: activeColor,
                        checkColor: checkColor,
                        onChanged: (bool? value) {
                          return state.onChanged(item);
                        },
                        name: '$name _${index.toString()}',
                        titleTextStyle: titleTextStyle,
                        initialValue: state.selectedValues.contains(item),
                        title: Utils.getPropertyValueByName<String>(item, propertyTitleName),
                      );
                    },
                    separatorBuilder: (_, int index) {
                      return separator ?? const SizedBox();
                    },
                    itemCount: items.length));
          },
        );

  @override
  _BNDCheckboxListState<T> createState() => _BNDCheckboxListState<T>();
}

class _BNDCheckboxListState<T> extends FormBuilderFieldState<BNDCheckboxList<T>, List<T>> {
  List<Object> selectedValues = <Object>[];
  List<Object> get items => widget.items;
  String get propertyIdName => widget.propertyIdName;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    selectedValues = getItems();
  }

  void onChanged(Object? data) {
    if (data != null)
      setState(() {
        !selectedValues.contains(data) ? selectedValues.add(data) : selectedValues.remove(data);
      });

    final List<T> temp = value ?? <T>[];
    final T? itemValue = getValue(data);
    if (itemValue != null) !temp.contains(itemValue) ? temp.add(itemValue) : temp.remove(itemValue);
    didChange(temp);
  }

  T? getValue(Object? data) {
    if (widget.isReturnObject) {
      return data as T?;
    } else {
      final T? value = Utils.getPropertyValueByName<T>(data, propertyIdName);
      return value;
    }
  }

  Object? getItem(T value) {
    Map<String, dynamic> temp;
    if (propertyIdName.isNotEmpty)
      return items.firstWhereOrNull((Object element) {
        if (element == null) return false;
        temp = Utils.convertObjectToMap(element);
        return temp[propertyIdName] == value;
      });
  }

  List<Object> getItems() {
    final List<Object> temps = <Object>[];
    if (initialValue != null)
      for (final T item in initialValue!) {
        final Object? temp = getItem(item);
        if (temp != null) temps.add(temp);
      }

    return temps;
  }
}
