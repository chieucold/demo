import 'package:json_annotation/json_annotation.dart';
part 'information_group_model.g.dart';
@JsonSerializable(includeIfNull: true)
class InformationGroupModel{
  InformationGroupModel({
    required this.group,
     this.users = const <User>[],
  });
  Group group;

  @JsonKey(defaultValue: <User>[])
  List<User> users;

  factory InformationGroupModel.fromJson(Map<String, dynamic> json) => _$InformationGroupModelFromJson(json);

  Map<String, dynamic> toJson() => _$InformationGroupModelToJson(this);
}

@JsonSerializable(includeIfNull: true)
class Group{
  Group({
    required this.id,
    this.isManager = false,
    this.createdBy = 0,
    this.createdDate,
    this.name='',
    this.description='',
    this.avatar='',
    this.coverImage ="",
    this.parentId = 0,
    this.status = 0,
    this.type = 0,
    this.organizationId = 0,
    this.blockIds = const <int>[],
    this.categoryId = 0,
  });

  @JsonKey(defaultValue: 0)
  int id;

  @JsonKey(defaultValue: false)
  bool isManager;

  @JsonKey(defaultValue: 0)
  int createdBy;

  DateTime? createdDate;

  @JsonKey(defaultValue: "")
  String name;

  @JsonKey(defaultValue: "")
  String description;

  @JsonKey(defaultValue: "")
  String avatar;

  @JsonKey(defaultValue: "")
  String coverImage;

  @JsonKey(defaultValue: 0)
  int parentId;

  @JsonKey(defaultValue: 0)
  int status;

  @JsonKey(defaultValue: 0)
  int type;

  @JsonKey(defaultValue: 0)
  int organizationId;

  @JsonKey(defaultValue: <int>[])
  List<int> blockIds;

  @JsonKey(defaultValue: 0)
  int categoryId;

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);

  Map<String, dynamic> toJson() => _$GroupToJson(this);
}

@JsonSerializable(includeIfNull: true)
class User {
  User(
      {this.id=0,
      this.username = '',
      this.givenName = '',
      this.familyName = '',
      this.fullName = '',
      this.avatar = '',
      this.joinDate,
      this.address='',
      this.isManager = false,
      this.isVerify = false});

  @JsonKey(defaultValue: 0)
  int id;

  DateTime? joinDate;

  @JsonKey(defaultValue: false)
  bool isManager;

  @JsonKey(defaultValue: false)
  bool isVerify;

  @JsonKey(defaultValue: "")
  String username;

  @JsonKey(defaultValue: "")
  String givenName;

  @JsonKey(defaultValue: "")
  String familyName;

  @JsonKey(defaultValue: "")
  String address;

  @JsonKey(defaultValue: "")
  String fullName;

  @JsonKey(defaultValue: "")
  String avatar;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
