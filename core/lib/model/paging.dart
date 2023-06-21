import 'package:json_annotation/json_annotation.dart';

part 'paging.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class PagingRequest {
  int pageIndex;
  int pageSize;

  PagingRequest(this.pageIndex, this.pageSize);

  factory PagingRequest.fromJson(Map<String, dynamic> json) => _$PagingRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PagingRequestToJson(this);
}

@JsonSerializable(genericArgumentFactories: true)
class PagingResponse<T> {
  int totalRows;
  List<T> data;

  PagingResponse({required this.totalRows, required this.data});

  factory PagingResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$PagingResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) => _$PagingResponseToJson(this, toJsonT);
}
