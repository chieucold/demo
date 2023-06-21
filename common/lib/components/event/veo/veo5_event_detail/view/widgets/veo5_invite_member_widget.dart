import 'package:api/api/commondata_api_models.dart';
import 'package:common/components/event/veo/veo5_event_detail/view/widgets/veo5_list_member_widget.dart';
import 'package:core/common/color/core_color.dart';
import 'package:core/common/constants/block_settings.dart';
import 'package:core/components/bnd_button.dart';
import 'package:core/language/app_localizations.dart';
import 'package:core/common/text_style.dart';
import 'package:core/shared_preferences/local_storage_manager.dart';
import 'package:flutter/material.dart';

class VEO5InviteMemberWidget extends StatelessWidget {
  final List<SimpleUserEntity> listMember;
  final VoidCallback onInvite;
  final bool isShowInvite;
  final int totalEventUser;

  VEO5InviteMemberWidget(
      {Key? key,
      this.listMember = const <SimpleUserEntity>[],
      required this.onInvite,
      this.isShowInvite = false,
      required this.totalEventUser})
      : super(key: key);

  final int _blockId = LocalStoreManager.getInt(BlockSettings.blockKey);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      padding: const EdgeInsets.all(12),
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: CoreColor.textWhiteColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              listMember.isNotEmpty
                  ? VEO5ListMemberWidget(
                      members: listMember.length > 3 ? listMember.take(3).toList() : listMember,
                    )
                  : const SizedBox(),
              Expanded(
                child: Text(
                  totalEventUser == 0
                      ? AppLocalizations.of(context)!.translate("no_one_has_joined_yet")
                      : '$totalEventUser ' + AppLocalizations.of(context)!.translate("people_join").toLowerCase(),
                  style: textStyleBodySmall.copyWith(
                      color: listBlockWithVitan.firstWhere((BlockModel e) => e.id == _blockId).backgroundColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          )),
          const SizedBox(
            width: 6,
          ),
          if (isShowInvite)
            BnDButton(
              onPressed: onInvite,
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))), // a
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 24),
              // gradient: CoreColor.bottomRightButton,
              backGroundColor: listBlockWithVitan.firstWhere((BlockModel e) => e.id == _blockId).backgroundColor,
              radius: 8,
              title: Text(
                AppLocalizations.of(context)!.translate("invite"),
                style: textStyleBodySmallest.copyWith(
                    color: CoreColor.textWhiteColor, fontWeight: FontWeight.w400, height: 1.3),
              ),
            )
        ],
      ),
    );
  }
}
