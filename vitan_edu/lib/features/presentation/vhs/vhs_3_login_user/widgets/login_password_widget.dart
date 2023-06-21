import 'package:api/id/model/login_request_model.dart';
import 'package:core/common/common.dart';
import 'package:core/common/text_style.dart';
import 'package:core/language/app_localizations.dart';
import 'package:core/shared_preferences/local_storage_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vitan_edu/core/common/injection.dart';
import 'package:vitan_edu/core/common/vitan_user.dart';
import 'package:vitan_edu/core/theme/custom.dart';
import 'package:vitan_edu/features/presentation/login_auth_finger/login_with_biometrics_widget.dart';
import 'package:vitan_edu/features/presentation/vhs/vhs6_personal/view/widgets/vhs6_webview_widget.dart';
import 'package:vitan_edu/features/presentation/vhs/vhs_3_login_user/bloc/vhs3_login_user_bloc.dart';
import 'package:vitan_edu/features/presentation/vhs/vhs_3_login_user/widgets/login_textfield_widget.dart';

class LoginPasswordWidget extends StatefulWidget {
  final String username;
  final PageController pageController;
  final Function onSuccessLogin;
  final bool isLoginBiometrics;

  const LoginPasswordWidget(
      {Key? key,
      required this.username,
      required this.pageController,
      required this.onSuccessLogin,
      this.isLoginBiometrics = false})
      : super(key: key);

  @override
  State<LoginPasswordWidget> createState() => _LoginPasswordWidgetState();
}

class _LoginPasswordWidgetState extends State<LoginPasswordWidget> {
  bool _passwordVisible = true;
  TextEditingController _passController = TextEditingController();
  final VHS3LoginUserBloc _bloc = getItSuper();
  String? captcha;

  bool get _canLoginBiometrics =>
      widget.username.isEmpty || widget.username == LocalStoreManager.getString(UserSettings.keyUserName);

  bool get _isLoginBiometrics => LocalStoreManager.getBool(UserSettings.isLoginBiometric);

  String get _userName => widget.username;

  @override
  void initState() {
    super.initState();
    if (_isLoginBiometrics) {
      ///Auto login if turn on biomectric
      //       showLoading();
      // _vitanUser.refreshToken(context).whenComplete(() => hideLoading());

    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: CustomTheme.paddingBodyDefault,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // SizedBox(height: 20),
          // Align(
          //     alignment: Alignment.center,
          //     child: Text(_userName,
          //         textAlign: TextAlign.start, style: textStyleBodyMediumBold.copyWith(color: kTextColor))),
          SizedBox(height: 20),
          LoginTextFieldWidget(
            controller: _passController,
            labelText: AppLocalizations.of(context)!.translate('password'),
            obscureText: _passwordVisible,
            suffixIcon: IconButton(
              icon: Icon(
                _passwordVisible ? Icons.visibility : Icons.visibility_off,
                color: CustomTheme.textColor6,
                size: 18.sp,
              ),
              onPressed: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
            ),
          ),
          LoginWithBiometricsWidget(canLogin: _canLoginBiometrics),
          SizedBox(height: 16.sp),
          ElevatedButton(
            onPressed: _login,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                AppLocalizations.of(context)!.translate("login"),
                style: textStyleBodyDefaultBold.copyWith(color: CustomTheme.white, fontSize: 18),
              ),
            ),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              primary: CustomTheme.supperAppThemeColor,
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 32.h),
            ),
          ),
          SizedBox(height: 12),
          Container(
            // width: double.infinity,
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: _onForgotPassword,
              child: Text(AppLocalizations.of(context)!.translate("forgot_your_password"),
                  style: textStyleBodyDefaultBold.copyWith(color: CustomTheme.textColor, fontWeight: FontWeight.w400)),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _login() async {
    final _request = LoginRequestModel(username: _userName, password: _passController.text, captcha: captcha ?? '');
    final res = await _bloc.login(_request, context, (String token) {
      captcha = token;
    });
    if (res.isNotEmpty) {
      widget.pageController.animateToPage(1, duration: Duration(milliseconds: 500), curve: Curves.ease);
      widget.onSuccessLogin(res);
    }
  }

  Future<void> _onForgotPassword() async {
    await Navigator.of(context).push(
      MaterialPageRoute<bool>(
          builder: (BuildContext context) {
            return VHS6WebViewWidget(
              typeView: VHS6TypeWebView.forgotPassword,
              classHide: ["txt-register"],
            );
          },
          fullscreenDialog: true),
    );
  }
}
