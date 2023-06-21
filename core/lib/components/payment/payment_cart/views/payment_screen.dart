import 'dart:io';
import 'package:api/payment/api/api_url_payment.dart';
import 'package:api/payment/model/exam_package/exam_package_add_cart_model.dart';
import 'package:api/common/model/app_settings/app_settings_entity.dart';
import 'package:core/common/app_settings/app_settings.dart';
import 'package:core/common/color/core_color.dart';
import 'package:core/common/common.dart';
import 'package:core/common/enums/comment_type_enum.dart';
import 'package:core/common/enums/payment_status_enum.dart';
import 'package:core/common/in_app_purchase/in_app_purchase_service.dart';
import 'package:core/common/in_app_purchase/popup_purchase_widget.dart';
import 'package:core/common/text_style.dart';
import 'package:core/components/bnd_webview.dart';
import 'package:core/components/bottom_sheet/modal_bottom_sheet.dart';
import 'package:core/components/common_leading_widget.dart';
import 'package:core/components/core_component.dart';
import 'package:core/components/payment/payment_cart/bloc/payment_bloc.dart';
import 'package:core/language/app_localizations.dart';
import 'package:core/shared_preferences/local_storage_manager.dart';
import 'package:core/usecases/payment/payment_usecases.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({Key? key, this.idCart = 0, this.onSuccess}) : super(key: key);
  final int? idCart;
  final Function? onSuccess;
  final PaymentBloc _paymentBloc = GetIt.I<PaymentBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              AppLocalizations.of(context)!.translate("payment"),
              style: textStyleBodyDefault.copyWith(color: CoreColor.textColor),
            ),
            leadingWidth: 0,
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: BndGestureDetector(
                    onTap: () {
                      _paymentBloc.getCountCart();
                      Navigator.pop(context, false);
                    },
                    child: Icon(Icons.close, color: CoreColor.textColor)),
              )
            ]),
      ),
      body: SafeArea(
        child: BNDWebView(
          path: ApiUrlPayment.goToWebviewCart + idCart.toString(),
          functionCallBacks: <BNDWebviewFunctionModel>[
            BNDWebviewFunctionModel("payment_success", (List<dynamic> args) {
              _onCallBack(
                int.parse(args[0]['status'].toString()),
                args[0]['message'].toString(),
                context,
              );
            })
          ],
        ),
      ),
    );
  }

  void _onCallBack(int status, String message, BuildContext context) {
    if (status == PaymentStatusEnum.success.index) {
      showSuccessMessage(message);
      if (onSuccess != null) onSuccess!();
      _paymentBloc.getCountCart();
      Navigator.of(context).pop(true);
    } else if (status == PaymentStatusEnum.notSuccess.index) {
      showErrorMessage(message);
    }
  }
}

Future<ExamPackageAddCartModel?> addToCart(int objectId, CommentTypeEnum objectTypeEnum, BuildContext context,
    {bool isShowSuccessMessage = true}) async {
  showLoading();
  final PaymentUsecases paymentUseCases = GetIt.I<PaymentUsecases>();
  final PaymentBloc _paymentBloc = GetIt.I<PaymentBloc>();
  final Either<String, ExamPackageAddCartModel> objReturn = await paymentUseCases.addItemToCart(
      ExamPackageAddCartRequest(
          blockId: LocalStoreManager.getInt(BlockSettings.blockKey),
          objectId: objectId,
          objectType: objectTypeEnum.index,
          quantity: 1));
  ExamPackageAddCartModel? temp;
  objReturn.fold((_) => null, (ExamPackageAddCartModel r) {
    hideLoading();
    _paymentBloc.changeCountExamPackageCart(r.objectId);
    if (isShowSuccessMessage)
      showSuccessMessage(
          AppLocalizations.of(context)!.translate("add_item_to_cart_success").replaceAll("{title}", r.title));
    temp = r;
  });
  return temp;
}

Future<bool> buyNow(BuildContext context, int objectId, CommentTypeEnum objectTypeEnum,
    {bool isShowPurchaseApp = true, Function? onPaymentResult}) async {
  bool isSuccess = false;
  if (Platform.isIOS && isShowPurchaseApp && await _checkVersionEnable()) {
    final InAppPurchaseService _inAppPurchaseService = GetIt.I<InAppPurchaseService>();
    final PaymentType _paymentEnum = await goPresent<PaymentType>(context,
            PaymentPurchasePage(objectTypeEnum: objectTypeEnum, objectId: objectId, onPaymentResult: onPaymentResult),
            isDismissible: true) ??
        PaymentType.none;
    if (_paymentEnum == PaymentType.apple) {
      _inAppPurchaseService.init();
      await _inAppPurchaseService.initData(objectTypeEnum, objectId);
      return await _inAppPurchaseService.buyProduct(onPaymentResult);
    } else {
      return false;
    }
  } else {
    final ExamPackageAddCartModel? result =
        await addToCart(objectId, objectTypeEnum, context, isShowSuccessMessage: false);
    if (result != null) {
      isSuccess = await goToPaymentCart(context, objectTypeEnum: objectTypeEnum, idCart: result.id);
      if (onPaymentResult != null) {
        onPaymentResult(isSuccess);
      }
    }
    return isSuccess;
  }
}

Future<bool> goToPaymentCart(BuildContext context, {CommentTypeEnum? objectTypeEnum, int idCart = 0}) async {
  final bool? result = await Navigator.of(context).push(
    MaterialPageRoute<bool>(
        builder: (BuildContext context) {
          return PaymentScreen(
            idCart: idCart,
          );
        },
        fullscreenDialog: true),
  );

  return result ?? false;
  // }
}

Future<bool> _checkVersionEnable() async {
  final List<String> _listVersionEnable =
      GetIt.I<AppSettings>().getAppSettings.configs.versionEnableInAppPurchase.map((AppInfo e) => e.version).toList();
  final String _currentVersion = await PackageInfo.fromPlatform().then((PackageInfo value) => value.version);
  return _listVersionEnable.firstWhere((String element) => element == _currentVersion, orElse: () => '').isNotEmpty;
}
