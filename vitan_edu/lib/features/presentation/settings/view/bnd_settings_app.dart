// import 'package:core/language/app_localizations.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:local_auth/auth_strings.dart';
// import 'package:core/components/core_component.dart';
// import 'package:vitan_edu/core/api/api_local_auth.dart';
// import 'package:vitan_edu/core/common/injection.dart';
// import 'package:vitan_edu/core/widget/appbar_widget/app_bar_custom.dart';
// import 'package:vitan_edu/features/presentation/app/bloc/app_learn_bloc.dart';
// import 'package:vitan_edu/features/presentation/app/bloc/app_state.dart';
//
// enum SettingType { BIOMETRIC, LANGUAGE, THEME }
//
// class BndSettingsApp extends StatefulWidget {
//   const BndSettingsApp({Key? key}) : super(key: key);
//
//   @override
//   _BndSettingsAppState createState() => _BndSettingsAppState();
// }
//
// class _BndSettingsAppState extends State<BndSettingsApp> {
//   final AppBloc _appBloc = getItSuper<AppBloc>();
//   LocalAuthApi? biometrics;
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final IOSAuthMessages iosStrings = IOSAuthMessages(
//       cancelButton: AppLocalizations.of(context)?.translate('cancel'),
//       goToSettingsButton: AppLocalizations.of(context)?.translate('setting'),
//       goToSettingsDescription: AppLocalizations.of(context)?.translate('error_ios_setting_biometrics_des'),
//       lockOut: AppLocalizations.of(context)?.translate('error_ios_lockout_biometrics_msg'),
//     );
//     final AndroidAuthMessages androidStrings = AndroidAuthMessages(
//       biometricHint: "",
//       biometricRequiredTitle: AppLocalizations.of(context)?.translate('authentication_required'),
//       signInTitle: AppLocalizations.of(context)?.translate('authentication_required'),
//       cancelButton: AppLocalizations.of(context)?.translate('cancel'),
//       goToSettingsButton: AppLocalizations.of(context)?.translate('setting'),
//       goToSettingsDescription: AppLocalizations.of(context)?.translate('error_android_setting_biometrics_des'),
//       biometricNotRecognized: AppLocalizations.of(context)?.translate('error_android_biometrics_not_recognized'),
//       biometricSuccess: AppLocalizations.of(context)?.translate('success'),
//       deviceCredentialsRequiredTitle:
//           AppLocalizations.of(context)?.translate('error_android_required_biometrics_title'),
//       deviceCredentialsSetupDescription:
//           AppLocalizations.of(context)?.translate('error_android_required_biometrics_des'),
//     );
//     biometrics = LocalAuthApi(
//         iosStrings, androidStrings, AppLocalizations.of(context)!.translate('please_verify_biometrics_msg'));
//     return Scaffold(
//       backgroundColor: Theme.of(context).cardColor,
//       appBar: _buildAppBar(),
//       body: BlocProvider<AppBloc>(
//         create: (BuildContext context) => _appBloc..init(),
//         child: BlocBuilder<AppBloc, AppState>(
//           bloc: _appBloc,
//           builder: (BuildContext context, AppState state) => SingleChildScrollView(
//             child: Column(
//               children: [
//                 _buildField(SettingType.LANGUAGE, _appBloc.language.contains('vi') || _appBloc.language.isEmpty),
//                 _buildField(SettingType.THEME, _appBloc.theme),
//                 _buildField(SettingType.BIOMETRIC, _appBloc.isBiometric)
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   PreferredSize _buildAppBar() {
//     return AppBarCustom(context,
//         leading: const BackButton(), title: AppLocalizations.of(context)!.translate("setting").toUpperCase());
//   }
//
//   Widget _buildField(SettingType settingType, bool value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//       child: Row(
//         children: [
//           Expanded(child: Text(_getTitle(settingType, value))),
//           CupertinoSwitch(
//             value: value,
//             onChanged: (bool value) {
//               switch (settingType) {
//                 case SettingType.LANGUAGE:
//                   context.read<AppBloc>().changeLanguage(value ? 'vi' : 'en');
//                   break;
//                 case SettingType.THEME:
//                   context.read<AppBloc>().changeTheme(value);
//                   break;
//                 default:
//                   _changeBiometric(value);
//                   break;
//               }
//             },
//           )
//         ],
//       ),
//     );
//   }
//
//   String _getTitle(SettingType settingType, bool value) {
//     switch (settingType) {
//       case SettingType.BIOMETRIC:
//         return AppLocalizations.of(context)!.translate('login_with_biometric');
//       case SettingType.THEME:
//         return AppLocalizations.of(context)!.translate(value ? 'light' : 'dark');
//       default:
//         return AppLocalizations.of(context)!.translate(value ? 'vietnamese' : 'english');
//     }
//   }
//
//   Future<bool> _changeBiometric(bool isBiometric) async {
//     bool temp = true;
//     if (await biometrics!.isBiometricAvailable()) {
//       await biometrics!.getListOfBiometricTypes();
//       await biometrics!.authenticateUser(
//           onHandler: () => context.read<AppBloc>().changeIsBiometric(isBiometric),
//           onError: () {
//             DialogUtil.alert<void>(context, 'Quý khách vui lòng bật tính năng sinh trắc học trên thiết bị để sử dụng');
//             temp = false;
//           });
//     }
//     return temp;
//   }
// }
