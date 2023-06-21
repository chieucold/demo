import 'package:core/components/form/form_builder_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef String ItemToString<T>(T item);
typedef T? ItemFromString<T>(String string);

class BNDTextField<T> extends FormBuilderField<T> {
  final FormFieldValidator<T?>? validator;
  final FormFieldSetter<T?>? onSaved;
  final TextEditingController? controller;
  final T? initialValue;
  final bool autofocus;
  final int? maxLines;
  final int? maxLength;
  final bool enabled;
  final ItemFromString<T?>? itemFromString;
  final ItemToString<T?>? itemToString;
  final bool isLabelTop;
  final String labelText;
  final TextStyle? labelTextStyle;
  final GestureTapCallback? onTap;
  final int? minLines;
  final double borderRadius;
  final InputDecoration decoration;
  final bool enableSuggestions;
  final TextInputType? textInputType;
  final TextStyle? style;
  final TextAlign textAlign;
  final bool readOnly;
  final ValueChanged<String>? onFieldSubmitted;
  List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final bool autoCorrect;
  final TextCapitalization textCapitalization;
  final bool isShowTextRequire;
  final Color? cursorColor;

  BNDTextField(
      {Key? key,
      String name = 'textField',
      this.validator,
      this.onSaved,
      ValueChanged<T?>? onChanged,
      this.initialValue,
      this.autofocus = false,
      this.maxLength,
      this.enabled = true,
      this.itemFromString,
      this.itemToString,
      this.isLabelTop = true,
      this.labelText = "",
      this.labelTextStyle,
      //TextFormField
      this.controller,
      AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
      this.decoration = const InputDecoration(),
      this.maxLines,
      this.minLines,
      this.borderRadius = 16,
      this.onTap,
      this.enableSuggestions = false,
      this.textInputType,
      this.style,
      this.textAlign = TextAlign.start,
      this.readOnly = false,
      this.inputFormatters,
      FocusNode? focusNode,
      this.onFieldSubmitted,
      this.textInputAction,
      this.obscureText = false,
      this.autoCorrect = false,
      this.textCapitalization = TextCapitalization.sentences,
      this.isShowTextRequire = false,
      this.cursorColor})
      :
        //: controller = controller ?? TextEditingController(text: _toString<T>(initialValue, itemToString)),
        // ??
        // InputDecoration(
        //   border: OutlineInputBorder(borderRadius: BorderRadius.circular(borderRadius)),
        //   focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(borderRadius)),
        //   // enabledBorder: InputBorder.none,
        //   // errorBorder: InputBorder.none,
        //   // disabledBorder: InputBorder.none,
        // ),
        super(
            name: name,
            key: key,
            autovalidateMode: autovalidateMode,
            onChanged: onChanged,
            focusNode: focusNode,
            initialValue: initialValue,
            builder: (FormFieldState<T?> field) {
              final _ExamTextFieldState<T> state = field as _ExamTextFieldState<T>;
              //return state.build(state.context);
              if (isLabelTop) return state._buildFieldSet();

              return state._buildTextFormField();
            });

  @override
  _ExamTextFieldState<T> createState() => _ExamTextFieldState<T>();
}

class _ExamTextFieldState<T> extends FormBuilderFieldState<BNDTextField<T>, T> {
  late TextEditingController textController;

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    textController = widget.controller ?? TextEditingController();
    textController.text = initialText;
    // widget.decoration = widget.decoration.copyWith(
    //   border: OutlineInputBorder(
    //       borderRadius: BorderRadius.all(
    //     Radius.circular(widget.borderRadius),
    //   )),
    // enabledBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.all(
    //   Radius.circular(widget.borderRadius),
    // )),
    //);
  }

  // @override
  // Widget build(BuildContext context) {
  //   if (widget.isLabelTop)
  //     return _buildFieldSet();
  //   else
  //     return _buildTextFormField();
  // }

  @override
  void reset() {
    super.reset();
    textController.text = initialText;
  }

  String get initialText => widget.itemToString?.call(initialValue) ?? initialValue?.toString() ?? '';

  Widget _buildTextFormField() {
    return TextFormField(
      autocorrect: widget.autoCorrect,
      onFieldSubmitted: widget.onFieldSubmitted,
      textInputAction: widget.textInputAction,
      focusNode: effectiveFocusNode,
      enableSuggestions: false,
      //widget.enableSuggestions,
      textCapitalization: widget.textCapitalization,
      controller: textController,
      decoration: widget.decoration,
      keyboardType: widget.textInputType,
      style: widget.style,
      textAlign: widget.textAlign,
      autofocus: widget.autofocus,
      obscureText: widget.obscureText,
      //autocorrect: widget.autocorrect,
      //maxLengthEnforcement: widget.maxLengthEnforcement,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      //scrollPadding: widget.scrollPadding,
      //textCapitalization: widget.textCapitalization,
      inputFormatters: widget.inputFormatters,
      minLines: widget.minLines,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      autovalidateMode: widget.autovalidateMode,
      cursorColor: widget.cursorColor,

      //initialValue: widget.controller == null ? initialText : null,
      onChanged: (String value) {
        didChange(_toObject<T>(value, widget.itemFromString));
      },
      validator: (String? value) {
        if (widget.validator != null) {
          return widget.validator!(_toObject<T>(value, widget.itemFromString));
        }
      },
      onTap: widget.onTap,
      onSaved: (String? value) {
        if (widget.onSaved != null) {
          return widget.onSaved!(_toObject<T>(value, widget.itemFromString));
        }
      },
    );
  }

  Widget _buildFieldSet() {
    return Stack(clipBehavior: Clip.none, children: <Widget>[
      _buildTextFormField(),
      Positioned(
        child: widget.labelText.isNotEmpty
            ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: RichText(
                  text: TextSpan(
                      text: widget.isShowTextRequire ? '* ' : '',
                      style: widget.labelTextStyle?.copyWith(color: Colors.red),
                      children: <InlineSpan>[
                        // if (widget.isShowTextRequire)
                        //   TextSpan(text: ' * ', style: widget.style?.copyWith(color: Colors.red)),
                        TextSpan(text: widget.labelText, style: widget.labelTextStyle)
                      ]),
                ),
                color: Colors.white,
              )
            : const SizedBox(),
        top: -10,
        left: 20,
      ),
    ]);
  }
}

String _toString<T>(T? value, ItemToString<T?>? fn) => (fn == null ? value?.toString() : fn(value)) ?? '';

T? _toObject<T>(String? s, ItemFromString<T?>? fn) => fn == null ? s as T : fn(s ?? '');
