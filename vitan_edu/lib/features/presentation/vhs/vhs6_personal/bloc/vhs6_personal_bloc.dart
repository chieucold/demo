import 'package:core/components/core_component.dart';
import 'package:core/language/app_localizations.dart';
import 'package:core/model/user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vitan_edu/core/common/injection.dart';
import 'package:vitan_edu/core/common/vitan_user.dart';
import 'package:core/components/vhs9_notification/bloc/vhs9_notification_bloc.dart';

class VHS6PersonalBloc extends Cubit<UserInfo?> {
  final AuthenticateApp _authenticateApp;
  final VitanUser _examUser;
  VHS6PersonalBloc(this._authenticateApp, this._examUser) : super(null);
  Function? onInfoUpdated;

  void logout(BuildContext context) async{
    showAlertDialog(context,
        content: AppLocalizations.of(context)!.translate("logout_confirm_content"),
        okText: AppLocalizations.of(context)!.translate("logout"), onOk: () async{
       getItSuper.resetLazySingleton<VHS9NotificationBloc>();
      _examUser.logOut(context);
    });
  }

  void updateInfo({bool isCallBack = true}) {
    final UserInfo? currentUser = _authenticateApp.getUserInfo();
    emit(currentUser);
    if (onInfoUpdated != null && isCallBack) onInfoUpdated!();
  }

  void init({Function? onInfoUpdated}) {
    this.onInfoUpdated = onInfoUpdated;
  }
}
