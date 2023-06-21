import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'my_group_model.g.dart';

@JsonSerializable()
class MyGroupModel {
  MyGroupModel({
    required this.totalGroup,
    required this.totalGroupManager,
    this.data = const <MyGroup>[],
  });

  int totalGroup;
  int totalGroupManager;

  @JsonKey(defaultValue: <MyGroup>[])
  List<MyGroup> data;

  factory MyGroupModel.fromJson(Map<String, dynamic> json) =>
      _$MyGroupModelFromJson(json);

  Map<String, dynamic> toJson() => _$MyGroupModelToJson(this);
}

@JsonSerializable()
class MyGroup extends Equatable {
  MyGroup({
    this.examNeedMark = 0,
    this.examNeedWork = 0,
    this.examComplete = 0,
    this.id = 0,
    this.createdBy,
    this.isManager = false,
    this.createdDate,
    this.name = '',
    this.description = '',
    this.avatar = '',
    this.coverImage = '',
    this.parentId,
    this.status,
    this.type,
    this.organizationId,
    this.blockIds,
    this.categoryId,
    this.totalGroupExamAssigned = 0,
  });

  @JsonKey(defaultValue: 0)
  int examNeedMark;

  @JsonKey(defaultValue: 0)
  int examNeedWork;

  @JsonKey(defaultValue: 0)
  int examComplete;

  @JsonKey(defaultValue: 0)
  int id;

  int? createdBy;

  @JsonKey(defaultValue: false)
  bool isManager;

  DateTime? createdDate;

  @JsonKey(defaultValue: '')
  String name;

  @JsonKey(defaultValue: '')
  String description;

  @JsonKey(defaultValue: '')
  String avatar;

  @JsonKey(defaultValue: '')
  String coverImage;

  @JsonKey(defaultValue: 0)
  int? parentId;

  @JsonKey(defaultValue: 0)
  int? status;

  @JsonKey(defaultValue: 0)
  int? type;

  @JsonKey(defaultValue: 0)
  int? organizationId;

  List<int>? blockIds;

  @JsonKey(defaultValue: 0)
  int? categoryId;

  @JsonKey(defaultValue: 0)
  int totalGroupExamAssigned;

  factory MyGroup.fromJson(Map<String, dynamic> json) =>
      _$MyGroupFromJson(json);

  Map<String, dynamic> toJson() => _$MyGroupToJson(this);

  @override
  List<Object?> get props => <Object?>[id];
}
