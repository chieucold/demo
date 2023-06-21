import 'package:api/payment/model/exam_package/exam_package_add_cart_model.dart';
import 'package:core/common/log/bnd_log.dart';
import 'package:core/repositories/payment/payment_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:api/api/payment_auto_api.dart';
class PaymentUsecases {
  final PaymentRepository _paymentRepository;
  final BNDLog _log;

  PaymentUsecases(this._paymentRepository, this._log);

  Future<Either<String, ExamPackageAddCartModel>> addItemToCart(ExamPackageAddCartRequest param) async {
    try {
      final ExamPackageAddCartModel data = await _paymentRepository.addExamPackageToCart(param);
      return Right<String, ExamPackageAddCartModel>(data);
    } catch (ex) {
      _log.logError(ex.toString());
      return Left<String, ExamPackageAddCartModel>(ex.toString());
    }
  }

  Future<Either<String, List<ExamPackageAddCartModel>>> getExamPackageCart() async {
    try {
      final List<ExamPackageAddCartModel> data = await _paymentRepository.getExamPackageCart();
      return Right<String, List<ExamPackageAddCartModel>>(data);
    } catch (ex) {
      _log.logError(ex.toString());
      return Left<String, List<ExamPackageAddCartModel>>(ex.toString());
    }
  }

  Future<Either<String, String>> mapAppleProduct(int objectId,int objectType) async {
    try {
      final String data = await _paymentRepository.mapAppleProduct(objectId, objectType);
      return Right<String, String>(data);
    } catch (ex) {
      _log.logError(ex.toString());
      return Left<String, String>(ex.toString());
    }
  }

  Future<Either<String, String>> verifyReceiptApple(AppleVerifiDataRequestResource request) async {
    try {
      final String data = await _paymentRepository.verifyReceiptApple(request);
      return Right<String, String>(data);
    } catch (ex) {
      _log.logError(ex.toString());
      return Left<String, String>(ex.toString());
    }
  }


}
