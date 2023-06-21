import 'dart:async';

import 'package:core/assets/images/images.dart';
import 'package:core/common/api/api_local_auth.dart';
import 'package:core/common/color/core_color.dart';
import 'package:core/common/constants/user_settings.dart';
import 'package:core/common/text_style.dart';
import 'package:core/components/common_leading_widget.dart';
import 'package:core/components/dialog/bnd_general_dialog.dart';
import 'package:core/language/app_localizations.dart';
import 'package:core/shared_preferences/local_storage_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vitan_edu/core/common/injection.dart';
import 'package:vitan_edu/core/theme/custom.dart';
import 'package:vitan_edu/core/widget/appbar_widget/app_bar_supper_app.dart';
import 'package:vitan_edu/features/presentation/app/bloc/app_bloc.dart';
import 'package:vitan_edu/features/presentation/app/bloc/app_state.dart';

class VHS7SecuritySettingPage extends StatefulWidget {
  const VHS7SecuritySettingPage({Key? key}) : super(key: key);

  @override
  _VHS7SecuritySettingPageState createState() => _VHS7SecuritySettingPageState();
}

class _VHS7SecuritySettingPageState extends State<VHS7SecuritySettingPage> {
  late bool isBiometricsTransaction;
  final AppBloc _appBloc = getItSuper<AppBloc>();
  LocalAuthApi? biometrics = LocalAuthApi();
  List<int> listDropDown = [0, 1, 2, 5, 10, 15, 20, 25, 30];

  @override
  void initState() {
    super.initState();
    isBiometricsTransaction = LocalStoreManager.getBool(UserSettings.transactionWithBiometric);
  }

  Future<bool> _changeBiometric(bool isBiometric) async {
    bool temp = true;
    if (await biometrics!.isBiometricAvailable()) {
      await biometrics!.getListOfBiometricTypes(isOpenSetting: true).then((value) async {
        if (value.isNotEmpty)
          await biometrics!.authenticateUser(onHandler: () => _appBloc.changeIsBiometric(isBiometric));
      });
    }
    return temp;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSupperApp(
        leading: CommonLeadingWidget(iconColor: kTextColor),
        title: AppLocalizations.of(context)!.translate("security_setting"),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) => SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) => SingleChildScrollView(
            child: SingleChildScrollView(
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _buildField(
                      Images.icFinger,
                      AppLocalizations.of(context)!.translate('login_app'),
                      AppLocalizations.of(context)!.translate('use_your_fingerprint_login_app'),
                      _appBloc.isBiometric,
                      _changeBiometric),
                  Divider(thickness: 6),
                  _buildField(
                      Images.icNotiSetting,
                      AppLocalizations.of(context)!.translate('set_passcode'),
                      AppLocalizations.of(context)!.translate('alert_set_passcode') +
                          '.' +
                          AppLocalizations.of(context)!.translate('alert_delete_app_when_forgot_pass_code'),
                      _appBloc.isPassCode, (status) {
                    showLockScreen(context,
                        opaque: true,
                        isCancel: true,
                        isReset: _appBloc.isPassCode,
                        streamController: _appBloc.verificationNotifier,
                        onComplete: (String text) => _appBloc.changePassCode(text));
                  }),
                  Visibility(
                      visible: _appBloc.isPassCode,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          children: [
                            Icon(Icons.timer, color: CustomTheme.supperAppThemeColor),
                            const SizedBox(width: 8),
                            Text(AppLocalizations.of(context)!.translate('time_waiting_lock'),
                                style: textStyleHeadline6.copyWith(color: kTextColor)),
                            const Spacer(),
                            BndDropDownWidget(
                              defaultModel: LocalStoreManager.getInt(UserSettings.keyLockTime),
                              onTap: (value) {
                                _appBloc.changeDurationLockScreen(value);
                              },
                              listDropDown: listDropDown,
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildField(String imageName, String title, String hintText, bool value, Function(bool status) onChange) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Images.svgAssets(imageName),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(title, style: textStyleHeadline6.copyWith(color: kTextColor)),
                  const SizedBox(height: 4),
                  Text(hintText, style: textStyleBodyDefault.copyWith(color: CustomTheme.vhs7HintFieldColor)),
                ],
              ),
            ),
          ),
          CupertinoSwitch(
              activeColor: CustomTheme.supperAppThemeColor,
              value: value,
              onChanged: (bool value) {
                onChange(value);
              })
        ],
      ),
    );
  }
}

class BndDropDownWidget extends StatefulWidget {
  final List<int> listDropDown;
  final int defaultModel;
  final Function(int dropDownModel) onTap;

  const BndDropDownWidget({Key? key, required this.listDropDown, required this.onTap, required this.defaultModel})
      : super(key: key);

  @override
  State<BndDropDownWidget> createState() => _BndDropDownWidgetState();
}

class _BndDropDownWidgetState extends State<BndDropDownWidget> {
  List<int> get _listDropDown => widget.listDropDown;
  int dropdownValue = 0;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.defaultModel;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      value: dropdownValue,
      menuMaxHeight: 200,
      alignment: Alignment.bottomLeft,
      icon: const Icon(Icons.arrow_drop_down_outlined),
      elevation: 16,
      style: textStyleBodySmall.copyWith(color: kTextColor),
      underline: const SizedBox.shrink(),
      onChanged: (int? newValue) {
        setState(() {
          dropdownValue = newValue!;
          widget.onTap(newValue);
        });
      },
      items: _listDropDown.map<DropdownMenuItem<int>>((int value) {
        return DropdownMenuItem<int>(
          alignment: Alignment.center,
          value: value,
          child: Text(_getTitle(value)),
        );
      }).toList(),
    );
  }

  String _getTitle(int value) {
    if (value == 0) return AppLocalizations.of(context)!.translate('lock_pass_code_now');
    return '${value}' + ' ' + AppLocalizations.of(context)!.translate('minute');
  }
}
