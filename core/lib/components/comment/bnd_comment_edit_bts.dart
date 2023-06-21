import 'package:core/assets/images/images.dart';
import 'package:core/common/color/core_color.dart';
import 'package:core/common/constants/block_settings.dart';
import 'package:core/components/bnd_icon_svg_button.dart';
import 'package:core/components/bnd_touch.dart';
import 'package:core/components/orientation/orientation_widget.dart';
import 'package:core/language/app_localizations.dart';
import 'package:core/common/text_style.dart';
import 'package:core/shared_preferences/local_storage_manager.dart';
import 'package:flutter/material.dart';

class BNDCommentEditBTS extends StatefulWidget {
  final String text;
  BNDCommentEditBTS({Key? key, required this.text}) : super(key: key);

  @override
  State<BNDCommentEditBTS> createState() => _BNDCommentEditBTSState();
}

class _BNDCommentEditBTSState extends State<BNDCommentEditBTS> {
  late TextEditingController _textEditingController;

  final int _blockId = LocalStoreManager.getInt(BlockSettings.blockKey);

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: widget.text);
  }

  @override
  Widget build(BuildContext context) {
    return OrientationWidget(
      child: Container(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 32),
                    child: Text(
                      AppLocalizations.of(context)!.translate("edit_comment"),
                      style: textStyleBodyMediumBold.copyWith(
                        color: CoreColor.textColor,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 24,
                    top: 16,
                    child: BNDIconSvgButton(
                      colorIcon: CoreColor.textColor,
                      icon: Images.icClose,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // height: 22,
              margin: CoreColor.paddingBodyDefault,
              padding: const EdgeInsets.only(top: 16),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: CoreColor.borderLineCommentColor),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextFormField(
                controller: _textEditingController,
                maxLines: 6,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 15, right: 15),
                    hintText: ""),
              ),
            ),
            BndTouch(
              onPressed: _onConfirmEdit,
              child: Container(
                width: double.infinity,
                margin: CoreColor.paddingBodyDefault.copyWith(top: 16, bottom: 12),
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45),
                    gradient: listBlockWithVitan.firstWhere((BlockModel e) => e.id == _blockId).gradient),
                child: Text(
                  AppLocalizations.of(context)!.translate("update").toUpperCase(),
                  style: textStyleBodyDefaultBold.copyWith(color: CoreColor.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onConfirmEdit() async {
    Navigator.pop(context, _textEditingController.text);
  }
}
