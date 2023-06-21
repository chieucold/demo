import 'package:api/payment/model/exam_package/exam_package_add_cart_model.dart';
import 'package:api/payment/model/payment_api.dart';
import 'package:api/api/payment_auto_api.dart';

class PaymentRepository {
  final PaymentAPI _paymentAPI;
  final PaymentAutoApi _paymentAutoApi;
  PaymentRepository(this._paymentAPI,this._paymentAutoApi);

  Future<ExamPackageAddCartModel> addExamPackageToCart(ExamPackageAddCartRequest param) async {
    final ExamPackageAddCartModel data = await _paymentAPI.addExamPackageToCart(param);
    return data;
  }

  Future<List<ExamPackageAddCartModel>> getExamPackageCart() async {
    final List<ExamPackageAddCartModel> data = await _paymentAPI.getExamPackageCart();
    return data;
  }

  Future<String> mapAppleProduct(int objectId,int objectType ) async {
    final String data = await _paymentAutoApi.appleProductMapGetAppleProductId(objectId, objectType);
    return data;
  }

  Future<String> verifyReceiptApple(AppleVerifiDataRequestResource request ) async {
    final String data = await _paymentAutoApi.paymentVerifyReceiptApple(request);
    return data;
  }
}
