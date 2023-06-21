import 'package:core/assets/images/images.dart';
import 'package:core/common/text_style.dart';
import 'package:core/components/bnd_avatar.dart';
import 'package:core/components/bnd_image.dart';
import 'package:core/components/bnd_touch.dart';
import 'package:core/components/user/bnd_user.dart';
import 'package:core/language/app_localizations.dart';
import 'package:core/model/user_info.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:vitan_edu/core/common/injection.dart';
import 'package:vitan_edu/core/theme/custom.dart';
import 'package:vitan_edu/features/presentation/vhs/vhs_prompt/bloc/vhs_prompt_bloc.dart';

class VHSPromptWidget extends StatelessWidget {
  final PromptModel promptModel;
  VHSPromptWidget({Key? key, required this.promptModel}) : super(key: key);

  Widget _height(double height) => SizedBox(height: height);
  Widget _width(double width) => SizedBox(width: width);
  final UserInfo? _currentUser = GetIt.I<AuthenticateApp>().getUserInfo();
  final VHSPromptBloc _bloc = getItSuper();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CustomTheme.paddingBodyDefault,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: BNDImage(imageUrl: Images.verification2StepImg),
            ),
          ),
          Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Có phải bạn đang cố gắng đăng nhập?',
                      style: textStyleHeadline6.copyWith(color: CustomTheme.textColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  _height(4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BnDAvatar(name: _currentUser?.name ?? '', imageUrl: _currentUser!.avatar ?? '', size: 12),
                      _width(10),
                      Text(_currentUser?.email ?? ''),
                    ],
                  ),
                  _height(24),
                  RichText(
                    text: TextSpan(
                      children: <InlineSpan>[
                        TextSpan(
                          text: AppLocalizations.of(context)!.translate("device") + ": ",
                          style: textStyleBodyMedium.copyWith(color: CustomTheme.textColor),
                        ),
                        TextSpan(
                          text: promptModel.browserName,
                          style: textStyleBodyMediumBold.copyWith(color: CustomTheme.textColor),
                        ),
                      ],
                    ),
                  ),
                  _height(20),
                  RichText(
                    text: TextSpan(
                      children: <InlineSpan>[
                        TextSpan(
                          text: AppLocalizations.of(context)!.translate("location") + ": ",
                          style: textStyleBodyMedium.copyWith(color: CustomTheme.textColor),
                        ),
                        TextSpan(
                          text: promptModel.address,
                          style: textStyleBodyMediumBold.copyWith(color: CustomTheme.textColor),
                        ),
                      ],
                    ),
                  ),
                  _height(20),
                  RichText(
                    text: TextSpan(
                      children: <InlineSpan>[
                        TextSpan(
                          text: AppLocalizations.of(context)!.translate("time") + ": ",
                          style: textStyleBodyMedium.copyWith(color: CustomTheme.textColor),
                        ),
                        TextSpan(
                          text: AppLocalizations.of(context)!.displayDateTime(promptModel.time),
                          style: textStyleBodyMediumBold.copyWith(color: CustomTheme.textColor),
                        ),
                      ],
                    ),
                  ),
                  _height(20),
                ],
              )),
          Row(
            children: [
              Expanded(
                child: BndTouch(
                  onPressed: () => Navigator.pop(context),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: CustomTheme.supperAppThemeColor),
                    ),
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Không phải tôi',
                      style: textStyleBodyDefault.copyWith(color: CustomTheme.textColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              _width(10),
              Expanded(
                child: BndTouch(
                  onPressed: () => _onAcceptPrompt(context),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: CustomTheme.supperAppThemeColor,
                    ),
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Đúng là tôi',
                      style: textStyleBodyDefault.copyWith(color: CustomTheme.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
            ],
          ),
          _height(20),
        ],
      ),
    );
  }

  Future<void> _onAcceptPrompt(BuildContext context) async {
    await _bloc.acceptPromt(promptModel.key);
    Navigator.of(context).pop();
  }
}

class PromptModel {
  PromptModel(
    this.ip,
    this.browserName,
    this.address,
    this.time,
    this.key,
  );

  String ip;
  String browserName;
  String address;
  DateTime time;
  String key;

  factory PromptModel.fromJson(Map<String, dynamic> json) => PromptModel(
        json["Ip"],
        json["BrowserName"],
        json["Address"],
        DateTime.parse(json["Time"]),
        json["Key"],
      );
}
