import 'package:core/components/form/form_builder_field.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BNDRadio<T> extends FormBuilderField<T> {
  BNDRadio(
      {Key? key,
      String name = "radio",
      InputDecoration decoration = const InputDecoration(border: InputBorder.none, enabledBorder: InputBorder.none),
      this.groupValue,
      this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      this.textStyle,
      this.activeColor = const Color(0xff414B5B),
      ValueChanged<T?>? onChanged,
      FormFieldValidator<T?>? validator,
      AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
      this.text = "",
      this.value})
      : super(
          key: key,
          name: name,
          onChanged: onChanged,
          validator: validator,
          autovalidateMode: autovalidateMode,
          builder: (FormFieldState<T?> field) {
            final _BNDRadiotate<T> state = field as _BNDRadiotate<T>;
            return InputDecorator(
              decoration: decoration,
              child: state.buildBody(state.context),
            );
          },
        );

  final EdgeInsets padding;
  final TextStyle? textStyle;
  final Color activeColor;
  final String text;
  final T? value;
  T? groupValue;

  @override
  _BNDRadiotate<T> createState() => _BNDRadiotate<T>();
}

class _BNDRadiotate<T> extends FormBuilderFieldState<BNDRadio<T>, T> {
  bool isShowSelect = false;
  EdgeInsets get padding => widget.padding;
  bool isFirstLoad = true;

  T? get radioValue => widget.value;
  T? groupValue;

  @override
  void initState() {
    super.initState();
    groupValue = widget.groupValue;
  }

  @override
  void didUpdateWidget(covariant BNDRadio<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    print(widget.groupValue);
    if (oldWidget.groupValue != widget.groupValue) {
      setState(() {
        groupValue = widget.groupValue;
      });
    }
  }

  Widget buildBody(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 22,
          height: 22,
          margin: const EdgeInsets.only(right: 12),
          child: Transform.scale(
            scale: 1.2,
            child: Radio<T?>(
              activeColor: widget.activeColor,
              value: radioValue,
              groupValue: groupValue,
              onChanged: (T? value) {
                groupValue = value;
                onChanged(radioValue);
              },
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              onChanged(radioValue);
            },
            child: Text(widget.text, style: widget.textStyle),
          ),
        )
      ],
    );
  }

  void onChanged(T? data, {bool isFirstLoad = false}) {
    if (!isFirstLoad)
      setState(() {
        didChange(data);
      });
  }
}
