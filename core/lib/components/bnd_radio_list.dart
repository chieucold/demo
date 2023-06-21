import 'package:core/common/utils/app_utils.dart';
import 'package:core/components/form/form_builder_field.dart';
import 'package:core/components/html/text_html_widget.dart';
import 'package:core/language/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

// ignore: must_be_immutable
class BNDRadioList<T> extends FormBuilderField<T> {
  BNDRadioList({
    Key? key,
    String name = "radio",
    InputDecoration decoration = const InputDecoration(border: InputBorder.none, enabledBorder: InputBorder.none),
    T? initialValue,
    required this.items,
    this.propertyTitleName = "title",
    this.propertyIdName = "id",
    this.isReturnObject = true,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    this.textStyle,
    this.activeColor = const Color(0xff414B5B),
    this.scrollDirection = Axis.vertical,
    ValueChanged<T?>? onChanged,
    FormFieldValidator<T?>? validator,
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
    this.nonTitleOddItem = false,
    this.enable = true,
    this.isTranslate = false,
    this.isSameLine = false,
    this.isHtmlText = false,
    this.answerTitles,
  }) : super(
          key: key,
          name: name,
          onChanged: onChanged,
          initialValue: initialValue,
          validator: validator,
          autovalidateMode: autovalidateMode,
          builder: (FormFieldState<T?> field) {
            final _BNDRadioListState<T> state = field as _BNDRadioListState<T>;
            return InputDecorator(
              decoration: decoration,
              child: state.buildBody(state.context),
            );
          },
        );

  final List<Object> items;
  final bool isReturnObject;
  final String propertyIdName;
  final String propertyTitleName;
  final EdgeInsets padding;
  final TextStyle? textStyle;
  final Color activeColor;
  final Axis scrollDirection;
  final bool isSameLine;
  final bool nonTitleOddItem;
  final bool enable;
  final bool isTranslate;
  final bool isHtmlText;
  final List<Widget>? answerTitles;

  @override
  _BNDRadioListState<T> createState() => _BNDRadioListState<T>();
}

class _BNDRadioListState<T> extends FormBuilderFieldState<BNDRadioList<T>, T> {
  bool isShowSelect = false;
  Object? selectedValue;
  List<Object> get items => widget.items;
  //String title = "";
  EdgeInsets get padding => widget.padding;
  String get propertyIdName => widget.propertyIdName;
  bool isFirstLoad = true;

  @override
  void initState() {
    super.initState();
    selectedValue = getItem();
    print(selectedValue);
  }

  @override
  void didUpdateWidget(FormField<T?> oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  Widget buildBody(BuildContext context) {
    if (widget.scrollDirection == Axis.horizontal) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          for (final Object item in items)
            Flexible(
              child: GestureDetector(
                onTap: widget.enable ? () => onChanged(item) : null,
                child: Container(
                  // padding: const EdgeInsets.only(right: 24),
                  color: Colors.transparent,
                  margin: items.indexOf(item) < items.length - 1 ? const EdgeInsets.only() : const EdgeInsets.all(0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 22,
                        height: 22,
                        margin: const EdgeInsets.only(bottom: 6),
                        child: Transform.scale(
                          scale: 1.2,
                          child: Radio<Object>(
                            activeColor: widget.activeColor,
                            value: item,
                            groupValue: selectedValue,
                            onChanged: widget.enable ? (Object? value) => onChanged(value) : null,
                          ),
                        ),
                      ),
                      if (items.indexOf(item) % 2 == 0 || !widget.nonTitleOddItem)
                        widget.isHtmlText
                            ? TextHtmlWidget(widget.propertyTitleName)
                            : Text(
                                widget.isTranslate
                                    ? AppLocalizations.of(context)!.translate(
                                        Utils.getPropertyValueByName<String>(item, widget.propertyTitleName) ?? "")
                                    : Utils.getPropertyValueByName<String>(item, widget.propertyTitleName) ?? "",
                                style: widget.textStyle,
                                textAlign: TextAlign.center,
                              )
                    ],
                  ),
                ),
              ),
            ),
        ],
      );
    }
    if (widget.isSameLine) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            for (final Object item in items)
              GestureDetector(
                onTap: widget.enable ? () => onChanged(item) : null,
                child: Container(
                  color: Colors.transparent,
                  margin: items.indexOf(item) < items.length - 1
                      ? const EdgeInsets.only(right: 32)
                      : const EdgeInsets.all(0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 22,
                        height: 22,
                        margin: const EdgeInsets.only(right: 12),
                        child: Transform.scale(
                          scale: 1.2,
                          child: Radio<Object>(
                            activeColor: widget.activeColor,
                            value: item,
                            groupValue: selectedValue,
                            onChanged: widget.enable ? (Object? value) => onChanged(value) : null,
                          ),
                        ),
                      ),
                      // const SizedBox(width: 12),
                      Text(Utils.getPropertyValueByName<String>(item, widget.propertyTitleName) ?? "",
                          style: widget.textStyle)
                    ],
                  ),
                ),
              ),
          ],
        ),
      );
    }
    return Column(
      children: <Widget>[
        for (final Object item in items)
          GestureDetector(
            onTap: widget.enable ? () => onChanged(item) : null,
            child: Container(
              color: Colors.transparent,
              margin:
                  items.indexOf(item) < items.length - 1 ? const EdgeInsets.only(bottom: 16) : const EdgeInsets.all(0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 22,
                    height: 22,
                    margin: const EdgeInsets.only(right: 12),
                    child: Transform.scale(
                      scale: 1.2,
                      child: Radio<Object>(
                        activeColor: widget.activeColor,
                        value: item,
                        groupValue: selectedValue,
                        onChanged: widget.enable ? (Object? value) => onChanged(value) : null,
                      ),
                    ),
                  ),
                  widget.answerTitles != null
                      ? Expanded(child: widget.answerTitles![items.indexOf(item)])
                      : widget.isHtmlText
                          ? Expanded(
                              child: TextHtmlWidget(
                              Utils.getPropertyValueByName<String>(item, widget.propertyTitleName) ?? "",
                            ))
                          : Expanded(
                              child: Text(Utils.getPropertyValueByName<String>(item, widget.propertyTitleName) ?? "",
                                  style: widget.textStyle),
                            )
                ],
              ),
            ),
          ),
      ],
    );
  }

  // void changeTitle() {
  //   title = Utils.getPropertyValueByName<String>(
  //           selectedValue, widget.propertyTitleName) ??
  //       "";
  // }

  void onChanged(Object? data, {bool isFirstLoad = false}) {
    if (!isFirstLoad)
      setState(() {
        selectedValue = data; //changeTitle();
      });

    final T? temp = getValue(data);
    didChange(temp);
  }

  T? getValue(Object? data) {
    if (widget.isReturnObject) {
      return data as T?;
    } else {
      final T? value = Utils.getPropertyValueByName<T>(selectedValue, propertyIdName);
      return value;
    }
  }

  Object? getItem() {
    Map<String, dynamic> temp;
    if (propertyIdName.isNotEmpty && initialValue != null) {
      return items.firstWhereOrNull((Object element) {
        if (element == null) return false;
        temp = Utils.convertObjectToMap(element);
        return temp[propertyIdName] == initialValue;
      });
    }
  }
}
