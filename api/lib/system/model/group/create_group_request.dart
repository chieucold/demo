import 'package:json_annotation/json_annotation.dart';

part 'create_group_request.g.dart';

@JsonSerializable()
class CreateGroupRequest {
  CreateGroupRequest({
    required this.name,
    this.id = 0,
    this.description = "",
    this.avatar,
    this.coverImage = "",
    this.parentId = 0,
    this.status = 0,
    this.type = 0,
    this.organizationId = 0,
    this.blockIds = const <int>[],
    this.categoryId = 0,
    this.userIds = const <int>[],
    this.createBy = 0,
    this.lastModifiedBy = 0,
  });

  int id;
  String name;
  String description;
  String? avatar;
  String coverImage;
  int parentId;
  int status;
  int type;
  int organizationId;
  List<int> blockIds;
  int categoryId;
  List<int> userIds;
  int createBy;
  int lastModifiedBy;

  factory CreateGroupRequest.fromJson(Map<String, dynamic> json) => _$CreateGroupRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateGroupRequestToJson(this);
}

