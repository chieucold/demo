import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'exam_package_add_cart_model.g.dart';

@JsonSerializable(includeIfNull: true)
class ExamPackageAddCartModel extends Equatable {
  @JsonKey(defaultValue: 0)
  int id;

  @JsonKey(defaultValue: 0)
  int objectId;

  @JsonKey(defaultValue: 0)
  int objectType;

  @JsonKey(defaultValue: 0)
  int blockId;

  @JsonKey(defaultValue: 0)
  int quantity;

  @JsonKey(defaultValue: '')
  String title;

  @JsonKey(defaultValue: 0.0)
  double price;

  @JsonKey(defaultValue: 0.0)
  double discountPrice;

  @JsonKey(defaultValue: '')
  String url;

  @JsonKey(defaultValue: '')
  String avatar;

  @JsonKey(defaultValue: false)
  bool allowMultiple;

  @JsonKey(defaultValue: 0)
  int createdBy;

  @JsonKey()
  DateTime createdDate;

  @JsonKey(defaultValue: '')
  String blockName;

  @JsonKey(defaultValue: '')
  String objectTypeName;

  @JsonKey(defaultValue: false)
  bool isPriceChange;

  ExamPackageAddCartModel({
    this.id = 0,
    this.objectId = 0,
    this.objectType = 0,
    this.blockId = 0,
    this.quantity = 0,
    this.title = '',
    this.price = 0.0,
    this.discountPrice = 0.0,
    this.url = '',
    this.avatar = '',
    this.allowMultiple = false,
    this.createdBy = 0,
    required this.createdDate,
    this.blockName = '',
    this.objectTypeName = '',
    this.isPriceChange = false,
  });

  factory ExamPackageAddCartModel.fromJson(Map<String, dynamic> json) => _$ExamPackageAddCartModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExamPackageAddCartModelToJson(this);

  @override
  List<Object?> get props => <Object?>[id, objectType, objectId];
}

@JsonSerializable()
class ExamPackageAddCartRequest {
  int? objectId;
  int? objectType;
  int? blockId;
  int? quantity;

  ExamPackageAddCartRequest({
    this.objectId,
    this.objectType,
    this.blockId,
    this.quantity,
  });

  factory ExamPackageAddCartRequest.fromJson(Map<String, dynamic> json) => _$ExamPackageAddCartRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ExamPackageAddCartRequestToJson(this);
}
