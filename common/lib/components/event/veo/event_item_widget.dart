import 'package:core/assets/images/images.dart';
import 'package:core/common/color/core_color.dart';
import 'package:core/components/core_component.dart';
import 'package:flutter/material.dart';
import 'package:core/components/bnd_touch.dart';

class EventItemWidget extends StatelessWidget {
  final int id;
  final EdgeInsets? padding;
  final String imageUrl;
  final Widget content;
  final Function onTap;
  const EventItemWidget({
    Key? key,
    this.padding,
    required this.id,
    required this.imageUrl,
    required this.content,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BndTouch(
      onPressed: () => onTap(),
      child: Container(
        margin: padding ?? CoreColor.paddingBodyDefault,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 16),
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  Positioned(
                    top: -10,
                    left: -10,
                    child: Container(height: 48, width: 48, child: BNDImage(imageUrl: Images.vnNewsAfterImage)),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Hero(
                        tag: '$id$imageUrl',
                        child: BNDImage(height: 91, width: 91, fit: BoxFit.cover, imageUrl: imageUrl)),
                  ),
                ],
              ),
            ),
            Expanded(
              child: content,
            )
          ],
        ),
      ),
    );
  }
}
