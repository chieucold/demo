import 'package:core/common/app_settings/app_settings.dart';
import 'package:core/common/constants/const/enum.dart';
import 'package:core/components/appbar/app_bar_supper_app.dart';
import 'package:core/components/bnd_webview.dart';
import 'package:core/components/loading_widget/loading_widget.dart';
import 'package:core/language/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class VHSVitanNetScreen extends StatefulWidget {
  const VHSVitanNetScreen({Key? key}) : super(key: key);

  @override
  State<VHSVitanNetScreen> createState() => _VHSVitanNetScreenState();
}

class _VHSVitanNetScreenState extends State<VHSVitanNetScreen> with AutomaticKeepAliveClientMixin {
  final String _path = GetIt.I<AppSettings>().getAppSettings.configs.urlVitanNetWebview;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBarSupperApp(
        title: AppLocalizations.of(context)!.translate("CareerSocialNetwork"),
      ),
      body: BNDWebView(
        path: _path,
        // classHide: ['d-none-topbar'],
        codeJavascriptAdd: """
              document.getElementsByClassName('wrap')[0].classList.add('d-none-topbar')
              """,
        loadingWidget: _buildLoading(),
      ),
    );
  }

  Widget _buildLoading() {
    return Scaffold(
      body: LoadingWidget(
        LoadingEnum.blockList,
        itemCount: 10,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
