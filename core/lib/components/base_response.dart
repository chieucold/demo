import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:core/common/utils/model_util.dart';
import 'package:dio/dio.dart';

class BaseResponseModel {
  int? statusCode;
  String? message;
  String? status;
  dynamic data;
  dynamic results;
  String? error;

  BaseResponseModel({
    this.statusCode,
    this.message,
    this.status,
    this.data,
    this.results,
    this.error,
  });

  bool hasData() {
    return data != null;
  }

  factory BaseResponseModel.fromJson(String str) =>
      BaseResponseModel.fromMap(json.decode(str));

  // String toJson() => json.encode(toMap());

  factory BaseResponseModel.fromMap(Map<String, dynamic> json) =>
      BaseResponseModel(
        statusCode: json["statusCode"],
        message: json["message"],
        status: json["status"],
        data: json["data"],
        results: json["results"],
      );

  factory BaseResponseModel.fromMapError(DioError? json) {
    if (json?.response != null) {
       // final data = json?.response.?data;
      int? statusCode = json?.response?.statusCode;
      String? message = json?.response?.statusMessage;

      if (json?.response!.data != null && json?.response!.data is Map) {
        // final code = data['code'];
        // final dataMessage = data['message'];
        if (json?.response!.data['code'] != null) {
          statusCode = toInt(json?.response!.data['code']);
        }
        if (json?.response!.data['message'] != null && json?.response?.data['message'].toString().isNotEmpty == true) {
          message = json?.response!.data['message'];
        }
      }
      return BaseResponseModel(
        statusCode: statusCode,
        message: message,
        data: json?.response!.data,
        error: json?.error,
      );
    } else if (json?.error != null && json?.error is Map) {
      return BaseResponseModel(
        statusCode: json?.error['code'],
        message: json?.error['message'],
        data: json?.error['data'],
        error: json?.error['message'],
      );
    }
    return BaseResponseModel(
      statusCode: -1,
      message: json?.error?.toString() ??
          'Dịch vụ không thể thực hiện được lúc này, quý khách vui lòng quay lại sau',
      data: json?.response,
      error: json?.error?.toString(),
    );
  }

  BaseResponseModel copyWith({
    int? statusCode,
    String? message,
    String? status,
    dynamic data,
    dynamic results,
    String? error,
  }) {
    return new BaseResponseModel(
      statusCode: statusCode ?? this.statusCode,
      message: message ?? this.message,
      status: status ?? this.status,
      data: data ?? this.data,
      results: results ?? this.results,
      error: error ?? this.error,
    );
  }

  // factory BaseResponseModel.fromMapError(DioError json) => BaseResponseModel(
  //     statusCode: json.response.statusCode,
  //     message: json.response.statusMessage,
  //     data: json.response.data,
  //     error: json.error);

  // Map<String, dynamic> toMap() => {
  //       "statusCode": statusCode,
  //       "message": message,
  //       "status": status,
  //       "data": data,
  //       //"error": error == null ? null : List<dynamic>.from(error.map((x) => x)),
  //     };

  @override
  String toString() {
    return message??"";
  }

  bool get isSuccess => status == Status.SUCCESS;

  factory BaseResponseModel.fromError(String errorMessage) => BaseResponseModel(
      status: Status.ERROR, message: errorMessage);
}

class ErrorCode {
  static final String ALREADY_EXISTS = "ALREADY_EXISTS";
}

class ErrorCodeLocal {
  static final int ERROR_NETWORK = 0;
  static final int ERROR_FORMAT = 1;
}

class Status {
  static const String SUCCESS = "success";
  static const String ERROR = "error";
}

class ProfileStatusCode {
  static const int OK = 2000000;
  static const int CREATED = 2010000;
  static const int NO_CONTENT = 2040000;
  static const int UNAUTHORIZED = 4010000;
  static const int LOGIN_FAILED = 4010001;
  static const int INVALID_TOKEN = 4010002;
  static const int NOT_FOUND = 4040000;
  static const int USER_NAME_OR_PASSWORD_NOT_CORRECT = 4040001;
  static const int REGISTER_DEVICE_FIRST_TIME_OTP_INCORRECT = 4040002;
  static const int USER_IDENTITY_NOT_FOUND = 4040003;
  static const int FORGOT_PASSWORD_SESSION_NOT_FOUND = 4040004;
  static const int CONFLICT = 4090000;
  static const int BAD_REQUEST = 4000000;
  static const int INVALID_OTP = 4000001;
  static const int RECOVERY_IDENTITY_NOT_SUPPORT = 4000002;
  static const int FORBIDDEN = 4030000;
  static const int YOUR_ACCOUNT_IS_LOCKED = 4030001;
  static const int DEVICE_HAS_NOT_BEEN_REGISTERED = 4030002;
  static const int YOUR_OPERATION_FAILED = 4030003;
  static const int FORGOT_PASSWORD_VERIFY_OTP_FAILED = 4030004;
  static const int LOCKED = 4230000;
  static const int OTP_IS_LOCKED = 4230001;
  static const int OTP_UNUSABLE = 4230002;
  static const int LOCKED_LOGIN_FAILURE = 4230003;
  static const int LOCKED_FORGOT_PASSWORD_FAILURE = 4230004;
  static const int CANNOT_CALL_TO_ANOTHER_SERVICE = 5000001;
  static const int INVALIDATE_PRIVATE_KEY = 5000002;
  static const int LOGOUT_CHANCE_PASS_PROFILE = 4230005;
}
