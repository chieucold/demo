import 'package:core/common/color/core_color.dart';
import 'package:core/common/constants/block_settings.dart';
import 'package:core/components/button/primary_button_widget.dart';
import 'package:core/language/app_localizations.dart';
import 'package:core/shared_preferences/local_storage_manager.dart';
import 'package:flutter/material.dart';

class VEO5BottomWidget extends StatelessWidget {
  final VoidCallback onSignUp;

  VEO5BottomWidget({Key? key, required this.onSignUp}) : super(key: key);

  final int _blockId = LocalStoreManager.getInt(BlockSettings.blockKey);
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      decoration: const BoxDecoration(border: Border(top: BorderSide(color: CoreColor.veo5BorderColor))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          PrimaryButtonWidget(
            onPressed: onSignUp,
            title: AppLocalizations.of(context)!.translate("sign_up").toUpperCase(),
            backgroundColor: listBlockWithVitan.firstWhere((BlockModel e) => e.id == _blockId).backgroundColor,
            isGradient: false,
          )
        ],
      ),
    );
  }
}
