import 'package:api/api/commondata_api.dart';
import 'package:core/language/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:core/common/enums/notification_action_enum.dart';
import 'notification_style.dart';

// ignore: must_be_immutable
class NotificationGetTitle extends StatelessWidget {
  NotificationPublicResource noti;
  NotificationGetTitle({
    Key? key,
    required this.noti,
  }) : super(key: key);

  Map<String, Function> myTextSpans = <String, Function>{
    'a': (String text) => NotificationStyle.createdName(text),
    'b': (String text) => NotificationStyle.objectTitle(text),
    'z': (String text) => NotificationStyle.defaultTextSpan(text),
  };

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: decorateArticle(getNotificationTitle(context, getTitleByAction[noti.action] ?? ''))),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }

  List<InlineSpan> decorateArticle(String article) {
    final List<InlineSpan> childern = <InlineSpan>[];

    article.split('{{').forEach((String element) {
      if (element.contains("}}")) {
        childern.add(
            myTextSpans[element.split('}}')[0].substring(0, 1)]!(element.split('}}')[0].substring(1)) as InlineSpan);
        if (!element.endsWith("}}")) {
          childern.add(myTextSpans['z']!(element.split('}}')[1]) as InlineSpan);
        }
      } else {
        childern.add(myTextSpans['z']!(element) as InlineSpan);
      }
    });

    return childern;
  }

  String getNotificationTitle(BuildContext context, String translateText) {
    String notificationTitle = AppLocalizations.of(context)!.translate(translateText);

    notificationTitle = notificationTitle.replaceAll("createdName", noti.createdByUser?.fullName ?? ' ');
    notificationTitle = notificationTitle.replaceAll(
        "objectTitle", AppLocalizations.of(context)!.translate(noti.objectType.toLowerCase()));
    return notificationTitle;
  }
}
