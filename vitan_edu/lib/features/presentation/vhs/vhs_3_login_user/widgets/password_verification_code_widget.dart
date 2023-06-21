import 'dart:async';

import 'package:api/id/model/login_request_model.dart';
import 'package:api/id/model/login_response_model.dart';
import 'package:core/common/common.dart';
import 'package:core/common/text_style.dart';
import 'package:core/components/core_component.dart';
import 'package:core/language/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vitan_edu/core/common/injection.dart';
import 'package:vitan_edu/core/theme/custom.dart';
import 'package:vitan_edu/features/presentation/vhs/vhs_3_login_user/bloc/vhs3_login_user_bloc.dart';
import 'package:vitan_edu/features/presentation/vhs/vhs_3_login_user/widgets/login_textfield_widget.dart';

class PasswordVerificationCodeWidget extends StatefulWidget {
  final String username;
  const PasswordVerificationCodeWidget({Key? key, required this.username}) : super(key: key);

  @override
  State<PasswordVerificationCodeWidget> createState() => _PasswordVerificationCodeWidgetState();
}

class _PasswordVerificationCodeWidgetState extends State<PasswordVerificationCodeWidget> {
  TextEditingController _optionController = TextEditingController();
  TextEditingController _enterCodeController = TextEditingController();
  String _otpSupportType = '';
  int _start = 0;
  String sendCode = '';
  late Timer _timer;
  final VHS3LoginUserBloc _bloc = getItSuper();
  List<TwoFactorType> _listOtpSupport = [];
  bool _isShowloading = true;

  @override
  void initState() {
    super.initState();
    _getListOtpSupport();
  }

  void _getListOtpSupport() async {
    _listOtpSupport = await _bloc.getLoginOTPSupport(widget.username);
    if (_listOtpSupport.isNotEmpty) _otpSupportType = _listOtpSupport[0].type;
    _isShowloading = false;
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    sendCode = AppLocalizations.of(context)!.translate('send_code');
  }

  void startTimer() {
    const Duration oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isShowloading) return Center(child: CupertinoActivityIndicator());
    return SingleChildScrollView(
      primary: false,
      child: Container(
        padding: CustomTheme.paddingBodyDefault,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // SizedBox(height: 20),
            // Text(AppLocalizations.of(context)!.translate('select_method_enter_verification_code')),
            SizedBox(height: 20),
            _buildPopupMenu(),
            SizedBox(height: 32),
            LoginTextFieldWidget(
              controller: _enterCodeController,
              labelText: AppLocalizations.of(context)!.translate('enter_verification_code'),
              maxLength: 6,
              textInputType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
              suffixIcon: _buildSendCodeButton,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _onLogin,
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
          ],
        ),
      ),
    );
  }

  Widget _buildPopupMenu() {
    return PopupMenuButton<TwoFactorType>(
      offset: const Offset(0, 56),
      child: LoginTextFieldWidget(
        enabled: false,
        controller: _optionController,
        initialValue: _listOtpSupport[0].title,
        suffixIcon: Icon(
          Icons.arrow_drop_down_outlined,
          color: CustomTheme.textColor6,
          size: 18.sp,
        ),
        contentPadding: CustomTheme.paddingBodyDefault.copyWith(right: 0, top: 16, bottom: 16),
      ),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
      padding: EdgeInsets.zero,
      itemBuilder: (BuildContext context) => <PopupMenuEntry<TwoFactorType>>[
        for (int i = 0; i < _listOtpSupport.length; i++)
          PopupMenuItem<TwoFactorType>(
              value: _listOtpSupport[i],
              height: 48,
              child: Container(width: double.infinity, child: Text(_listOtpSupport[i].title))),
      ],
      onSelected: (TwoFactorType item) {
        _chooseItem(item);
      },
    );
  }

  Widget get _buildSendCodeButton {
    if (_otpSupportType == TwoFactorTypeEnum.email.getValue && _start == 0) {
      return Container(
        padding: EdgeInsets.only(right: 12),
        child: TextButton(
          child: Text(
            sendCode,
            style: textStyleBodySmall.copyWith(
                color: CustomTheme.supperAppThemeColor, decoration: TextDecoration.underline),
          ),
          onPressed: () async {
            final res = await _bloc
                .twoFactorSendCode(TwoFactorSendCode(codeReceiveMethod: _otpSupportType, userName: widget.username));
            _start = res.data?.expirySecond ?? 0;
            sendCode = AppLocalizations.of(context)!.translate('resend_code');
            startTimer();
          },
        ),
      );
    }

    if (_otpSupportType == TwoFactorTypeEnum.email.getValue && _start != 0) {
      return Container(
        padding: EdgeInsets.only(right: 12),
        child: TextButton(
          child: Text(
            // 'Gửi lại sau ($_start)s',
            AppLocalizations.of(context)!.translate('resend_code_later').replaceAll('{{second}}', '$_start'),
            style: textStyleBodySmall.copyWith(
                color: CustomTheme.supperAppThemeColor, decoration: TextDecoration.underline),
          ),
          onPressed: null,
        ),
      );
    }
    return SizedBox.shrink();
  }

  void _onLogin() {
    if (_enterCodeController.text.isNotEmpty) {
      _bloc.loginTwoFactor(_otpSupportType, widget.username, _enterCodeController.text);
    } else {
      showErrorMessage('Mã xác minh không được để trống');
    }
  }

  void _chooseItem(TwoFactorType item) {
    _optionController.text = item.title;
    _otpSupportType = item.type;
    _enterCodeController.clear();
    setState(() {});
  }
}
