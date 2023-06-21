import 'package:core/assets/images/images.dart';
import 'package:core/common/api/api_local_auth.dart';
import 'package:core/common/common.dart';
import 'package:core/common/connectivity/connectivity_core.dart';
import 'package:core/common/constants/user_settings.dart';
import 'package:core/components/core_component.dart';
import 'package:core/components/user/bnd_token.dart';
import 'package:core/language/app_localizations.dart';
import 'package:core/repositories/core_user_repository.dart';
import 'package:core/shared_preferences/global_variable_resource.dart';
import 'package:core/shared_preferences/local_storage_manager.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:vitan_edu/core/common/injection.dart';
import 'package:vitan_edu/core/common/vitan_user.dart';
import 'package:vitan_edu/core/theme/custom.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class LoginWithBiometricsWidget extends StatefulWidget {
  final bool canLogin;
  LoginWithBiometricsWidget({Key? key, this.canLogin = true}) : super(key: key);

  @override
  State<LoginWithBiometricsWidget> createState() => _LoginWithBiometricsWidgetState();
}

class _LoginWithBiometricsWidgetState extends State<LoginWithBiometricsWidget> with AutomaticKeepAliveClientMixin {
  final ConnectivityCore _connectivityCore = getItSuper();
  final VitanUser _vitanUser = getItSuper();
  final GlobalVariableResource _globalVariableResource = getItSuper();
  LocalAuthApi? biometrics = LocalAuthApi();

  bool get _isLoginBiometrics => LocalStoreManager.getBool(UserSettings.isLoginBiometric);

  @override
  void initState() {
    super.initState();
    if(!_globalVariableResource.isLogout)
    _checkLogin();
  }

  void _checkLogin() {
    if (_isLoginBiometrics) {
      Future.delayed(Duration(milliseconds: 500), () async {
        if (await _connectivityCore.checkConnect()) {
          _checkBiometric(isShowError: false);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return buildAuthenticate(context);
  }

  Widget buildAuthenticate(BuildContext context) {
    if(_isLoginBiometrics){
    return FutureBuilder<List<BiometricType>>(
      initialData: [],
      future: biometrics!.getListOfBiometricTypes(),
      builder: (BuildContext context, AsyncSnapshot<List<BiometricType>> snapshot) {
        if (snapshot.hasData && snapshot.data!.isNotEmpty)
          return Column(
            children: [
              SizedBox(height: 12),
              Text(AppLocalizations.of(context)!.translate('login_with_biometric')),
              SizedBox(height: 12),
              GestureDetector(
                onTap: () => _checkBiometric(),
                child: Images.svgAssets(snapshot.data?.first == BiometricType.face ? Images.icFaceId : Images.icFinger,
                    height: 42.h, width: 42.w, color: CustomTheme.tileLeadingColor),
              ),
            ],
          );
        return const SizedBox();
      },
    );}
    return const SizedBox.shrink();
  }

  void _onError(BuildContext context, String content, {isShowError = true}) {
    if (isShowError) alert<bool>(context, content);
  }

  Future<void> _checkBiometric({bool isShowError = true}) async {
    if (!LocalStoreManager.getBool(UserSettings.isLoginBiometric) || !widget.canLogin) {
      return _onError(context, AppLocalizations.of(context)!.translate('error_login_can_setting_biometrics'),
          isShowError: isShowError);
    } else {
      if (await biometrics!.isBiometricAvailable()) {
        await biometrics!.authenticateUser(onHandler: () async {
          showLoading();
          await _vitanUser.refreshToken(context);
          hideLoading();
        });
      } else {
        return _onError(context, AppLocalizations.of(context)!.translate('error_ios_setting_biometrics_des'),
            isShowError: isShowError);
      }
    }
  }

  @override
  bool get wantKeepAlive => true;
}
