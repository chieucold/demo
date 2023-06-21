import 'package:json_annotation/json_annotation.dart';

part 'http_response.g.dart';

@JsonSerializable()
class BNDHttpResponse {
  String code;
  Data1 data;
  String message;
  bool success;

  BNDHttpResponse({
    required this.code,
    required this.data,
    required this.message,
    required this.success,
  });

  factory BNDHttpResponse.fromJson(Map<String, dynamic> json) =>
      _$BNDHttpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BNDHttpResponseToJson(this);
}

@JsonSerializable()
class Data1 {
  String version;
  int statusCode;
  String message;
  Result result;

  Data1({
    required this.version,
   required this.statusCode,
   required this.message,
   required this.result});
  factory Data1.fromJson(Map<String, dynamic> json) =>
      _$Data1FromJson(json);

  Map<String, dynamic> toJson() => _$Data1ToJson(this);
}

@JsonSerializable()

class Result {
  int totalRows;
  dynamic data;

  Result({required this.totalRows, required this.data});
  factory Result.fromJson(Map<String, dynamic> json) =>
      _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
