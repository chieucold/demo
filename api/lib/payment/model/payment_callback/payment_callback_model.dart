import 'package:json_annotation/json_annotation.dart';

// @JsonSerializable(includeIfNull: true)
class PaymentCallbackModel {
  @JsonKey(defaultValue: 0)
  int amount;

  @JsonKey(defaultValue: 0)
  int orderId;

  @JsonKey(defaultValue: '')
  String paymentGatewayType;

  @JsonKey(defaultValue: '')
  String paymentMethod;

  @JsonKey(defaultValue: '')
  String bankCode;

  @JsonKey(defaultValue: '')
  String bankName;

  @JsonKey(defaultValue: 0)
  int status;

  DateTime payDate;

  @JsonKey(defaultValue: '')
  String message;

  @JsonKey(defaultValue: '')
  String error;

  PaymentCallbackModel({
    this.amount = 0,
    this.orderId = 0,
    this.paymentGatewayType = '',
    this.paymentMethod = '',
    this.bankCode = '',
    this.bankName = '',
    this.status = 1,
    required this.payDate,
    this.message = '',
    this.error = '',
  });

  factory PaymentCallbackModel.fromJson(Map<String, dynamic> json) =>
      PaymentCallbackModel(
        amount: json["amount"],
        orderId: json["orderId"],
        paymentGatewayType: json["paymentGatewayType"],
        paymentMethod: json["paymentMethod"],
        bankCode: json["bankCode"],
        bankName: json["bankName"],
        status: json["status"],
        payDate: DateTime.parse(json["payDate"]),
        message: json["message"],
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "orderId": orderId,
        "paymentGatewayType": paymentGatewayType,
        "paymentMethod": paymentMethod,
        "bankCode": bankCode,
        "bankName": bankName,
        "status": status,
        "payDate": payDate.toIso8601String(),
        "message": message,
        "error": error,
      };
}
