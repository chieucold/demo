import 'package:common/components/news/vn/vn_list_news/bloc/vn_list_news_bloc.dart';
import 'package:common/components/news/vn/vn_list_other_news/widgets/vn_list_other_news_widget.dart';
import 'package:core/common/constants/block_settings.dart';
import 'package:core/components/appbar/app_bar_default.dart';
import 'package:core/components/common_leading_widget.dart';
import 'package:core/language/app_localizations.dart';
import 'package:core/shared_preferences/local_storage_manager.dart';
import 'package:flutter/material.dart';

class VNListOtherNewsScreen extends StatelessWidget {
  VNListOtherNewsScreen({Key? key}) : super(key: key);
  final int _blockId = LocalStoreManager.getInt(BlockSettings.blockKey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(
        context,
        AppLocalizations.of(context)!.translate("other_news"),
        leading: CommonLeadingWidget(),
        colorAppbar: listBlockWithVitan.firstWhere((BlockModel e) => e.id == _blockId).backgroundColor,
      ),
      body: VNListOtherNewsWidget(blockId: _blockId),
    );
  }
}
