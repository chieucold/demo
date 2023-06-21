import 'package:api/api/commondata_api.dart';
import 'package:common/components/event/veo/veo2_list_event/bloc/veo2_list_event_bloc.dart';
import 'package:common/components/event/veo/veo2_list_event/bloc/veo2_tab_bloc.dart';
import 'package:common/components/event/veo/veo2_list_event/view/widgets/button_request_widget.dart';
import 'package:common/components/event/veo/veo2_list_event/view/widgets/two_side_request_button_widget.dart';
import 'package:common/components/event/veo/veo5_event_detail/view/page/veo5_event_detail_screen.dart';
import 'package:core/assets/images/images.dart';
import 'package:core/common/color/core_color.dart';
import 'package:core/common/color/core_space.dart';
import 'package:core/common/common.dart';
import 'package:core/common/text_style.dart';
import 'package:core/components/core_component.dart';
import 'package:core/language/app_localizations.dart';
import 'package:flutter/material.dart';

class VEO2EventWidget extends StatefulWidget {
  final Color dateColor;
  final EventPublicResource model;
  final bool isShowCancelJoin;
  final bool isUpdateInvitation;
  final VEO2ListEventBloc bloc;
  final VEO2TabBloc? veo2TabBloc;
  final int? eventUserId;

  const VEO2EventWidget({
    Key? key,
    required this.dateColor,
    required this.model,
    this.isShowCancelJoin = false,
    this.isUpdateInvitation = false,
    required this.bloc,
    this.veo2TabBloc,
    this.eventUserId,
  }) : super(key: key);

  @override
  _VEO2EventWidgetState createState() => _VEO2EventWidgetState();
}

class _VEO2EventWidgetState extends State<VEO2EventWidget> {
  Color get dateColor => widget.dateColor;

  EventPublicResource get model => widget.model;
  bool get isShowCancelJoin => widget.isShowCancelJoin;
  bool get isUpdateInvitation => widget.isUpdateInvitation;
  VEO2ListEventBloc get bloc => widget.bloc;
  int get eventUserId => widget.eventUserId!;

  bool isInvisible = false;

  VEO2TabBloc get _veo2tabBloc => widget.veo2TabBloc!;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(seconds: 1),
      child: isInvisible
          ? const SizedBox(
              key: Key("key1"),
            )
          : Padding(
              key: const Key("key2"),
              // padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
              padding: CoreSpace.paddingBodyDefault.copyWith(top: 16, bottom: 16),
              child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute<void>(builder: (BuildContext context) {
                      return VEO5EventDetailScreen(eventId: model.id);
                    }));
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          BNDImage(
                              imageUrl: model.avatar,
                              imageDefault: Images.svgAssets(Images.icBnd, width: 81, height: 85, package: "core"),
                              radius: 10,
                              width: 81,
                              height: 85,
                              fit: BoxFit.cover),
                          const SizedBox(
                            width: 12,
                          ),
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                        child: Text(
                                      model.title,
                                      style: textStyleBodyDefault.copyWith(
                                        color: CoreColor.textColor,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ))
                                  ],
                                ),
                                Container(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                          child: model.startDate != null
                                              ? Text(
                                                  AppLocalizations.of(context)!.displayDateTime(model.startDate!,
                                                      isFullTime: false, isDateOfWeek: true),
                                                  style: textStyleBodySmall.copyWith(
                                                    color: dateColor,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                )
                                              : const SizedBox())
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  children: <Widget>[
                                    Images.svgAssets(Images.icMultipleUser,
                                        color: CoreColor.veo2MemberColor, package: "core"),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Expanded(
                                      child: Text(
                                        model.totalEventUser.toString(),
                                        style: textStyleBodySmall.copyWith(
                                          color: CoreColor.veo2MemberColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      isUpdateInvitation ? _updateInvitationWidget(context) : const SizedBox(),
                      isShowCancelJoin ? _cancelJoinWidget(context) : const SizedBox()
                    ],
                  )),
            ),
    );
  }

  Widget _cancelJoinWidget(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 14),
      child: ButtonRequestWidget(
          title: AppLocalizations.of(context)!.translate("cancel_sign_up"),
          borderColor: CoreColor.requestBtnDeniedColor,
          onPress: () async {
            final String text =
                AppLocalizations.of(context)!.translate("do_you_want_to_cancel_your_participation_in_the_event");
            final String textOk = AppLocalizations.of(context)!.translate("accept");
            await showAlertDialog(context, content: text, okText: textOk, onOk: () async {
              await bloc
                  .cancelJoinEvent(
                      context,
                      EventParamResource(
                          eventId: model.id,
                          isjoin: false,
                          eventUserId: eventUserId,
                          status: EventUserOptionStatus.refuse.index))
                  .then((bool _value) async {
                if (_value) {
                  setState(() {
                    isInvisible = true;
                  });

                  await bloc.updateList(index: model.id, isJoinedChange: isShowCancelJoin);
                  await _veo2tabBloc.updateTabCount(isJoinedChange: isShowCancelJoin);
                }
              });
            });
          }),
    );
  }

  Widget _updateInvitationWidget(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 14),
      child: TwoSideRequestButtonWidget(
          leftTitle: AppLocalizations.of(context)!.translate("accept"),
          rightTitle: AppLocalizations.of(context)!.translate("denied"),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          onLeftPress: () async {
            //onAccept
            await bloc
                .updateEventUserStatus(
                    context,
                    EventParamResource(
                        eventId: model.id,
                        status: EventUserOptionStatus.accept.index,
                        eventUserId: eventUserId,
                        isjoin: false))
                .then((bool _value) async {
              if (_value) {
                setState(() {
                  isInvisible = true;
                });
                await bloc.updateList(index: model.id, isInviteChange: isUpdateInvitation);
                await _veo2tabBloc.updateTabCount(isInviteChange: isUpdateInvitation);
              }
            });
          },
          onRightPress: () async {
            //onDenied
            await bloc
                .updateEventUserStatus(
                    context,
                    EventParamResource(
                        eventId: model.id,
                        isjoin: false,
                        status: EventUserOptionStatus.refuse.index,
                        eventUserId: eventUserId))
                .then((bool _value) async {
              if (_value) {
                setState(() {
                  isInvisible = true;
                });
                await bloc.updateList(index: model.id, isInviteChange: isUpdateInvitation);
                await _veo2tabBloc.updateTabCount(isInviteChange: isUpdateInvitation);
              }
            });
          }),
    );
  }
}
