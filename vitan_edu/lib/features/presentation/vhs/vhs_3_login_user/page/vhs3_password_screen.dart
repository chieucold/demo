import 'dart:io';

import 'package:api/id/model/login_response_model.dart';
import 'package:core/common/app_settings/app_settings.dart';
import 'package:core/common/bnd_cupertino_will_pop_scope/cupertino_will_pop_scope.dart';
import 'package:core/common/color/core_color.dart';
import 'package:core/common/common.dart';
import 'package:core/common/text_style.dart';
import 'package:core/components/common_leading_widget.dart';
import 'package:core/components/core_component.dart';
import 'package:core/language/app_localizations.dart';
import 'package:core/shared_preferences/local_storage_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:vitan_edu/core/common/injection.dart';
import 'package:vitan_edu/core/theme/custom.dart';
import 'package:vitan_edu/core/widget/appbar_widget/app_bar_supper_app.dart';
import 'package:vitan_edu/features/presentation/vhs/vhs_3_login_user/widgets/login_password_widget.dart';
import 'package:vitan_edu/features/presentation/vhs/vhs_3_login_user/widgets/login_two_factor_widget.dart';
import 'package:vitan_edu/features/presentation/vhs/vhs_3_login_user/widgets/password_verification_code_widget.dart';
import 'package:vitan_edu/features/route/route_goto.dart';

class VHS3PasswordScreen extends StatefulWidget {
  final String? username;

  const VHS3PasswordScreen({Key? key, this.username}) : super(key: key);

  @override
  State<VHS3PasswordScreen> createState() => _VHS3PasswordScreenState();
}

class _VHS3PasswordScreenState extends State<VHS3PasswordScreen> {
  late PageController _controller;
  final AuthenticateApp _authenticateApp = getItSuper();
  int _indexPageController = 0;

  String get _username => widget.username ?? LocalStoreManager.getString(UserSettings.keyUserName);
  List<TwoFactorType> _twoFactorOption = [];

  bool get _isLogin => !LocalStoreManager.getString(UserSettings.refreshToken).isNullOrEmpty;
  final AppSettings _appSettings = GetIt.I<AppSettings>();

  int _indexStack = 0;

  bool _hideLoginOtp = false;

  @override
  void initState() {
    // logger.d(LocalStoreManager.getString(UserSettings.keyUserName));
    _controller = PageController(initialPage: _indexPageController, keepPage: true, viewportFraction: 1);
    if (_username.isNullOrEmpty) {
      _hideLoginOtp = true;
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ConditionalWillPopScope(
      onWillPop: () async {
        _onBack();
        return Future.value(true);
      },
      shouldAddCallback: Platform.isAndroid,
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: AppBarSupperApp(height: 0),
        body: Stack(
          children: [
            OrientationBuilder(builder: (_, Orientation ori) {
              final String _imgLogo = _appSettings.configs.imgLogoLogin;
              return Column(
                children: [
                  SizedBox(height: 20),
                  ori == Orientation.portrait ? BNDImage(imageUrl: _imgLogo, height: 150.sp) : SizedBox(height: 32.sp),
                  if (widget.username.isNullOrEmpty)
                    Container(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        alignment: Alignment.center,
                        child: Text(_username,
                            textAlign: TextAlign.start, style: textStyleBodyMediumBold.copyWith(color: kTextColor))),
                  Container(
                    // scrollDirection: Axis.horizontal,
                    padding: CustomTheme.paddingBodyDefault,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        _title(0, 'by_password'),
                        SizedBox(width: 12),
                        if (!_hideLoginOtp) _title(1, 'by_verification_code'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: IndexedStack(
                      index: _indexStack,
                      children: [
                        PageView(
                          physics: NeverScrollableScrollPhysics(),
                          controller: _controller,
                          children: [
                            LoginPasswordWidget(
                              pageController: _controller,
                              username: _username,
                              onSuccessLogin: (List<TwoFactorType> twoFactorOption) {
                                _twoFactorOption = twoFactorOption;
                                _hideLoginOtp = true;
                                setState(() {});
                              },
                            ),
                            LoginTwoFactorWidget(
                              twoFactorOption: _twoFactorOption,
                              username: _username,
                            ),
                          ],
                        ),
                        if (!_hideLoginOtp) PasswordVerificationCodeWidget(username: _username),
                      ],
                    ),
                  )
                ],
              );
            }),
            Positioned(
              top: 10,
              child: CommonLeadingWidget(
                iconColor: CustomTheme.textColor,
                onPress: () async {
                  _onBack();
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _title(int i, String text) {
    return InkWell(
      onTap: _jumpPageView(i),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        alignment: Alignment.bottomCenter,
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 500),
          style: _indexStack == i ? CustomTheme.selectLoginTitleStyle : CustomTheme.unSelectLoginTitleStyle,
          child: Text(AppLocalizations.of(context)!.translate(text)),
        ),
      ),
    );
  }

  void _onBack() {
    if (_isLogin) {
      showConfirmDialog(context, AppLocalizations.of(context)!.translate('confirm_switch_account_login'),
          onSubmit: () async {
        await _authenticateApp.clearData();
        goToVHS3LoginUser(context);
      });
    } else {
      goToVHS3LoginUser(context);
    }
  }

  Function()? _jumpPageView(int i) {
    if (_indexStack == i) return null;
    return () => setState(() => _indexStack = i);
  }
}
