import 'package:core/common/common.dart';
import 'package:core/common/enums/event_enum.dart';
import 'package:core/components/vhs9_notification/bloc/vhs9_notification_bloc.dart';
import 'package:core/shared_preferences/global_variable_resource.dart';
import 'package:flutter/material.dart';
import 'package:api/api/commondata_api_models.dart' as common;
import 'package:core/common/enums/module_enum.dart' as me;
import 'package:get_it/get_it.dart';

import '../components/choose_category/choose_category.dart';

bool notificationRouteCommonData(String objectType, BuildContext context, String actions, int blockId,
    {int? objectId, String? url}) {
  // Mời tham gia sự kiện
  if (objectType == me.ModuleEnum.Event.getValue) {
    goToVEO5EventDetailScreen(context, objectId!);
    return true;
  }
  return false;
}

void goToAppInit(BuildContext context) {
  Navigator.pushNamed(context, appInitRouteName);
}

void goToVNListNews(BuildContext context) {
  Navigator.pushNamed(context, vnListNewsRouteName);
}

void goToVNListOtherNews(BuildContext context) {
  Navigator.pushNamed(context, vnListOtherNewsRouteName);
}

void goToVNNewsDetail(BuildContext context, int id) {
  Navigator.pushNamed(context, vnNewsDetailRouteName, arguments: id);
}

void goToVEO6ListMemberEventScreen(BuildContext context, int eventId) {
  Navigator.pushNamed(context, veo6ListMemberEventRouteName, arguments: <Object>[eventId]);
}

void goToVEO2ListEventScreen(BuildContext context, {EventEnum eventEnum = EventEnum.All}) {
  // LocalStoreManager.setInt(SharedPreferenceKey.coreblockIdEventKey, LocalStoreManager.getInt(BlockSettings.blockKey));
  // print('${LocalStoreManager.getInt(SharedPreferenceKey.coreblockIdEventKey)}');
  Navigator.pushNamed(context, veo2ListEventRouteName, arguments: eventEnum);
}

void goToVEO5EventDetailScreen(BuildContext context, int id) async {
  // LocalStoreManager.setInt(SharedPreferenceKey.coreblockIdEventKey, LocalStoreManager.getInt(BlockSettings.blockKey));
  // print('${LocalStoreManager.getInt(SharedPreferenceKey.coreblockIdEventKey)}');
  Navigator.pushNamed(context, veo5EventDetailRouteName, arguments: <Object>[id]);
}

void goToVHS6Personal(BuildContext context) {
  Navigator.pushNamed(context, vhs6personal);
}

Future<common.BlockCategoryResource?> goToVCE1CompetitionCategory(
  BuildContext context, {
  ChooseCategoryTypeEnum type = ChooseCategoryTypeEnum.fromCompetitive,
  int currentId = 0,
  int parentId = 0,
  bool isShowBack = true,
  String title = '',
}) async {
  GetIt.I<GlobalVariableResource>().setIsBackChooseCategory(isBackChooseCategory: isShowBack);
  final dynamic data = await showGeneralDialog(
      context: context,
      pageBuilder: (_, __, ___) {
        return ChooseCategory(
          currentId: currentId,
          parentId: parentId,
          //chooseCategoryTypeEnum: type.index,
          title: title,
        );
      });

  return data != null ? data as common.BlockCategoryResource : null;
}

void goToVSR3SearchScreen(BuildContext context, {required BlockModel blockModel}) {
  Navigator.pushNamed(context, vsr3Search, arguments: blockModel);
}

void goToVHS9Notification(BuildContext context) {
  Navigator.pushNamed(context, vhs9Notification, arguments: [notificationRouteCommonData, goToVHS9NotificationFilter]);
}

void goToVHS9NotificationFilter(BuildContext context, VHS9NotificationBloc bloc) {
  Navigator.pushNamed(context, vhs9NotificationFilter, arguments: bloc);
}

void goToContactScreen(BuildContext context) {
  Navigator.pushNamed(context, vhsContactScreen);
}
