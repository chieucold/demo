import 'package:json_annotation/json_annotation.dart';

part 'role_model.g.dart';

@JsonSerializable()
class RoleModel {
  int id;
  String title;
  List<String> descriptions;
  String icon;

  RoleModel(
      {required this.id,
        required this.title,
        required this.descriptions,
        required this.icon});

  factory RoleModel.fromJson(Map<String, dynamic> json) =>
      _$RoleModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoleModelToJson(this);
}
