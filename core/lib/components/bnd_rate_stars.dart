import 'package:core/common/color/core_color.dart';
import 'package:core/common/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:core/components/form/form_builder_field.dart';

// ignore: must_be_immutable
class BNDRateStar extends FormBuilderField<double> {
  final int itemCount;
  final double itemSize;
  final Color starColor;
  final bool disable;
  final double spaceBetween;

  BNDRateStar({
    Key? key,
    double? initialValue,
    String name = "Rating",
    FormFieldValidator<double?>? validator,
    ValueChanged<double?>? onChanged,
    this.itemCount = 5,
    this.itemSize = 18,
    this.starColor = Colors.yellow,
    this.spaceBetween = 6,
    this.disable = false,
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
  }) : super(
            name: name,
            key: key,
            validator: validator,
            onChanged: onChanged,
            initialValue: initialValue,
            autovalidateMode: autovalidateMode,
            builder: (FormFieldState<double?> field) {
              final _BnDRateStarState state = field as _BnDRateStarState;
              return state.buildBody();
            });
  @override
  _BnDRateStarState createState() => _BnDRateStarState();
}

class _BnDRateStarState extends FormBuilderFieldState<BNDRateStar, double> {
  Color get _starColor => widget.starColor;

  @override
  void didUpdateWidget(covariant BNDRateStar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialValue != widget.initialValue) {
      didChange(widget.initialValue);
    }
  }

  Widget buildBody() {
    if (widget.disable) {
      return _buildRating();
    } else {
      return Column(children: <Widget>[
        _buildRating(),
        if (widget.validator != null &&
            widget.validator!(value) != null &&
            widget.validator!(value)!.isNotEmpty &&
            hasError)
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              widget.validator!(value) ?? "",
              style: textStyleBodySmallest.copyWith(color: CoreColor.colorInputTextError),
            ),
          ),
      ]);
    }
  }

  Widget _buildRating() {
    return RatingBar(
      ignoreGestures: widget.disable,
      initialRating: value ?? 0,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      // tapOnlyMode: isReadOnly,
      itemSize: widget.itemSize,

      ratingWidget: RatingWidget(
        full: Icon(
          Icons.star,
          color: _starColor,
        ),
        half: Icon(
          Icons.star_half_outlined,
          color: _starColor,
        ),
        empty: Icon(
          Icons.star_border_outlined,
          color: _starColor,
        ),
      ),
      itemPadding: EdgeInsets.only(right: widget.spaceBetween),
      onRatingUpdate: (double value) => didChange(value),
    );
  }
}







// class BnDRateStar extends StatelessWidget {
//   BnDRateStar(
//       {required this.rating,
      // this.itemCount = 5,
      // this.itemSize = 18,
      // this.isReadOnly = false,
      // this.starColor = Colors.yellow,
      // this.spaceBetween = 6,
      // this.onRatingUpdate,
//       this.disable = false});
//   final double rating;
//   final int itemCount;
//   final double itemSize;
//   final bool isReadOnly;
//   final Color starColor;
//   final bool disable;
//   final double spaceBetween;
//   final ValueChanged<double>? onRatingUpdate;
//   @override
//   Widget build(BuildContext context) {
//     return RatingBar(
//       ignoreGestures: disable,
//       initialRating: rating,
//       direction: Axis.horizontal,
//       allowHalfRating: true,
//       itemCount: 5,
//       tapOnlyMode: isReadOnly,
//       itemSize: itemSize,
//       ratingWidget: RatingWidget(
//         full: Icon(
//           Icons.star,
//           color: starColor,
//         ),
//         half: Icon(
//           Icons.star_half_outlined,
//           color: starColor,
//         ),
//         empty: Icon(
//           Icons.star_border_outlined,
//           color: starColor,
//         ),
//       ),
//       itemPadding: EdgeInsets.only(right: spaceBetween),
//       onRatingUpdate: onRatingUpdate ?? (_) {},
//     );
//   }
// }
