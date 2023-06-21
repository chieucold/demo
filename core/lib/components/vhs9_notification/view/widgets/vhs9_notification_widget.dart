import 'package:api/api/commondata_api.dart';
import 'package:core/assets/images/images.dart';
import 'package:core/common/color/core_color.dart';
import 'package:core/common/common.dart';
import 'package:core/common/enums/status_enum.dart';
import 'package:core/common/text_style.dart';
import 'package:core/components/custom_listview.dart';
import 'package:core/components/html/text_html_widget.dart';
import 'package:core/components/notification/views/widgets/notifcation_avatar.dart';
import 'package:core/components/notification/views/widgets/notification_get_time_ago.dart';
import 'package:core/components/vhs9_notification/bloc/vhs9_notification_bloc.dart';
import 'package:core/language/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core/components/notification/bloc/noti_count_bloc.dart';
import 'package:get_it/get_it.dart';

class VHS9NotificationWidget extends StatelessWidget {
  final int totalRows;
  final List<NotificationPublicResource> listNoti;
  final int? blockId;
  final Function onTap;
  VHS9NotificationWidget({
    Key? key,
    required this.listNoti,
    required this.totalRows,
    this.blockId,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildList(listNoti, totalRows, context);
  }

  Widget _buildList(List<NotificationPublicResource> items, int totalRows, BuildContext context) {
    return CustomListView<NotificationPublicResource>(
      padding: CoreColor.paddingBodyDefault.copyWith(),
      primary: false,
      shrinkWrap: true,
      itemBuilder: (_, int index) {
        final NotificationPublicResource item = items[index];
        return Container(
            padding:
                index == totalRows - 1 ? EdgeInsets.only(bottom: 12 + MediaQuery.of(context).size.height * 0.1) : null,
            child: VHS9BuildNotification(
              noti: item,
              blockId: blockId,
              onTap: onTap,
            ));
      },
      totalItem: totalRows,
      items: items,
      onRefresh: () async {
        await BlocProvider.of<VHS9NotificationBloc>(context)
          ..init(blockId: blockId)
          ..getData();
        await GetIt.I<NotiCountBloc>().getNotiNotSee(blockId: blockId);
      },
      onLoading: () async {
        final data = await BlocProvider.of<VHS9NotificationBloc>(context).getMoreNotification();
        await GetIt.I<NotiCountBloc>().getNotiNotSee(blockId: blockId);
        return data;
      },
    );
  }
}

class VHS9BuildNotification extends StatefulWidget {
  final NotificationPublicResource noti;
  final int? blockId;
  final Function onTap;
  const VHS9BuildNotification({
    Key? key,
    required this.noti,
    this.blockId,
    required this.onTap,
  }) : super(key: key);

  @override
  _VHS9BuildNotificationState createState() => _VHS9BuildNotificationState();
}

class _VHS9BuildNotificationState extends State<VHS9BuildNotification> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onChooseNoti,
      child: Container(
        padding: const EdgeInsets.only(top: 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            NotificationAvatar(
                userNotice: widget.noti.createdByUser ?? SimpleUserEntity(),
                status: widget.noti.status,
                isAdmin: widget.noti.createdByUser?.isManager ?? false),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Opacity(
                    opacity: widget.noti.status == statusEnum.seen.index ? 0.5 : 1.0,
                    child: widget.noti.message.trim().isEmpty
                        ? _getTitleNotiMessage
                        : TextHtmlWidget(
                            widget.noti.message,
                            maxline: 3,
                            // textStyle: textStyleBodyDefault.copyWith(fontWeight: FontWeight.w400),
                          ),
                    // child: NotificationGetTitle(noti: widget.noti),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      _getIconNotiTime(widget.noti.block),
                      const SizedBox(width: 6),
                      Text(
                        NotificationGetTimeAgo(widget.noti.createdDate ?? DateTime.now(), context,
                            prefixText: "${AppLocalizations.of(context)!.translate("about")} "),
                        style: textStyleBodySmall.copyWith(color: CoreColor.colorSubTitle),
                      ),
                      // _commentItem(context),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget get _getTitleNotiMessage {
    return Text(
      '${(widget.noti.createdByUser?.fullName ?? '')} ${widget.noti.title} ${widget.noti.objectTitle}',
      style: textStyleBodySmall.copyWith(fontWeight: FontWeight.w400),
    );
  }

  void _onChooseNoti() {
    if (widget.noti.status != statusEnum.seen.index) {
      BlocProvider.of<VHS9NotificationBloc>(context).changeNotiStatus(widget.noti.id);
      widget.noti.status = statusEnum.seen.index;
      // _notiCountBloc.markSeenNotification(widget.blockId);
      setState(() {});
    }
    widget.onTap(widget.noti.objectType, context, widget.noti.action, widget.noti.blockId,
        objectId: int.tryParse(widget.noti.objectId.toString()), url: widget.noti.url);
    // NotificationRouteGoTo(
    //   widget.noti.objectType,
    //   context,
    //   widget.noti.action,
    //   objectId: int.tryParse(widget.noti.objectId.toString()),
    // );
  }

  Widget _getIconNotiTime(String objectType) {
    if (getBlockIcon[objectType] == null) {
      return _getImageLogoDefault(objectType.toString(), 12);
    }
    return Images.svgAssets(
      getBlockIcon[objectType] ?? '',
      width: 28,
      package: 'core',
    );
  }

  Widget _getImageLogoDefault(String name, double size) {
    // final List<Color> _colors = <Color>[const Color(0xFFE27B7B), const Color(0xFF39C883), const Color(0xFF3958C8)];
    // final int code = Utils.getCharacterCode(name[0].toUpperCase());
    // int index = 0;
    // if (code >= 73 && code <= 81)
    //   index = 1;
    // else if (code > 81) index = 2;
    return Container(
      height: size * 2,
      width: size * 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: listBlockWithVitan.firstWhere((BlockModel e) => e.id == widget.noti.blockId).backgroundColor,
      ),
      alignment: Alignment.center,
      child: Text(
        name[0].toUpperCase(),
        style: TextStyle(fontSize: size + 3, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
