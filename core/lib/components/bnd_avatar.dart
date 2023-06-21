import 'package:core/assets/images/images.dart';
import 'package:core/common/utils/app_utils.dart';
import 'package:core/components/bnd_image.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BnDAvatar extends StatelessWidget {
  BnDAvatar({
    Key? key,
    this.name = "",
    this.size = 30,
    this.imageUrl = "",
    this.imageDefault,
    this.textSize,
    this.fit,
    this.viewImage = false,
    this.imageCropMode = 'crop',
  }) : super(key: key);
  final String name;
  double size;
  final String imageUrl;
  final Widget? imageDefault;
  final double? textSize;
  final BoxFit? fit;
  final bool viewImage;
  final String imageCropMode;

  final List<Color> _colors = <Color>[const Color(0xFFE27B7B), const Color(0xFF39C883), const Color(0xFF3958C8)];

  Widget getImageFromUrl(String imageUrl) {
    return BNDImage(
        imageUrl: imageUrl,
        imageDefault: imageDefault ?? _buildImageDefault(),
        height: size * 3,
        width: size * 3,
        fit: fit ?? BoxFit.cover,
        viewImage: viewImage,
        imageCropMode: imageCropMode);
  }

  @override
  Widget build(BuildContext context) {
    if (imageUrl != null && imageUrl.trim().isNotEmpty)
      return CircleAvatar(
          radius: size,
          backgroundColor: Colors.transparent,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(300.0),
            child: getImageFromUrl(imageUrl),
          ));
    else if (name != null && name.trim().isNotEmpty) {
      final int code = Utils.getCharacterCode(name[0].toUpperCase());
      int index = 0;
      if (code >= 73 && code <= 81)
        index = 1;
      else if (code > 81) index = 2;
      return CircleAvatar(
        radius: size,
        backgroundColor: _colors[index],
        child: Text(
          name[0].toUpperCase(),
          style: TextStyle(fontSize: textSize ?? (size - 3), color: Colors.white),
        ),
      );
    }
    return imageDefault ?? _buildImageDefault();
  }

  Widget _buildImageDefault() {
    return BnDAvatar(name: 'A', size: size);
    // Container(
    //         width: size * 2,
    //         height: size * 2,
    //         decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(50),
    //             image: DecorationImage(
    //               image: const AssetImage(Images.imageDefault, package: "core"),
    //               fit: fit ?? BoxFit.contain,
    //             )));
  }
}
