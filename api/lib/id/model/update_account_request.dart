// To parse this JSON data, do
//
//     final updateAccountRequest = updateAccountRequestFromJson(jsonString);

import 'dart:convert';

UpdateAccountRequest updateAccountRequestFromJson(String str) => UpdateAccountRequest.fromJson(json.decode(str));

String updateAccountRequestToJson(UpdateAccountRequest data) => json.encode(data.toJson());

class UpdateAccountRequest {
  UpdateAccountRequest(
      {this.username = '',
      this.firstName = '',
      this.lastName = '',
      this.birthdate,
      this.gender = 0,
      this.email = '',
      this.fullName = '',
      this.password = '',
      this.rePassword = '',
      this.id = 0,
      this.address = ''});

  String username;
  String firstName;
  String lastName;
  DateTime? birthdate;
  int gender;
  String email;
  String fullName;
  String address;
  String password;
  String rePassword;
  int id;

  factory UpdateAccountRequest.fromJson(Map<String, dynamic> json) => UpdateAccountRequest(
        username: json["username"]??'',
        firstName: json["firstName"]??'',
        lastName: json["lastName"]??'',
        address: json["address"]??'',
        birthdate: json["birthdate"]!=null?DateTime.parse(json["birthdate"]):null,
        gender: json["gender"]??0,
        email: json["email"]??'',
        fullName: json["fullName"]??'',
        password: json["password"]??'',
        rePassword: json["rePassword"]??'',
        id: json["id"]??0,
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "firstName": firstName,
        "lastName": lastName,
        "birthdate": birthdate?.toUtc().toIso8601String(),
        "gender": gender,
        // "email": email,
        // "fullName": fullName,
        "password": password,
        "rePassword": rePassword,
        "id": id,
        "address": address,
      };
}
