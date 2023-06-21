import 'package:core/components/bnd_image.dart';
import 'package:flutter/material.dart';

class CarouselSliderChildWidget extends StatelessWidget {
  final String image;
  final double height;

  const CarouselSliderChildWidget({Key? key, required this.image, this.height = 150}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: BNDImage(imageUrl: image),
      margin: EdgeInsets.symmetric(horizontal: 5),
    );
  }
}
