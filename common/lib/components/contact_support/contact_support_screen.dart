import 'package:core/common/app_settings/app_settings.dart';
import 'package:core/common/constants/block_settings.dart';
import 'package:core/common/constants/const/const_index.dart';
import 'package:core/components/appbar/app_bar_default.dart';
import 'package:core/components/bnd_webview.dart';
import 'package:core/components/common_leading_widget.dart';
import 'package:core/components/loading_widget/loading_widget.dart';
import 'package:core/language/app_localizations.dart';
import 'package:core/shared_preferences/local_storage_manager.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ContactSupportScreen extends StatelessWidget {
  ContactSupportScreen({Key? key}) : super(key: key);
  final int _blockId = LocalStoreManager.getInt(BlockSettings.blockKey);
  final AppSettings appSettings = GetIt.I<AppSettings>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(
        context,
        AppLocalizations.of(context)!.translate("contact_support"),
        leading: CommonLeadingWidget(),
        colorAppbar: listBlockWithVitan.firstWhere((BlockModel e) => e.id == _blockId).backgroundColor,
      ),
      body: BNDWebView(
        path: appSettings.configs.contactHelp,
        loadingWidget: _buildLoading(),
      ),
    );
  }

  Widget _buildLoading() {
    return Scaffold(body: LoadingWidget(LoadingEnum.list));
  }
}
