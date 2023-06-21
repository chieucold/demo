import 'package:common/components/contact_support/contact_support_screen.dart';
import 'package:common/components/event/veo/veo2_list_event/view/page/veo2_list_event_screen.dart';
import 'package:common/components/event/veo/veo5_event_detail/view/page/veo5_event_detail_screen.dart';
import 'package:common/components/event/veo/veo6_list_member_event/view/page/veo6_list_member_event_screen.dart';
import 'package:common/components/news/vn/vn_detail_news/views/page/vn_detail_news_screen.dart';
import 'package:common/components/news/vn/vn_list_news/views/page/vn_list_news_screen.dart';
import 'package:common/components/news/vn/vn_list_other_news/views/vn_list_other_news_screen.dart';
import 'package:core/common/enums/event_enum.dart';
import 'package:core/common/route/route_core_const.dart';
import 'package:core/common/utils/app_utils.dart';
import 'package:core/components/vhs9_notification/bloc/vhs9_notification_bloc.dart';
import 'package:core/components/vhs9_notification/view/page/vhs9_notfication_filter_screen.dart';
import 'package:core/components/vhs9_notification/view/page/vhs9_notification_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic>? generatorRoute(RouteSettings setting) {
    //getIt<Tracking>().trackScreen(setting.name??'');
    switch (setting.name) {
      case veo5EventDetailRouteName:
        return MaterialPageRoute<void>(
            settings: setting,
            builder: (_) =>
                VEO5EventDetailScreen(eventId: Utils.getRouterObject<int>(setting.arguments, index: 0) ?? 0));
      case veo6ListMemberEventRouteName:
        return MaterialPageRoute<void>(
            settings: setting,
            builder: (_) =>
                VEO6ListMemberEventScreen(eventId: Utils.getRouterObject<int>(setting.arguments, index: 0) ?? 0));
      case veo2ListEventRouteName:
        return MaterialPageRoute<void>(
          settings: setting,
          builder: (_) => VEO2ListEventScreen(eventEnum: setting.arguments as EventEnum),
        );
      case vnListNewsRouteName:
        return MaterialPageRoute<void>(builder: (_) => VNListNewsScreen());
      case vnListOtherNewsRouteName:
        return MaterialPageRoute<void>(builder: (_) => VNListOtherNewsScreen());
      case vnNewsDetailRouteName:
        final int id = setting.arguments as int;
        return MaterialPageRoute<void>(builder: (_) => VNDetailNewsScreen(id: id));
      case vhs9Notification:
        return MaterialPageRoute<void>(
            builder: (_) => VHS9NotificationScreen(
                  onTap: Utils.getRouterObject<Function>(setting.arguments, index: 0) as Function,
                  goToFilter: Utils.getRouterObject<Function>(setting.arguments, index: 1) as Function,
                ));
      case vhs9NotificationFilter:
        return MaterialPageRoute<void>(
            settings: setting,
            builder: (_) => VHS9NotificationFilterScreen(notificationBloc: setting.arguments as VHS9NotificationBloc));
      case vhsContactScreen:
        return MaterialPageRoute<void>(settings: setting, builder: (_) => ContactSupportScreen());
      default:
        return null;
    }
  }
}
