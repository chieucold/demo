import 'package:api/api/commondata_api_models.dart';
import 'package:common/components/event/veo/veo5_event_detail/view/widgets/veo5_invite_member_widget.dart';
import 'package:core/assets/images/images.dart';
import 'package:core/components/core_component.dart';
import 'package:flutter/material.dart';

class VEO5TopWidget extends StatelessWidget {
  final VoidCallback onInvite;
  final String eventAvatar;
  final List<SimpleUserEntity> listMember;
  final bool isShowInvited;
  final int totalEventUser;
  final int id;

  const VEO5TopWidget(
      {Key? key,
      required this.id,
      required this.onInvite,
      required this.eventAvatar,
      this.listMember = const <SimpleUserEntity>[],
      this.isShowInvited = false,
      required this.totalEventUser})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(
            bottom: 30,
          ),
          child: Hero(
            tag: '$id$eventAvatar',
            child: BNDImage(
              imageUrl: eventAvatar,
              fit: BoxFit.cover,
              height: 180,
              width: double.infinity,
              imageDefault: BNDImage(
                imageUrl: Images.imgEvent,
                package: "core",
                fit: BoxFit.cover,
                height: 180,
                width: double.infinity,
              ),
              viewImage: true,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: VEO5InviteMemberWidget(
            listMember: listMember,
            onInvite: onInvite,
            isShowInvite: isShowInvited,
            totalEventUser: totalEventUser,
          ),
        )
      ],
    );
  }
}
