import 'package:api/payment/model/exam_package/exam_package_add_cart_model.dart';

abstract class PaymentState {
  final List<ExamPackageAddCartModel> listExamPackageCart;
  PaymentState(this.listExamPackageCart);
}

class PaymentInitial extends PaymentState {
  PaymentInitial() : super(<ExamPackageAddCartModel>[]);
}

class PaymentLoading  extends PaymentState {
  PaymentLoading() : super(<ExamPackageAddCartModel>[]);
}

class PaymentLoaded extends PaymentState {
  PaymentLoaded(List<ExamPackageAddCartModel> list) : super(list);
}

class PaymentError extends PaymentState {
  PaymentError({required String contentError}) : super(<ExamPackageAddCartModel>[]);
}
