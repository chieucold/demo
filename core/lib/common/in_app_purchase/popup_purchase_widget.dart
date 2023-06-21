import 'dart:io';
import 'package:api/common/model/app_settings/app_settings_entity.dart';
import 'package:core/common/bloc/bloc_index.dart';
import 'package:core/common/color/core_color.dart';
import 'package:core/common/constants/block_settings.dart';
import 'package:core/common/constants/const/enum.dart';
import 'package:core/common/enums/comment_type_enum.dart';
import 'package:core/common/text_style.dart';
import 'package:core/components/bnd_gesture_detector.dart';
import 'package:core/components/bnd_safearea.dart';
import 'package:core/components/button/primary_button_widget.dart';
import 'package:core/components/payment/payment_cart/views/payment_screen.dart';
import 'package:core/language/app_localizations.dart';
import 'package:core/shared_preferences/local_storage_manager.dart';
import 'package:flutter/material.dart';

class PaymentPurchasePage extends StatefulWidget {
  final CommentTypeEnum objectTypeEnum;
  final int objectId;
  final Function? onPaymentResult;

  const PaymentPurchasePage({Key? key, required this.objectTypeEnum, this.objectId = 0, this.onPaymentResult})
      : super(key: key);

  @override
  State<PaymentPurchasePage> createState() => _PaymentPurchasePageState();
}

class _PaymentPurchasePageState extends State<PaymentPurchasePage> {
  final int _blockId = LocalStoreManager.getInt(BlockSettings.blockKey);

  late Color _primaryColor;

  @override
  void initState() {
    super.initState();
    _primaryColor = listBlockWithVitan.firstWhere((BlockModel e) => e.id == _blockId).backgroundColor;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: BndGestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: double.infinity,
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(color: kTextWhiteColor, borderRadius: BorderRadius.all(Radius.circular(8.0))),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Stack(
                  children: <Widget>[
                    Center(
                        child: Text(
                      AppLocalizations.of(context)!.translate('payment'),
                      style: textStyleBodyLargeBold,
                    )),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: BndGestureDetector(onTap: () => Navigator.pop(context), child: const Icon(Icons.close)),
                      ),
                    )
                  ],
                ),
              ),
              const Divider(),
              _buildField(
                  title: AppLocalizations.of(context)!.translate('payment_with_vitanedu'),
                  onTap: () async {
                    Navigator.of(context).pop(PaymentType.web);
                    await buyNow(context, widget.objectId, widget.objectTypeEnum,
                        isShowPurchaseApp: false, onPaymentResult: widget.onPaymentResult);
                  }),
              const Divider(),
              BndSafeAreaWidget(
                child: _buildField(
                    title: AppLocalizations.of(context)!.translate('payment_in_application'),
                    onTap: () async {
                      Navigator.of(context).pop(PaymentType.apple);
                    }),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildField({
    String title = '',
    required Function onTap,
  }) {
    return Padding(
      padding: CoreColor.paddingBodyDefault,
      child: Row(
        children: <Widget>[
          Text(title, style: textStyleBodyDefault.copyWith(color: kTextColor)),
          const Spacer(),
          PrimaryButtonWidget(
            isGradient: false,
            backgroundColor: _primaryColor,
            iconSize: 0,
            onPressed: () async {
              await onTap();
            },
            title: AppLocalizations.of(context)!.translate('choose'),
          )
        ],
      ),
    );
  }
}
