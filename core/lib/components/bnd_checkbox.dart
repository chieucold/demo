import 'package:core/components/form/form_builder_field.dart';
import 'package:flutter/material.dart';

class BNDCheckbox extends FormBuilderField<bool> {
  final String? title;

  final TextStyle? titleTextStyle;

  final EdgeInsets? margin;

  final double scale;

  final bool isAlone;

  /// The primary content of the CheckboxListTile.
  ///
  /// Typically a [Text] widget.
  final Widget? titleWidget;

  /// Additional content displayed below the title.
  ///
  /// Typically a [Text] widget.
  //final Widget? subtitle;

  /// A widget to display on the opposite side of the tile from the checkbox.
  ///
  /// Typically an [Icon] widget.
  final Widget? secondary;

  /// The color to use when this checkbox is checked.
  ///
  /// Defaults to accent color of the current [Theme].
  final Color? activeColor;

  /// The color to use for the check icon when this checkbox is checked.
  ///
  /// Defaults to Color(0xFFFFFFFF).
  final Color? checkColor;

  /// Where to place the control relative to its label.
  final ListTileControlAffinity controlAffinity;

  /// Defines insets surrounding the tile's contents.
  ///
  /// This value will surround the [Checkbox], [titleWidget], [subtitle], and [secondary]
  /// widgets in [CheckboxListTile].
  ///
  /// When the value is null, the `contentPadding` is `EdgeInsets.symmetric(horizontal: 16.0)`.
  //final EdgeInsets contentPadding;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// If true the checkbox's [value] can be true, false, or null.
  ///
  /// Checkbox displays a dash when its value is null.
  ///
  /// When a tri-state checkbox ([tristate] is true) is tapped, its [onChanged]
  /// callback will be applied to true if the current value is false, to null if
  /// value is true, and to false if value is null (i.e. it cycles through false
  /// => true => null => false when tapped).
  ///
  /// If tristate is false (the default), [value] must not be null.
  final bool tristate;

  /// Whether to render icons and text in the [activeColor].
  ///
  /// No effort is made to automatically coordinate the [selected] state and the
  /// [value] state. To have the list tile appear selected when the checkbox is
  /// checked, pass the same value to both.
  ///
  /// Normally, this property is left to its default value, false.
  //final bool selected;

  BorderSide? side;

  /// Creates a single Checkbox field
  BNDCheckbox({
    //From Super
    Key? key,
    String name = "Checkbox",
    FormFieldValidator<bool>? validator,
    bool? initialValue,
    InputDecoration decoration = const InputDecoration(
      border: InputBorder.none,
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
    ),
    ValueChanged<bool?>? onChanged,
    ValueTransformer<bool?>? valueTransformer,
    bool enabled = true,
    FormFieldSetter<bool?>? onSaved,
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
    VoidCallback? onReset,
    FocusNode? focusNode,
    this.titleWidget,
    this.activeColor,
    this.checkColor,
    //this.subtitle,
    this.secondary,
    this.controlAffinity = ListTileControlAffinity.leading,
    //this.contentPadding = EdgeInsets.zero,
    this.autofocus = false,
    this.tristate = false,
    // this.selected = false,
    this.title,
    this.titleTextStyle,
    this.margin,
    this.scale = 1.2,
    this.isAlone = true,
    this.side,
  }) : super(
          key: key,
          initialValue: initialValue,
          name: !isAlone ? name : "",
          validator: validator,
          valueTransformer: valueTransformer,
          onChanged: onChanged,
          autovalidateMode: autovalidateMode,
          onSaved: onSaved,
          enabled: enabled,
          onReset: onReset,
          decoration: decoration,
          focusNode: focusNode,
          builder: (FormFieldState<bool?> field) {
            final _BNDCheckBoxState state = field as _BNDCheckBoxState;
            return !isAlone
                ? InputDecorator(
                    decoration: state.decoration(),
                    child: state.buildCheckbox(),
                  )
                : state.buildCheckbox();
          },
        );

  @override
  _BNDCheckBoxState createState() => _BNDCheckBoxState();
}

class _BNDCheckBoxState extends FormBuilderFieldState<BNDCheckbox, bool> {
  Widget? get titleWidget => widget.titleWidget;
  String? get title => widget.title;

  // @override
  // void didUpdateWidget(covariant BNDCheckbox oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   if (oldWidget.initialValue != widget.initialValue) {
  //     didChange(widget.initialValue);
  //   }
  // }

  Widget? getTitleWidget() {
    if (widget.titleWidget != null)
      return titleWidget;
    else if (title != null && title!.isNotEmpty)
      return Text(
        title!,
        style: widget.titleTextStyle,
      );
  }

  Widget buildCheckbox() {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
      Transform.scale(
        scale: widget.scale,
        child: Container(
          width: 23,
          height: 23,
          margin: widget.margin ?? const EdgeInsets.only(right: 10),
          child: Checkbox(
            value: value,
            onChanged: widget.enabled
                ? (bool? val) {
                    //state.requestFocus();
                    didChange(val);
                  }
                : null,
            checkColor: widget.checkColor,
            activeColor: widget.activeColor,
            autofocus: widget.autofocus,
            tristate: widget.tristate,
            side: widget.side,
          ),
        ),
      ),
      Flexible(
        child: GestureDetector(
            onTap: () {
              if (widget.enabled) didChange(!(value ?? false));
            },
            child: getTitleWidget() ?? const SizedBox()),
      ),
    ]);
  }
}


// class BndCheckboxWidget extends StatefulWidget {
//   final List<CheckBoxSelectedModel> listData;

//   const BndCheckboxWidget({Key? key, required this.listData}) : super(key: key);

//   @override
//   State<StatefulWidget> createState() => _BndCheckboxWidgetState();
// }

// class _BndCheckboxWidgetState extends State<BndCheckboxWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: <Widget>[
//         for (CheckBoxSelectedModel dataModel in widget.listData)
//           _CustomCheckBox(
//             context,
//             data: dataModel,
//             onChange: () {
//               setState(() {
//                 dataModel.isSelected = !dataModel.isSelected;
//               });
//             },
//           )
//       ],
//     );
//   }

//   Widget _CustomCheckBox(BuildContext context,
//       {required CheckBoxSelectedModel data, VoidCallback? onChange}) {
//     return GestureDetector(
//       onTap: onChange,
//       child: Container(
//         margin: const EdgeInsets.only(bottom: 20),
//         color: Colors.transparent,
//         child: Row(
//           mainAxisSize: MainAxisSize.max,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Container(
//               width: 22,
//               height: 22,
//               child: Images.svgAssets(data.isSelected
//                   ? Images.icCheckboxSelected
//                   : Images.icCheckbox),
//             ),
//             const SizedBox(
//               width: 12,
//             ),
//             Expanded(
//               child: Text(data.title,
//                   style: textStyleBodyMedium.copyWith(
//                       fontWeight: FontWeight.w400, color: kTextColor)),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
