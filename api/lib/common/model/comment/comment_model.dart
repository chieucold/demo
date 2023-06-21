import 'package:core/model/paging.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comment_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CommentModel {
  int id;
  double? mark;
  int? duration;
  RateModel rate;
  UserModel user;
  CommentModel({required this.id, this.mark, this.duration, required this.rate, required this.user});
  factory CommentModel.fromJson(Map<String, dynamic> json) => _$CommentModelFromJson(json);
  Map<String, dynamic> toJson() => _$CommentModelToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: true)
class RateModel {
  @JsonKey(defaultValue: "")
  String id;

  @JsonKey(defaultValue: "")
  String objectId;

  @JsonKey(defaultValue: 0)
  int objectType;

  @JsonKey(defaultValue: 0)
  int type;

  @JsonKey(defaultValue: 0)
  int memberId;

  @JsonKey(defaultValue: 0)
  double mark;

  String? content;

  @JsonKey(defaultValue: 0)
  int status;

  @JsonKey(defaultValue: false)
  bool isIncognito;

  DateTime? createdDate;
  RateModel(
      {this.id = "",
      this.objectId = "",
      this.objectType = 0,
      this.type = 0,
      this.memberId = 0,
      this.mark = 0,
      this.content,
      this.status = 0,
      this.isIncognito = false,
      this.createdDate});

  factory RateModel.fromJson(Map<String, dynamic> json) => _$RateModelFromJson(json);

  Map<String, dynamic> toJson() => _$RateModelToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: true)
class UserModel {
  @JsonKey(defaultValue: 0)
  int id;

  @JsonKey(defaultValue: "")
  String username;
  // String giveName;
  // String familyName;

  @JsonKey(defaultValue: "")
  String? fullName;

  @JsonKey(defaultValue: "")
  String? avatar;

  @JsonKey(defaultValue: false)
  bool isVertify;

  UserModel({
    required this.id,
    this.fullName,
    this.avatar,
    // required this.familyName,
    // required this.giveName,
    required this.username,
    this.isVertify = false,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable()
class CommentRequest extends PagingRequest {
  int examId;
  CommentRequest(this.examId, int pageIndex, int pageSize) : super(pageIndex, pageSize);
  factory CommentRequest.fromJson(Map<String, dynamic> json) => _$CommentRequestFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$CommentRequestToJson(this);
}

@JsonSerializable()
class RateRequest {
  int examId;
  int? userId;
  RateRequest({required this.examId, this.userId}) : super();
  factory RateRequest.fromJson(Map<String, dynamic> json) => _$RateRequestFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$RateRequestToJson(this);
}
