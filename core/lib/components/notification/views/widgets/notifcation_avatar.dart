import 'package:api/api/commondata_api.dart';
import 'package:core/common/color/core_color.dart';
import 'package:core/common/enums/status_enum.dart';
import 'package:core/components/core_component.dart';
import 'package:flutter/material.dart';
import 'package:core/assets/images/images.dart';

class NotificationAvatar extends StatelessWidget {
  final SimpleUserEntity userNotice;
  final int status;
  final bool isAdmin;
  const NotificationAvatar({
    Key? key,
    required this.userNotice,
    required this.status,
    this.isAdmin = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(6),
          child: BnDAvatar(
            name: userNotice.fullName,
            size: 25,
            imageUrl: userNotice.avatar,
            // fit: BoxFit.cover,
          ),
        ),
        status == statusEnum.seen.index
            ? Images.svgAssets(
                Images.vhs9IcSeen,
                width: 10,
                height: 10,
              )
            : Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: CoreColor.filterHasDataColor,
                ),
              ),
        //vhs9IcAdmin
        Positioned(
          bottom: 2,
          right: 6,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: CoreColor.white,
                ),
              ),
              if (isAdmin)
                Images.svgAssets(
                  Images.vhs9IcAdmin,
                  height: 19,
                  width: 17,
                ),
            ],
          ),
        )
      ],
    );
  }
}
