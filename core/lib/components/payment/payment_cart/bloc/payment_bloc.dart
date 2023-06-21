import 'package:api/payment/model/exam_package/exam_package_add_cart_model.dart';
import 'package:core/components/core_component.dart';
import 'package:core/components/payment/payment_cart/bloc/payment_state.dart';
import 'package:core/usecases/payment/payment_usecases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:collection/src/iterable_extensions.dart';

class PaymentBloc extends Cubit<PaymentState> {
  PaymentBloc(this._examPackageCartUsecases) : super(PaymentInitial()) {
    init();
  }

  final PaymentUsecases _examPackageCartUsecases;

  // final ExamPackageAddCartRequest _request = ExamPackageAddCartRequest(quantity: 1);

  // Future<int> addToCart(int objectId, CommentTypeEnum objectTypeEnum) async {
  //   showLoading();

  //   final ExamPackageAddCartModel? result = await payment.addToCart(objectId, objectTypeEnum);
  //   if (result != null) showSuccessMessage("Thêm thành công ${result.title} vào giỏ hàng");
  //   hideLoading();
  //   return result?.id ?? 0;
  // }

  Future<void> init() async => getCountCart();

  Future<void> getCountCart() async {
    emit(PaymentLoading());
    final List<ExamPackageAddCartModel> count = await getExamPackageCart();
    emit(PaymentLoaded(count));
  }

  Future<List<ExamPackageAddCartModel>> getExamPackageCart() async {
    List<ExamPackageAddCartModel> _listCart = <ExamPackageAddCartModel>[];
    final Either<String, List<ExamPackageAddCartModel>> data = await _examPackageCartUsecases.getExamPackageCart();
    data.fold((String failure) => showErrorMessage(failure), (List<ExamPackageAddCartModel> data) {
      _listCart = data;
    });
    return _listCart;
  }

  void changeCountExamPackageCart(int objectId) {
    final List<ExamPackageAddCartModel> list = state.listExamPackageCart;
    final ExamPackageAddCartModel? res = list.firstWhereOrNull((ExamPackageAddCartModel e) => e.objectId == objectId);
    if (res != null) {
      res.quantity++;
    } else {
      list.add(ExamPackageAddCartModel(objectId: objectId, createdDate: DateTime.now()));
    }
    emit(PaymentLoaded(list));
  }

  // void increament() {
  //   List<ExamPackageAddCartModel> list = <ExamPackageAddCartModel>[];
  //   list.addAll(state.listExamPackageCart);
  //   list.add(ExamPackageAddCartModel(createdDate: DateTime.now()));
  //   emit(PaymentLoaded(list));
  // }
}
