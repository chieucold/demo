import 'dart:io';
import 'package:api/common/model/app_settings/app_settings_entity.dart';
import 'package:core/assets/images/images.dart';
import 'package:core/common/app_settings/app_settings.dart';
import 'package:core/common/color/core_color.dart';
import 'package:core/common/constants/const/enum.dart';
import 'package:core/common/text_style.dart';
import 'package:core/components/bnd_touch.dart';
import 'package:core/language/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vitan_edu/core/common/injection.dart';
import 'package:vitan_edu/core/theme/custom.dart';
import 'package:vitan_edu/features/presentation/vhs/vhs6_personal/view/widgets/vhs6_webview_widget.dart';
import 'package:vitan_edu/features/presentation/vhs/vhs_3_login_user/bloc/vhs3_login_user_bloc.dart';
import 'package:vitan_edu/features/presentation/vhs/vhs_3_login_user/widgets/login_textfield_widget.dart';
import 'package:vitan_edu/features/route/route_goto.dart';

class LoginUserWidget extends StatefulWidget {
  const LoginUserWidget({Key? key, required this.pageController, required this.onSuccessUser, this.userName = ''})
      : super(key: key);
  final PageController pageController;
  final Function onSuccessUser;
  final String userName;

  @override
  State<LoginUserWidget> createState() => _LoginUserWidgetState();
}

class _LoginUserWidgetState extends State<LoginUserWidget> with AutomaticKeepAliveClientMixin {
  final VHS3LoginUserBloc _bloc = getItSuper();
  final AppSettingsEntity _appSettings =  getItSuper<AppSettings>().getAppSettings;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController()..text = widget.userName;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return OrientationBuilder(
      builder: (context, orientation) {
        final bool isLandScape = orientation == Orientation.landscape;
        return SingleChildScrollView(
          padding: CustomTheme.paddingBodyDefault,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: isLandScape ? 10 : 20),
                child: LoginTextFieldWidget(
                  initialValue: _controller.text,
                  controller: _controller,
                  labelText: AppLocalizations.of(context)!.translate('your_email'),
                ),
              ),
              ElevatedButton(
                onPressed: _voidCheckLogin,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    AppLocalizations.of(context)!.translate("continue"),
                    style: textStyleBodyDefault.copyWith(color: CustomTheme.white, fontSize: 18),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  primary: CustomTheme.supperAppThemeColor,
                  padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 32.h),
                ),
              ),
              SizedBox(height: isLandScape ? 12.h : 48.h),
              // Spacer(),
              _buildDivider(),
              _buildLoginSocial(),
              SizedBox(height: 12.h),
              // SizedBox(height: 160),
              // Spacer(),
              // _buildSignUp(),
              // SizedBox(height: isLandScape ? 12.h : 48.h),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDivider() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          padding: CustomTheme.paddingBodyDefault,
          child: Divider(
            thickness: 1,
            color: CustomTheme.vhsBorderColor,
          ),
        ),
        Container(
          color: CustomTheme.white,
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            AppLocalizations.of(context)!.translate('or_login_with'),
            style: textStyleBodySmall.copyWith(fontSize: 14.sp),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginSocial() {
    return Wrap(
      // alignment: WrapAlignment.center,
      children: [
        _buildIconSocial(
          icon: Images.icLoginFacebook2,
          title: 'Facebook',
          onPress: _bloc.loginFB,
        ),
        const SizedBox(width: 24),
        _buildIconSocial(
          icon: Images.icLoginGoogle2,
          title: 'Google',
          onPress: _bloc.loginGoogle,
        ),
        if (Platform.isIOS && _appSettings.configs.isShowAppleLogin == 1)
          _buildIconSocial(icon: Images.icLoginAppleId2, title: 'Apple', onPress: _bloc.loginAppleId, isIos: true),
      ],
    );
    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [
    //     CircleButtonWidget(
    //         onTap: () => _bloc.loginFB(),
    //         iconWidget: Images.svgAssets(Images.icLoginFacebook, height: 54.sp, width: 54.sp)),
    //     CircleButtonWidget(
    //       onTap: () => _bloc.loginGoogle(),
    //       iconWidget: Images.svgAssets(Images.icLoginGoogle, height: 54.sp, width: 54.sp),
    //     ),
    //     if (Platform.isIOS)
    //       CircleButtonWidget(
    //         onTap: () => _bloc.loginAppleId(),
    //         iconWidget: Images.svgAssets(Images.icLoginAppleId, height: 54.sp, width: 54.sp),
    //       ),
    //   ],
    // );
  }

  Widget _buildSignUp() {
    return Column(
      children: [
        Text(
          AppLocalizations.of(context)!.translate('do_not_have_an_account'),
          style: textStyleBodySmall.copyWith(fontSize: 16.sp),
        ),
        SizedBox(height: 4),
        ElevatedButton(
          onPressed: _onRegister,
          child: Text(
            AppLocalizations.of(context)!.translate("sign_up_now"),
            style: textStyleBodyDefaultBold.copyWith(fontSize: 16.sp, color: CustomTheme.textColor),
          ),
          style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            primary: CustomTheme.colorBackgroundTabBarApp,
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
          ),
        ),
      ],
    );
  }

  Widget _buildIconSocial(
      {required String icon, required String title, required Function onPress, bool isIos = false}) {
    final bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    return BndTouch(
      onPressed: () => onPress(),
      child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 16, left: isIos ? ScreenUtil().screenWidth * (isLandscape ? 0.15 : 0.2) : 0),
          width: (isLandscape ? ScreenUtil().screenHeight / 2 : ScreenUtil().screenWidth / 2.5),
          padding: EdgeInsets.fromLTRB(16, 17, 16, 18),
          decoration: BoxDecoration(
              color: kTextWhiteColor,
              border: Border.all(color: CustomTheme.vhs3BorderIconColor),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Images.svgAssets(icon, width: 24, height: 24),
              const SizedBox(width: 16),
              Flexible(
                child: Text(
                  title,
                  style: textStyleBodyDefault.copyWith(fontSize: 16.sp, color: CustomTheme.textColor),
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          )),
    );
  }

  Future<void> _voidCheckLogin() async {
    final bool check = await _bloc.checkLogin(_controller.text);
    if (check) {
      // widget.pageController.animateToPage(1, duration: Duration(milliseconds: 500), curve: Curves.ease);
      // widget.onSuccessUser(_controller.text);
      goToVHS3PasswordScreen(context, username: _controller.text);
    }
  }

  Future<void> _onRegister() async {
    await Navigator.of(context).push(
      MaterialPageRoute<bool>(
          builder: (BuildContext context) {
            return VHS6WebViewWidget(
              typeView: VHS6TypeWebView.register,
              classHide: ["txt-register"],
            );
          },
          fullscreenDialog: true),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
