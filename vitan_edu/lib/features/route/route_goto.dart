import 'dart:async';
import 'package:api/id/model/login_response_model.dart';
import 'package:common/route/route_goto.dart';
import 'package:exam/features/route/route_goto.dart';
import 'package:flutter/material.dart';
import 'package:core/common/common.dart';
import 'package:guide/features/route/route_goto.dart';
import 'package:learn/features/route/route_goto.dart';
import 'package:vitan_edu/features/presentation/app_init/view/pages/app_init_screen.dart';
import 'package:core/components/vhs9_notification/bloc/vhs9_notification_bloc.dart';
import 'package:vitan_edu/features/presentation/vhs/vhs_prompt/views/widgets/vhs_prompt_widget.dart';

void notificationRouteGoTo(String objectType, BuildContext context, String actions, int blockId,
    {int? objectId, String? url}) {
  // Exam:
  if (blockId == BlockEnum.Exam.index &&
      notificationRouteExam(objectType, context, actions, blockId, objectId: objectId)) {
    return;
  }
  // Guide
  else if (blockId == BlockEnum.Guide.index &&
      notificationRouteGuide(objectType, context, actions, blockId, objectId: objectId)) {
    return;
  } else if (blockId == BlockEnum.Contest.index) {
    goToContest(context, params: url ?? '');
    return;
  } else if (blockId == BlockEnum.CommonData.index &&
      notificationRouteCommonData(objectType, context, actions, blockId, objectId: objectId)) {
    return;
  }
  else if (blockId == BlockEnum.Learn.index &&
      notificationRouteLearn(objectType, context, actions, objectId: objectId)) {
    return;
  }
  print('Route chưa được khai báo');
}

// vhs
void goToVHS2Onboarding(BuildContext context) {
  Navigator.pushNamed(context, vhs2OnboardRouteName);
}

void goToVHS5HomeSupperApp(BuildContext context, {bool isLogout = false}) {
  // Navigator.pushReplacementNamed(context, vhs5NavigatorBarWidget);
  // if (isLogout) {
  Navigator.pushNamedAndRemoveUntil(context, vhs5NavigatorBarWidget, (route) => false);
  // } else {
  //   if (LocalStoreManager.getString(UserSettings.currentScreen) != vhs5NavigatorBarWidget) {
  //     LocalStoreManager.setString(UserSettings.currentScreen, vhs5NavigatorBarWidget);
  //     Navigator.pushReplacementNamed(context, vhs5NavigatorBarWidget);
  //   }
  // }
}

void goToVHS6Personal(BuildContext context) {
  Navigator.pushNamed(context, vhs6personal);
}

void goToVHS9Notification(BuildContext context) {
  Navigator.pushNamed(context, vhs9Notification, arguments: [notificationRouteGoTo, goToVHS9NotificationFilter]);
}

void goToVHS9NotificationFilter(BuildContext context, VHS9NotificationBloc bloc) {
  Navigator.pushNamed(context, vhs9NotificationFilter, arguments: bloc);
}

void goToVHS10Otp(BuildContext context) {
  Navigator.pushNamed(context, vhs10Otp);
}

void goToVHSLoginQRCode(BuildContext context) {
  Navigator.pushNamed(context, vhsLoginQRCode);
}

void goToSettingApp(BuildContext context, String routeName) {
  Navigator.pushNamed(context, settingsApp);
}

void goToLogin(BuildContext context) {
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => AppInitScreen()), (route) => false);
}

void goToAppInit(BuildContext context) {
  Navigator.pushNamed(context, appInitRouteName);
}

void goToVHS7SecuritySettings(BuildContext context) {
  Navigator.pushNamed(context, vhs7SecuritySetting);
}

void goToExam(BuildContext context) async {
  Navigator.pushNamed(context, vhe8HomeScreenRouteName);
}

// void goToVEO5EventDetailScreen(BuildContext context, int id) async {
//   LocalStoreManager.setInt(SharedPreferenceKey.coreblockIdEventKey, LocalStoreManager.getInt(BlockSettings.blockKey));
//   Navigator.pushNamed(context, veo5EventDetailRouteName, arguments: <Object>[id]);
// }

// void goToVEO6ListMemberEventScreen(BuildContext context, int eventId) {
//   Navigator.pushNamed(context, veo6ListMemberRouteName, arguments: <Object>[eventId]);
// }

// //ve6
// void goToVEO2ListEventScreen(BuildContext context) {
//   LocalStoreManager.setInt(SharedPreferenceKey.coreblockIdEventKey, LocalStoreManager.getInt(BlockSettings.blockKey));
//   Navigator.pushNamed(context, veo2ListEventRouteName);
// }

void goToVHS3LoginUser(BuildContext context) {
  Navigator.pushNamedAndRemoveUntil(context, vhs3LoginUser, (Route<dynamic> route) => route.settings.name == appInitRouteName);
}

Future<bool> goToRegisterInformation(BuildContext context, {required LoginResponseModel loginResponseModel}) async {
  final data = await Navigator.pushNamed(context, registerInformation, arguments: loginResponseModel);
  return data != null ? data as bool : false;
}

void goToVHS4LoginPass(BuildContext context, String username) {
  Navigator.pushNamed(context, vhs4LoginPass, arguments: username);
}

// void goToVSR3SearchScreen(BuildContext context, {required BlockModel blockModel}) {
//   Navigator.pushNamed(context, vsr3Search, arguments: blockModel);
// }

Future<BlockModel?> goToVSR4SearchDetailScreen(BuildContext context,
    {required String keyWord,
    required BlockModel blockModel,
    bool isReplace = false,
    required StreamController blockStream}) async {
  final dynamic _block = isReplace
      ? await Navigator.pushReplacementNamed(context, vsr4SearchResult,
          arguments: <Object?>[keyWord, blockModel, blockStream])
      : await Navigator.pushNamed(context, vsr4SearchResult, arguments: <Object?>[keyWord, blockModel, blockStream]);
  return _block != null ? _block as BlockModel : null;
}

void goToContest(BuildContext context, {String params = ''}) {
  Navigator.pushNamed(context, contestHomeRouteName, arguments: <Object?>[params]);
}

void goToVHS3PasswordScreen(BuildContext context, {String? username, bool isLogout = false}) {
  if (isLogout) {
    Navigator.pushNamedAndRemoveUntil(context, vhs3PasswordScreen, (route) => false, arguments: username);
  } else {
    Navigator.pushNamed(context, vhs3PasswordScreen, arguments: username);
  }
}

void goToVHSPromptScreen(BuildContext context, PromptModel data) {
  Navigator.pushNamed(context, vhsPromptScreen, arguments: data);
}
