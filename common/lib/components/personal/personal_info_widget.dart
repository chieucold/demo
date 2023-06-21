import 'package:core/common/color/core_color.dart';
import 'package:core/common/text_style.dart';
import 'package:core/components/bnd_avatar.dart';
import 'package:flutter/material.dart';

class PersonalInfoWidget extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String? email;
  const PersonalInfoWidget({
    Key? key,
    required this.name,
    required this.imageUrl,
    this.email,
  }) : super(key: key);

  Widget _height(double height) => SizedBox(height: height);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          BnDAvatar(
            imageUrl: imageUrl,
            name: name,
            size: 60,
            viewImage: true,
          ),
          _height(16),
          Text(
            name,
            style: textStyleHeadline6.copyWith(color: CoreColor.textColor),
          ),
          _height(8),
          if (email != null)
            Text(
              email ?? '',
              style: textStyleBodySmall.copyWith(color: CoreColor.subtitleColor, fontWeight: FontWeight.w400),
            ),
          _height(email != null ? 28 : 16),
        ],
      ),
    );
  }
}
