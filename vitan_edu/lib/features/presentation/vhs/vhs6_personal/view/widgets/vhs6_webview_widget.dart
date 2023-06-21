import 'package:api/id/api/api_url_id.dart';
import 'package:core/common/common.dart';
import 'package:core/components/bnd_webview.dart';
import 'package:core/components/core_component.dart';
import 'package:core/language/app_localizations.dart';
import 'package:core/shared_preferences/global_variable_resource.dart';
import 'package:core/shared_preferences/local_storage_manager.dart';
import 'package:flutter/material.dart';
import 'package:vitan_edu/core/common/common_module.dart';
import 'package:vitan_edu/core/common/injection.dart';
import 'package:core/components/common_leading_widget.dart';
import 'package:vitan_edu/core/theme/custom.dart';
import 'package:vitan_edu/core/widget/appbar_widget/app_bar_supper_app.dart';

class VHS6WebViewWidget extends StatelessWidget {
  VHS6WebViewWidget({
    Key? key,
    required this.typeView,
    this.classHide,
    this.loadingWidget,
    this.showAppbar = true,
    this.disableVerticalScroll = false,
    this.disableHorizontalScroll = false,
    this.codeJavascriptAdd,
  }) : super(key: key);
  final AuthenticateApp _authenticateApp = getItSuper();
  final VHS6TypeWebView typeView;
  final List<String>? classHide;
  final Widget? loadingWidget;
  final bool showAppbar;
  final bool disableVerticalScroll;
  final bool disableHorizontalScroll;
  final String? codeJavascriptAdd;

  @override
  Widget build(BuildContext context) {
    return _buildWebview(context);
  }

  Widget _buildWebview(BuildContext context) {
    return Scaffold(
        appBar: !showAppbar
            ? null
            : AppBarSupperApp(
                title: _getTitle(context),
                leading: CommonLeadingWidget(
                  iconColor: CustomTheme.vhs9BackColor,
                )),
        body: Column(
          children: [
            Expanded(
              child: BNDWebView(
                path: _getLink() + LocalStoreManager.getString(UserSettings.tokenUser),
                classHide: classHide,
                disableVerticalScroll: disableVerticalScroll,
                disableHorizontalScroll: disableHorizontalScroll,
                loadingWidget: loadingWidget,
                codeJavascriptAdd: codeJavascriptAdd ?? _getCodeJavascriptAdd,
                functionCallBacks: [
                  BNDWebviewFunctionModel("updateSuccess", (_) {
                    _authenticateApp.updateUserInfo();
                  }),
                  BNDWebviewFunctionModel("message_error", (arguments) {
                    showErrorMessage(_getMessage(arguments));
                  }),
                  BNDWebviewFunctionModel("message_success", (arguments) {
                    showSuccessMessage(_getMessage(arguments));
                  }),
                  BNDWebviewFunctionModel("message_info", (arguments) {
                    showMessage(_getMessage(arguments));
                  }),
                  BNDWebviewFunctionModel("change_avatar", (arguments) {
                    getItSuper<GlobalVariableResource>().setOpenFile(true);
                  }),
                ],
              ),
            ),
          ],
        ));
  }

  String _getMessage(List<dynamic> arguments) {
    if (arguments.length == 0) return "";

    return arguments.join(', ');
  }

  String _getTitle(BuildContext context) {
    switch (typeView) {
      case VHS6TypeWebView.info:
        return AppLocalizations.of(context)!.translate("manage_account");
      case VHS6TypeWebView.changePassword:
        return AppLocalizations.of(context)!.translate("change_password");
      case VHS6TypeWebView.register:
        return ""; //AppLocalizations.of(context)!.translate("sign_up");
      case VHS6TypeWebView.forgotPassword:
        return ""; //AppLocalizations.of(context)!.translate("forgot_password");
      default:
        return "";
    }
  }

  String _getLink() {
    switch (typeView) {
      case VHS6TypeWebView.info:
        return ApiUrlId.userInfoPage;
      case VHS6TypeWebView.changePassword:
        return ApiUrlId.userChangePasswordPage;
      case VHS6TypeWebView.register:
        return ApiUrlId.userRegister;
      case VHS6TypeWebView.forgotPassword:
        return ApiUrlId.userForgotPassword;
      default:
        return "";
    }
  }

  String get _getCodeJavascriptAdd {
    switch (typeView) {
      case VHS6TypeWebView.info:
        return 'if(document.getElementsByClassName("container").length > 0)document.getElementsByClassName("container")[0].style.marginBottom="300px"';
      case VHS6TypeWebView.changePassword:
        return '';
      case VHS6TypeWebView.register:
        return '''
              document.getElementsByClassName('inner')[0].style.width="100%";
              document.getElementsByClassName('container')[0].style.maxWidth="100%"
              document.getElementsByClassName('custom-input')[0].style.marginTop=0
              document.getElementsByClassName('container')[0].style.padding=0
              ''';
      case VHS6TypeWebView.forgotPassword:
        return 'if(document.getElementsByClassName("txt-cancel").length > 0)document.getElementsByClassName("txt-cancel")[0].hidden = true';
      default:
        return '';
    }
  }
}
