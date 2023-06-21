import 'package:json_annotation/json_annotation.dart';

class UserModel {
  int id;
  String fullName;
  String avatar;

  UserModel({this.id = 0, this.fullName = '', this.avatar = ''});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      UserModel(avatar: json['avatar'] ?? '', fullName: json['fullName'] ?? '', id: json['id'] ?? 0);

  Map<String, dynamic> toJson() => {"id": id, "fullName": fullName, "avatar": avatar};
}
