import 'package:common/components/news/vn/vn_list_news/views/widgets/vn_list_news_widget.dart';
import 'package:core/common/constants/block_settings.dart';
import 'package:core/components/common_leading_widget.dart';
import 'package:core/language/app_localizations.dart';

import 'package:core/components/appbar/app_bar_default.dart';
import 'package:core/shared_preferences/local_storage_manager.dart';
import 'package:flutter/material.dart';

class VNListNewsScreen extends StatelessWidget {

  VNListNewsScreen({Key? key}) : super(key: key);
  final int _blockId = LocalStoreManager.getInt(BlockSettings.blockKey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(
        context,
        AppLocalizations.of(context)!.translate("news_title"),
        leading: CommonLeadingWidget(),
        colorAppbar: listBlockWithVitan.firstWhere((BlockModel e) => e.id == _blockId).backgroundColor,
      ),
      body: const VNListNewsWidget(),
    );
  }
}
