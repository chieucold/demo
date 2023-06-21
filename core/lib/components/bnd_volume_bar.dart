import 'package:core/assets/images/images.dart';
import 'package:core/components/bnd_textfield.dart';
import 'package:flutter/material.dart';

import 'form/form_builder_field.dart';

// ignore: must_be_immutable
class BNDVolumeBar extends FormBuilderField<int> {
  final TextStyle? style;
  final Color? buttonColor;
  final int min;
  final int max;

  BNDVolumeBar({
    Key? key,
    int? initialValue,
    String name = "VolumeBar",
    FormFieldValidator<int?>? validator,
    InputDecoration decoration = const InputDecoration(
      contentPadding: EdgeInsets.symmetric(horizontal: 2, vertical: 11),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(70)),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(70)),
      ),
    ),
    this.style,
    ValueChanged<int?>? onChanged,
    this.buttonColor,
    this.min = 0,
    this.max = 0,
  }) : super(
            name: name,
            key: key,
            onChanged: onChanged,
            initialValue: initialValue,
            decoration: decoration,
            builder: (FormFieldState<int?> field) {
              final _BNDVolumeBarState state = field as _BNDVolumeBarState;
              return state.buildBody();
            });
  @override
  _BNDVolumeBarState createState() => _BNDVolumeBarState();
}

class _BNDVolumeBarState extends FormBuilderFieldState<BNDVolumeBar, int> {
  late TextEditingController controler;

  @override
  void dispose() {
    try {
      controler.dispose();
    } catch (e) {}
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controler = TextEditingController();
  }

  Widget buildBody() {
    return Stack(children: <Widget>[
      BNDTextField<int?>(
        validator: widget.validator,
        isLabelTop: false,
        decoration: widget.decoration,
        itemFromString: (String? value) {
          if (value == null) return 0;
          return int.tryParse(value);
        },
        itemToString: (int? value) {
          return (value ?? 0).toString();
        },
        textInputType: TextInputType.number,
        textAlign: TextAlign.center,
        readOnly: true,
        controller: controler,
        initialValue: initialValue,
        style: widget.style ?? const TextStyle(fontWeight: FontWeight.w600),
      ),
      Positioned(
        left: 6,
        top: 6,
        child: buildIcon(Images.icMinus, () {
          if (value != null && value! > widget.min) {
            didChange((value ?? 0) - 1);
            controler.text = value.toString();
          }
        }),
      ),
      Positioned(
        right: 6,
        top: 6,
        child: buildIcon(
          Images.icPlus,
          () {
            if (widget.max == 0 || (value != null && value! > widget.min)) {
              didChange((value ?? 0) + 1);
              controler.text = value.toString();
            }
          },
        ),
      ),
    ]);
  }

  Widget buildIcon(String iconPath, Function onTap) {
    return InkWell(
      onTap: () {
        onTap();
        //if (widget.onChanged != null) widget.onChanged!(value);
        //if(widget.name != null && widget.name!.isNotEmpty)
        didChange(value);
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: widget.buttonColor ?? const Color(0xffEBECEE),
          shape: BoxShape.circle,
        ),
        child: Align(
          alignment: Alignment.center,
          child: Images.svgAssets(
            iconPath,
            package: 'core',
            width: 13,
          ),
        ),
      ),
    );
  }
}
