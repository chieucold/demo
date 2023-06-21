import 'package:api/common/model/app_settings/app_settings_entity.dart';
import 'package:api/id/model/login_response_model.dart';
import 'package:contest/main.dart';
import 'package:core/common/app_settings/app_settings.dart';
import 'package:core/common/common.dart';
import 'package:core/shared_preferences/local_storage_manager.dart';
import 'package:flutter/material.dart';
import 'package:vitan_edu/core/common/injection.dart';
import 'package:vitan_edu/core/widget/navigator_bar/navigator_bar_widget_vhs5.dart';
import 'package:core/components/retry_view_widget.dart';
import 'package:vitan_edu/features/presentation/app_init/view/pages/app_init_screen.dart';
import 'package:vitan_edu/features/presentation/login_auth_finger/login_with_biometrics_widget.dart';
import 'package:vitan_edu/features/presentation/vhs/vhs2_on_board/views/page/vhs2_onboard_screen.dart';
import 'package:vitan_edu/features/presentation/vhs/vhs5_supper_app_home/view/page/vhs5_supper_app_home_screen.dart';
import 'package:vitan_edu/features/presentation/vhs/vhs6_personal/view/page/vhs6_personal_screen.dart';
import 'package:vitan_edu/features/presentation/vhs/vhs7_security_setting/vhs7_security_setting_page.dart';
import 'package:vitan_edu/features/presentation/vhs/vhs_10_otp/view/page/vhs10_otp_screen.dart';
import 'package:vitan_edu/features/presentation/vhs/vhs_3_login_user/page/vhs3_login_screen.dart';
import 'package:vitan_edu/features/presentation/vhs/vhs_3_login_user/page/vhs3_password_screen.dart';
import 'package:vitan_edu/features/presentation/vhs/vhs_3_login_user/widgets/register_information_widget.dart';
import 'package:vitan_edu/features/presentation/vhs/vhs_login_qrcode/views/page/vhs_login_qrcode_screen.dart';
import 'package:exam/features/route/route_generator.dart' as exam;
import 'package:guide/features/route/route_generator.dart' as guide;
import 'package:common/route/route_generator.dart' as common;
import 'package:learn/features/route/route_generator.dart' as learn;
import 'package:core/common/tracking/tracking.dart';
import 'package:vitan_edu/features/presentation/vhs/vhs_prompt/views/page/vhs_prompt_screen.dart';
import 'package:vitan_edu/features/presentation/vhs/vhs_prompt/views/widgets/vhs_prompt_widget.dart';
import 'package:vitan_edu/features/presentation/vsr/vsr3_search/view/page/vsr3_search_screen.dart';
import 'package:vitan_edu/features/presentation/vsr/vsr4_search_result/view/page/vsr4_search_result_screen.dart';
import 'package:core/components/vhs9_notification/bloc/vhs9_notification_bloc.dart';
import 'package:core/components/vhs9_notification/view/page/vhs9_notfication_filter_screen.dart';
import 'package:core/components/vhs9_notification/view/page/vhs9_notification_screen.dart';

class RouteGeneratorSuper {
  static Route<dynamic>? generatorRoute(RouteSettings setting) {
    LocalStoreManager.setCurrentScreen(setting.name ?? '');
    // tracking vào màn
    trackingScreen(setting.name ?? '');

    //Common dùng chung
    final commonRoute = common.RouteGenerator.generatorRoute(setting);
    if (commonRoute != null) {
      // LocalStoreManager.setInt(BlockSettings.blockKey, BlockEnum.SupperApp.index);
      return commonRoute;
    }

    final examRoute = exam.RouteGenerator.generatorRoute(setting);
    if (examRoute != null) {
      //set dang ở block thi
      LocalStoreManager.setInt(BlockSettings.blockKey, BlockEnum.Exam.index);
      return examRoute;
    }

    //Thi
    final learnRoute = learn.RouteGenerator.generatorRoute(setting);
    if (learnRoute != null) {
      //set dang ở block thi
      LocalStoreManager.setInt(BlockSettings.blockKey, BlockEnum.Learn.index);
      return learnRoute;
    }

    //Hướng nghiệp
    final guideRoute = guide.RouteGenerator.generatorRoute(setting);
    if (guideRoute != null) {
      //set dang ở block thi
      LocalStoreManager.setInt(BlockSettings.blockKey, BlockEnum.Guide.index);
      return guideRoute;
    }

    final superApp = RouteGenerator.generatorRoute(setting);
    if (superApp != null) {
      // if (setting.name == vhs5NavigatorBarWidget) {
      //   showInAppReview();
      // }
      // Khi là route search thì ko set lại blockId
      if (setting.name == vsr4SearchResult || setting.name == vsr3Search) {
      } else {
        LocalStoreManager.setInt(BlockSettings.blockKey, BlockEnum.SupperApp.index);
        if (setting.name == contestHomeRouteName) {
          LocalStoreManager.setInt(BlockSettings.blockKey, BlockEnum.Contest.index);
        }
      }
      return RouteGenerator.generatorRoute(setting);
    }
    return null;
  }

