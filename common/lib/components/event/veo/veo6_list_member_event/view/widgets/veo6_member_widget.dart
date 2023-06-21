import 'package:api/api/commondata_api_models.dart';
import 'package:common/components/event/veo/veo6_list_member_event/bloc/veo6_list_member_event_bloc.dart';
import 'package:core/assets/images/images.dart';
import 'package:core/common/color/core_color.dart';
import 'package:core/components/bnd_avatar.dart';
import 'package:core/language/app_localizations.dart';
import 'package:core/common/text_style.dart';
import 'package:flutter/material.dart';

class VEO6MemberWidget extends StatefulWidget {
  final bool isInvited;
  final VEO6ListMemberEventBloc bloc;
  final EventListUserInvitedResource model;
  final int eventId;
  const VEO6MemberWidget({
    Key? key,
    this.isInvited = false,
    required this.bloc,
    required this.model,
    required this.eventId,
  }) : super(key: key);

  @override
  _VEO6MemberWidgetState createState() => _VEO6MemberWidgetState();
}

class _VEO6MemberWidgetState extends State<VEO6MemberWidget> {
  VEO6ListMemberEventBloc get bloc => widget.bloc;
  EventListUserInvitedResource get model => widget.model;
  int get eventId => widget.eventId;
  bool isInvited = false;

  @override
  void initState() {
    isInvited = widget.isInvited;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 10),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(right: 12),
                child: BnDAvatar(
                  name: model.fullName,
                  imageUrl: model.avatar,
                  size: 25,
                  imageDefault: Images.svgAssets(
                    Images.icBnd,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Flexible(
                child: Text(
                  model.fullName,
                  style: textStyleBodyMedium.copyWith(
                    fontWeight: FontWeight.w700,
                    color: CoreColor.textColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          )),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              if (!isInvited) {
                widget.model.isInvited = true;
                isInvited = true;
                setState(() {});
                bloc.inviteUser(context, model.id, eventId).then((bool _value) {
                  if (!_value) {
                    isInvited = false;
                    setState(() {});
                  }
                });
              }
            },
            child: Container(
              margin: const EdgeInsets.only(
                left: 5,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 4,
                horizontal: 14,
              ),
              decoration: BoxDecoration(
                color: isInvited ? CoreColor.veo6InviteColor : CoreColor.textWhiteColor,
                border: Border.all(color: isInvited ? Colors.transparent : CoreColor.veo6InviteBorderColor),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                isInvited
                    ? AppLocalizations.of(context)!.translate("invited").toUpperCase()
                    : AppLocalizations.of(context)!.translate("invite").toUpperCase(),
                style: textStyleBodySmallest.copyWith(
                    color: isInvited ? CoreColor.textWhiteColor : CoreColor.textColor, fontWeight: FontWeight.w700),
              ),
            ),
          )
        ],
      ),
    );
  }
}
