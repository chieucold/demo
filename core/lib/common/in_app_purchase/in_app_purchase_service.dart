import 'dart:async';
import 'package:api/api/payment_auto_api.dart';
import 'package:core/common/bloc/base_cubit.dart';
import 'package:core/common/bloc/base_state.dart';
import 'package:core/common/constants/block_settings.dart';
import 'package:core/common/core_module.dart';
import 'package:core/common/enums/comment_type_enum.dart';
import 'package:core/common/loading.dart';
import 'package:core/common/log/bnd_log.dart';
import 'package:core/components/bnd_message.dart';
import 'package:core/language/app_localizations.dart';
import 'package:core/shared_preferences/local_storage_manager.dart';
import 'package:core/usecases/payment/payment_usecases.dart';
import 'package:dartz/dartz.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_ios/in_app_purchase_ios.dart';
import 'package:in_app_purchase_ios/store_kit_wrappers.dart';

class InAppPurchaseService {
  InAppPurchaseService(this._paymentAutoApi,this._log);

  final PaymentUsecases _paymentAutoApi;
  final BNDLog _log;

  final InAppPurchase _inAppPurchase = InAppPurchase.instance;
  StreamSubscription<List<PurchaseDetails>>? _subscription;


  List<String> _listProductId = <String>[];
  Function? _waitingData;
  bool isBuy = false;
  final AppleVerifiDataRequestResource _requestResource = AppleVerifiDataRequestResource();

  void init() {
    if (_subscription != null) return;
    final Stream<List<PurchaseDetails>> purchaseUpdated = _inAppPurchase.purchaseStream;
    _subscription = purchaseUpdated.listen((List<PurchaseDetails> purchaseDetailsList) {
      _listenToPurchaseUpdated(purchaseDetailsList);
    }, onDone: () {
      //OnDone
      hideLoading();
      _subscription!.cancel();
    }, onError: (Object error) {
      // handle error here.
    });
  }

  Future<bool> buyProduct(Function? waitingData) async {
    try {
      final bool isAvailable = await _inAppPurchase.isAvailable() && _listProductId.isNotEmpty;
      if (!isAvailable) {
        showErrorMessage(AppLocalizations.of(navigatorKey!.currentState!.context)!.translate('not_found_product'));
        return false;
      }

      final InAppPurchaseIosPlatformAddition iosPlatformAddition =
          _inAppPurchase.getPlatformAddition<InAppPurchaseIosPlatformAddition>();
      await iosPlatformAddition.setDelegate(ExamplePaymentQueueDelegate());

      final ProductDetailsResponse productDetailResponse =
          await _inAppPurchase.queryProductDetails(_listProductId.toSet());
      if (productDetailResponse.error != null) {
        // case có lỗi
        hideLoading();
        _listProductId = <String>[];
        handleError(productDetailResponse.error);
        return false;
      }

      if (productDetailResponse.notFoundIDs.isNotEmpty) {
        // case không có productId nào trên appstore
        hideLoading();
        showErrorMessage(AppLocalizations.of(navigatorKey!.currentState!.context)!.translate('not_found_product'));
        return false;
      }

      final ProductDetails productDetails = productDetailResponse.productDetails.first;
      final PurchaseParam purchaseParam = PurchaseParam(productDetails: productDetails);
      await confirmPriceChange();

      final List<SKPaymentTransactionWrapper> transactions = await SKPaymentQueueWrapper().transactions();
      for (final SKPaymentTransactionWrapper skPaymentTransactionWrapper in transactions) {
        await SKPaymentQueueWrapper().finishTransaction(skPaymentTransactionWrapper);
      }

      if (purchaseParam.productDetails.id == _listProductId.first) {
        _waitingData = waitingData;
        _requestResource.amount = productDetails.rawPrice.toInt();
        return await InAppPurchase.instance.buyConsumable(purchaseParam: purchaseParam);
      } else {
        return false;
      }
    } catch (e) {
      if (e.toString().contains('storekit_duplicate_product_object')) {
        await _inAppPurchase.restorePurchases();
      }
      hideLoading();
      return false;
    }
  }

  Future<void> deliverProduct(PurchaseDetails purchaseDetails) async {
    _requestResource
      ..appleProductId = purchaseDetails.productID
      ..token = purchaseDetails.verificationData.serverVerificationData
      ..time = int.tryParse(purchaseDetails.transactionDate ?? '') ?? 0;

    showLoading();
    final bool _isSuccess = await verifyReceiptApple();
    if (_waitingData != null) _waitingData!(_isSuccess);

    hideLoading();
  }

  Future<void> disposeStore() async {
    final InAppPurchaseIosPlatformAddition iosPlatformAddition =
        _inAppPurchase.getPlatformAddition<InAppPurchaseIosPlatformAddition>();
    await iosPlatformAddition.setDelegate(null);
  }

  void handleError(IAPError? error) {
    hideLoading();
    _log.logError(error?.message??'');
    // showErrorMessage(error.message);
  }

  Future<void> _listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) async {
    for (final PurchaseDetails purchaseDetails in purchaseDetailsList) {
      if (purchaseDetails.status == PurchaseStatus.pending) {
      } else {
        if (purchaseDetails.status == PurchaseStatus.error) {
          handleError(purchaseDetails.error!);
        } else if (purchaseDetails.status == PurchaseStatus.purchased) {
          await deliverProduct(purchaseDetails);
        }
        if (purchaseDetails.pendingCompletePurchase) {
          await _inAppPurchase.completePurchase(purchaseDetails);
        }
      }
    }
  }

  Future<void> confirmPriceChange() async {
    final InAppPurchaseIosPlatformAddition iapStoreKitPlatformAddition =
        _inAppPurchase.getPlatformAddition<InAppPurchaseIosPlatformAddition>();
    await iapStoreKitPlatformAddition.showPriceConsentIfNeeded();
  }

  Future<bool> verifyReceiptApple() async {
    final Either<String, String> _productData = await _paymentAutoApi.verifyReceiptApple(_requestResource);
    return await _productData.fold((String l) => false, (String message) async {
      if (message == null || message.isEmpty) {
        showSuccessMessage(AppLocalizations.of(navigatorKey!.currentState!.context)!.translate('payment_success'));
        return true;
      } else {
        showErrorMessage(message);
        return false;
      }
    });
  }

  Future<void> initData(CommentTypeEnum objectTypeEnum, int objectId) async {
    _requestResource
      ..objectId = objectId
      ..blockId = LocalStoreManager.getInt(BlockSettings.blockKey)
      ..objectType = objectTypeEnum.index;
    await _mapAppleProduct();
  }
  Future<void> _mapAppleProduct() async {
    showLoading();
    final Either<String, String> _productData =
        await _paymentAutoApi.mapAppleProduct(_requestResource.objectId, _requestResource.objectType);
    _productData.fold((String l) => null, (String productId) {
      if (productId != null || productId.isNotEmpty) {
        _listProductId = <String>[productId];
      }else{
        // trường hợp không ra data productId
        hideLoading();
      }
    });
  }
}
class ExamplePaymentQueueDelegate implements SKPaymentQueueDelegateWrapper {
  @override
  bool shouldContinueTransaction(
      SKPaymentTransactionWrapper transaction, SKStorefrontWrapper storefront) {
    return true;
  }

  @override
  bool shouldShowPriceConsent() {
    return true;
  }
}