  static void trackingScreen(String name) {
    try {
      getItSuper<Tracking>().trackScreen(name);
    } catch (e) {}
  }
}

class RouteGenerator {
  static Route<dynamic>? generatorRoute(RouteSettings setting) {
    //getIt<Tracking>().trackScreen(setting.name??'');
    switch (setting.name) {
      case contestHomeRouteName:
        return MaterialPageRoute<void>(
            settings: setting,
            builder: (_) => ContestHome(
                  url: Utils.getRouterObject<String>(setting.arguments, index: 0) ?? "",
                ));

      case vhs5HomeSupperAppRouteName:
        return MaterialPageRoute<void>(settings: setting, builder: (_) => VHS5SupperAppHomeScreen());

      case vhs5NavigatorBarWidget:
        // final int? index = setting.arguments as int;
        return MaterialPageRoute<void>(
            settings: setting,
            builder: (_) => NavigatorBarWidgetVHS5(
                  index: 0,
                ));

      case vhsLoginQRCode:
        return MaterialPageRoute<void>(settings: setting, builder: (_) => VHSLoginQRCodeScreen());
      case vhs7SecuritySetting:
        return MaterialPageRoute<void>(settings: setting, builder: (_) => VHS7SecuritySettingPage());

      case fingerPageSignUpRouteName:
        return MaterialPageRoute<void>(settings: setting, builder: (_) => LoginWithBiometricsWidget());
      case vhs2OnboardRouteName:
        final AppSettings appSettings = getItSuper();
        final List<OnBoarding>? onBoardings = appSettings.configs.onBoarding;
        if (onBoardings == null || onBoardings.isEmpty) {
          return MaterialPageRoute<void>(settings: setting, builder: (_) => VHS3LoginUserScreen());
        }
        return MaterialPageRoute<void>(settings: setting, builder: (_) => VHS2OnBoardScreen());

      // case vhe8NavigatorBarRouteName:
      //   return MaterialPageRoute<void>(settings: setting,
      //       builder: (_) => const NavigatorBarExamWidget());
      case appInitRouteName:
        return MaterialPageRoute<void>(settings: setting, builder: (_) => AppInitScreen());
      // case settingsApp:
      //   return MaterialPageRoute<void>(settings: setting, builder: (_) => const BndSettingsApp());
      case vhs6personal:
        return MaterialPageRoute<void>(builder: (_) => VHS6PersonalScreen());
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
      // case veo5EventDetailRouteName:
      //   return MaterialPageRoute<void>(
      //       settings: setting,
      //       builder: (_) =>
      //           VEO5EventDetailScreen(eventId: Utils.getRouterObject<int>(setting.arguments, index: 0) ?? 0));
      // case veo6ListMemberRouteName:
      //   return MaterialPageRoute<void>(
      //       settings: setting,
      //       builder: (_) =>
      //           VEO6ListMemberEventScreen(eventId: Utils.getRouterObject<int>(setting.arguments, index: 0) ?? 0));
      // case veo2ListEventRouteName:
      //   // final EventEnum eventEnum = setting.arguments as EventEnum;
      //   return MaterialPageRoute<void>(builder: (_) => VEO2ListEventScreen());
      case vhs10Otp:
        return MaterialPageRoute<void>(settings: setting, builder: (_) => VHS10OtpScreen());
      case vhs3LoginUser:
        return MaterialPageRoute<void>(settings: setting, builder: (_) => VHS3LoginUserScreen());
      case registerInformation:
        return MaterialPageRoute<void>(
            settings: setting,
            builder: (_) => RegisterInformationWidget(
                loginResponseModel: Utils.getRouterObject(setting.arguments) ?? LoginResponseModel()));
      case vhs3PasswordScreen:
        return MaterialPageRoute<void>(
            settings: setting, builder: (_) => VHS3PasswordScreen(username: Utils.getRouterObject(setting.arguments)));
      case vsr4SearchResult:
        return MaterialPageRoute<void>(
            settings: setting,
            builder: (_) => VSR4SearchResultScreen(
                  keyword: Utils.getRouterObject(setting.arguments, index: 0) ?? '',
                  blockModel: Utils.getRouterObject(setting.arguments, index: 1),
                  blockStream: Utils.getRouterObject(setting.arguments, index: 2),
                ));
      case vsr3Search:
        return MaterialPageRoute<void>(
            settings: setting, builder: (_) => VSR3SearchScreen(blockModel: setting.arguments as BlockModel));
      case vhsPromptScreen:
        return MaterialPageRoute<void>(
            settings: setting, builder: (_) => VHSPromptScreen(promptModel: setting.arguments as PromptModel));
      case retryViewPage:
        return MaterialPageRoute<void>(settings: setting, builder: (_) => RetryAreaView());
      default:
        return null;
    }
  }
}

// class VHSLoginQRCodeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
