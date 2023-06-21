import 'package:common/common/color/common_color.dart';
import 'package:core/components/core_component.dart';
import 'package:core/common/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class VNListHotNewsItem extends StatelessWidget {
  final String image;
  final String title;
  final String? time;
  final BoxFit fit;
  final double? height;
  const VNListHotNewsItem({
    Key? key,
    required this.image,
    required this.title,
    this.fit = BoxFit.cover,
    this.height,
    this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 12, right: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            gradient: CommonColor.hotNewsGradient,
          ),
          child: Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: <Widget>[
              BNDImage(imageUrl: image, fit: fit, height: height, width: double.infinity),
              _buildTextContent()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextContent() {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(gradient: CommonColor.hotNewsGradient),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: textStyleBodyLargeBold.copyWith(color: CommonColor.white),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          if (time != null)
            Text(
              time!,
              style: textStyleBodySmall.copyWith(color: CommonColor.vnDividerColor),
            )
        ],
      ),
    );
  }
}
