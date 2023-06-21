import 'dart:async';

import 'package:api/id/model/login_request_model.dart';
import 'package:api/id/model/login_response_model.dart';
import 'package:core/common/common.dart';
import 'package:core/common/text_style.dart';
import 'package:core/components/core_component.dart';
import 'package:core/language/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vitan_edu/core/common/injection.dart';
import 'package:vitan_edu/core/theme/custom.dart';
import 'package:vitan_edu/features/presentation/vhs/vhs_3_login_user/bloc/vhs3_login_user_bloc.dart';

import 'login_textfield_widget.dart';

class LoginTwoFactorWidget extends StatefulWidget {
  const LoginTwoFactorWidget({Key? key, required this.twoFactorOption, required this.username}) : super(key: key);
  final List<TwoFactorType> twoFactorOption;
  final String username;

  @override
  _LoginTwoFactorWidgetState createState() => _LoginTwoFactorWidgetState();
}

class _LoginTwoFactorWidgetState extends State<LoginTwoFactorWidget> {
  TextEditingController _optionController = TextEditingController();
  TextEditingController _enterCodeController = TextEditingController();
  String twoFactorType = '';
  int _start = 0;
  String sendCode = '';
  late Timer _timer;
  final VHS3LoginUserBloc _bloc = getItSuper();

  bool get _isRecovery => twoFactorType == TwoFactorTypeEnum.recovery.getValue;

  @override
  void initState() {
    super.initState();
    twoFactorType = widget.twoFactorOption[0].type;
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
    return SingleChildScrollView(
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
              labelText: AppLocalizations.of(context)!.translate('enter_two_factor_code'),
              maxLength: _isRecovery ? null : 6,
              textInputType: _isRecovery ? null : TextInputType.number,
              inputFormatters: _isRecovery ? null : <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
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
    final List<TwoFactorType> _twoFactorType = widget.twoFactorOption;
    return PopupMenuButton<TwoFactorType>(
      offset: const Offset(0, 56),
      child: LoginTextFieldWidget(
        enabled: false,
        controller: _optionController,
        initialValue: widget.twoFactorOption[0].title,
        suffixIcon: Icon(
          Icons.arrow_drop_down_outlined,
          color: CustomTheme.textColor6,
          size: 18.sp,
        ),
        contentPadding: CustomTheme.paddingBodyDefault.copyWith(right: 0, top: 16, bottom: 16),
      ),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
      padding: EdgeInsets.zero,
      itemBuilder: (BuildContext context) => <PopupMenuEntry<TwoFactorType>>[
        for (int i = 0; i < _twoFactorType.length; i++)
          PopupMenuItem<TwoFactorType>(
              value: _twoFactorType[i],
              height: 48,
              child: Container(width: double.infinity, child: Text(_twoFactorType[i].title))),
      ],
      onSelected: (TwoFactorType item) {
        _chooseItem(item);
      },
    );
  }

  Widget get _buildSendCodeButton {
    if (twoFactorType == TwoFactorTypeEnum.email.getValue && _start == 0) {
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
                .twoFactorSendCode(TwoFactorSendCode(codeReceiveMethod: twoFactorType, userName: widget.username));
            _start = res.data?.expirySecond ?? 0;
            sendCode = AppLocalizations.of(context)!.translate('resend_code');
            startTimer();
          },
        ),
      );
    }

    if (twoFactorType == TwoFactorTypeEnum.email.getValue && _start != 0) {
      return Container(
        padding: EdgeInsets.only(right: 12),
        child: TextButton(
          child: Text(
            // 'Gửi lại sau ($_start)s',
            AppLocalizations.of(context)!.translate('resend_code_later').replaceAll('second', '$_start'),
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
      _bloc.loginTwoFactor(twoFactorType, widget.username, _enterCodeController.text);
    } else {
      showErrorMessage(AppLocalizations.of(context)!.translate('please_enter_two_factor_code'));
    }
  }

  void _chooseItem(TwoFactorType item) {
    _optionController.text = item.title;
    twoFactorType = item.type;
    _enterCodeController.clear();
    setState(() {});
  }
}
