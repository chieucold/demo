import 'package:api/common/model/app_settings/app_settings_entity.dart';
import 'package:common/components/action_appbar/action_appbar_widget.dart';
import 'package:contest/theme/contest_theme.dart';
import 'package:contest/widget/loading/loading_main_widget.dart';
import 'package:core/common/app_settings/app_settings.dart';
import 'package:core/common/constants/block_settings.dart';
import 'package:core/common/constants/user_settings.dart';
import 'package:core/common/enums/block_enum.dart';
import 'package:core/components/appbar/app_bar_home_widget.dart';
import 'package:core/components/bnd_webview.dart';
import 'package:core/components/common_leading_widget.dart';
import 'package:core/components/user/bnd_user.dart';
import 'package:core/language/app_localizations.dart';
import 'package:core/shared_preferences/local_storage_manager.dart';
import 'package:flutter/material.dart';
import 'package:core/common/extension/string_extension.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get_it/get_it.dart';

class ContestApp extends StatefulWidget {
  final String url;
  const ContestApp({Key? key, this.url = ''}) : super(key: key);

  @override
  State<ContestApp> createState() => _ContestAppState();
}

class _ContestAppState extends State<ContestApp> {
  String get url => widget.url;
  String _title = '';
  final Configs _appsetting = GetIt.I<AppSettings>().getAppSettings.configs;
  late InAppWebViewController? _controller;

  String _getUrl() {
    if (url.isNullOrEmpty) return "";
    if (url[0] == '/') return url.substring(1, url.length);
    return url;
  }

  final String _contestHomeUrl = GetIt.I<AppSettings>().getAppSettings.configs.contestHomeUrl;

  @override
  Widget build(BuildContext context) {
    //&password=bndtechok
    String path =
        '$_contestHomeUrl${_getUrl()}?rel=bnd-app&token=${LocalStoreManager.getString(UserSettings.tokenUser)}&sub=${GetIt.I<AuthenticateApp>().getCurrentUserId()}';
    return Scaffold(
      appBar: _appBar,
      body: SafeArea(
        child: BNDWebView(
          path: path,
          //classHide: const <String>["wp-menu-page", 'bg-menu-homepage-child'],
          codeJavascriptAdd: """
              document.getElementsByClassName('wrap')[0].classList.add('d-none-topbar')
              """,
          loadingWidget: const LoadingMainWidget(),
          onNewPage: _onNewPage,
        ),
      ),
    );
  }

  PreferredSizeWidget? get _appBar {
    if (_title.isNotEmpty) {
      return AppBarHomeWidget(
        title: 'VitanContest',
        secondaryTitle:
            AppLocalizations.of(context)!.translate(listBlock.firstWhere((e) => e.id == BlockEnum.Contest.index).title),
        hasLeading: true,
        leading: CommonLeadingWidget(onPress: _controller!.goBack),
        appbarBackgroundColor: ContestTheme.primaryContestColor,
        blockEnum: BlockEnum.Contest,
        isFlip: true,
        centerTitle: true,
      );
      // return AppBarContestLearn(
      //   _title,
      //   leading: CommonLeadingWidget(onPress: _controller!.goBack),
      // );
    }
    return AppBarHomeWidget(
      title: 'VitanContest',
      secondaryTitle:
          AppLocalizations.of(context)!.translate(listBlock.firstWhere((e) => e.id == BlockEnum.Contest.index).title),
      // hasLeading: true,
      action: const ActionAppbarWidget(blockEnum: BlockEnum.Contest),
      appbarBackgroundColor: ContestTheme.primaryContestColor,
      blockEnum: BlockEnum.Contest,
      isFlip: true,
    );
  }

  Future<void> _onNewPage(Uri? uri, InAppWebViewController controller) async {
    _controller = controller;
    final String _uri = uri.toString();
    if (!_uri.startsWith(_appsetting.contestHomeUrl) && _uri != _appsetting.contestAppUrl) {
      _title = await controller.getTitle() ?? '';
    } else {
      _title = '';
    }
    setState(() {});
  }
}
