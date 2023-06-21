import 'dart:async';
import 'package:api/id/model/otp_user_model.dart';
import 'package:core/common/common.dart';
import 'package:core/common/text_style.dart';
import 'package:core/components/button/border_button_widget.dart';
import 'package:core/components/button/primary_button_widget.dart';
import 'package:core/components/otp/otp_show_widget.dart';
import 'package:core/language/app_localizations.dart';
import 'package:core/usecases/otp/otp_usecases.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:vitan_edu/core/theme/custom.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dartz/dartz.dart' as dartz;

class VHS10OtpWidget extends StatefulWidget {
  const VHS10OtpWidget({Key? key}) : super(key: key);

  @override
  State<VHS10OtpWidget> createState() => _VHS10OtpWidgetState();
}

class _VHS10OtpWidgetState extends State<VHS10OtpWidget> {
  late Timer _timer;
  int _timeAutoLoad = 2;
  int _start = 0;
  final OtpUsecases _otpUsecases = GetIt.I<OtpUsecases>();
  String _otpCode = '';

  @override
  void initState() {
    super.initState();
    _getOtp();
  }

  Future<void> _getOtp() async {
    showLoading();
    final dartz.Either<String, OtpUserModel> res = await _otpUsecases.getOtpUser();
    res.fold((_) => null, (OtpUserModel r) {
      _otpCode = r.value ?? 0.toString();
      _start = r.expirySecond!;
      hideLoading();
      startTimer();
    });
  }

  void startTimer() {
    const Duration oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          if (_timeAutoLoad > 0) {
            _timeAutoLoad--;
            timer.cancel();
            _getOtp();
            setState(() {});
          } else {
            setState(() {
              timer.cancel();
            });
          }
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: CustomTheme.paddingBodyDefault,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 42.sp),
            child: Text(
              _isTimeOut
                  ? AppLocalizations.of(context)!.translate('code_has_expired')
                  : AppLocalizations.of(context)!.translate('enter_the_code_below_to_login'),
              style: textStyleBodyDefault,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 28),
          OTPShowWidget(
            otpCode: _otpCode,
            textStyle: textStyleHeadline5.copyWith(
                fontSize: 30.sp,
                fontWeight: FontWeight.w400,
                color: CustomTheme.textColor.withOpacity(_isTimeOut ? 0.3 : 1)),
          ),
          SizedBox(height: 24),
          if (!_isTimeOut)
            Text(
              AppLocalizations.of(context)!.translate('code_will_expire_later'),
              style: textStyleBodyDefault,
            ),
          SizedBox(height: 2),
          if (!_isTimeOut)
            Text(
              formatedTime(_start),
              style: textStyleBodyMedium,
            ),
          SizedBox(height: 48),
          _isTimeOut
              ? PrimaryButtonWidget(
                  backgroundColor: CustomTheme.tileLeadingColor,
                  title: AppLocalizations.of(context)!.translate('get_new_code').toUpperCase(),
                  onPressed: () {
                    _getOtp();
                  },
                  iconSize: 0,
                  margin: EdgeInsets.symmetric(horizontal: 60.sp),
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
                  isGradient: false,
                )
              : Container(
                  padding: EdgeInsets.symmetric(horizontal: 88.sp),
                  child: BorderButtonWidget(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    title: AppLocalizations.of(context)!.translate('cancel').toUpperCase(),
                    iconSize: 0,
                    textStyle: textStyleBodyDefaultBold.copyWith(fontSize: 16.sp, color: CustomTheme.textColor),
                  ),
                )
        ],
      ),
    );
  }

  bool get _isTimeOut {
    if (_start == 0 && _timeAutoLoad == 0) {
      return true;
    }
    return false;
  }

  String formatedTime(int secTime) {
    String getParsedTime(String time) {
      if (time.length <= 1) return "0$time";
      return time;
    }

    int min = secTime ~/ 60;
    int sec = secTime % 60;
    String parsedTime = getParsedTime(min.toString()) + " : " + getParsedTime(sec.toString());
    return parsedTime;
  }
}
