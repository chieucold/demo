import 'package:api/payment/api/api_url_payment.dart';
import 'package:api/payment/model/exam_package/exam_package_add_cart_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'payment_api.g.dart';

@RestApi()
abstract class PaymentAPI {
  factory PaymentAPI(Dio dio, {String baseUrl}) = _PaymentAPI;

  @POST(ApiUrlPayment.addExamPackageToCart)
  Future<ExamPackageAddCartModel> addExamPackageToCart(@Body() ExamPackageAddCartRequest params);

  @GET(ApiUrlPayment.getExamPackageCart)
  Future<List<ExamPackageAddCartModel>> getExamPackageCart();
}
