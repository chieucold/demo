import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(explicitToJson: true)
class MessengerListContactResourceModel {
  MessengerListContactResourceModel({
    this.groupId = '',
    this.lastMessageId = '',
    this.lastMessage = '',
    this.lastMessageTime,
    this.name = '',
    this.avatar = '',
    this.userId = 0,
    this.isGroup = false,
    this.totalMessageNotReads = 0,
    this.createdBy = 0,
  });

  Map<String, dynamic> toJson() => {
        'groupId': groupId,
        'lastMessageId': lastMessageId,
        'lastMessage': lastMessage,
        'lastMessageTime': lastMessageTime?.millisecondsSinceEpoch ?? 0,
        'name': name,
        'avatar': avatar,
        'userId': userId,
        'isGroup': isGroup ? 0 : 1,
        'totalMessageNotReads': totalMessageNotReads,
        'createdBy': createdBy,
      };

  factory MessengerListContactResourceModel.fromJson(
          Map<String, dynamic> json) =>
      MessengerListContactResourceModel(
        groupId: json['groupId'] as String? ?? '',
        lastMessageId: json['lastMessageId'] as String? ?? '',
        lastMessage: json['lastMessage'] as String? ?? '',
        lastMessageTime: json['lastMessageTime'] == null ? null : DateTime.fromMillisecondsSinceEpoch(json['lastMessageTime']),
        name: json['name'] as String? ?? '',
        avatar: json['avatar'] as String? ?? '',
        userId: json['userId'] as int? ?? 0,
        isGroup: json['isGroup'] == 0 ? true : false,
        totalMessageNotReads: json['totalMessageNotReads'] as int? ?? 0,
        createdBy: json['createdBy'] as int? ?? 0,
      );

  @JsonKey(name: 'groupId', includeIfNull: true, defaultValue: '')
  String groupId;
  @JsonKey(name: 'lastMessageId', includeIfNull: true, defaultValue: '')
  String lastMessageId;
  @JsonKey(name: 'lastMessage', includeIfNull: true, defaultValue: '')
  String lastMessage;
  @JsonKey(name: 'lastMessageTime', includeIfNull: true)
  DateTime? lastMessageTime;
  @JsonKey(name: 'name', includeIfNull: true, defaultValue: '')
  String name;
  @JsonKey(name: 'avatar', includeIfNull: true, defaultValue: '')
  String avatar;
  @JsonKey(name: 'userId', includeIfNull: true, defaultValue: 0)
  int userId;
  @JsonKey(name: 'isGroup', includeIfNull: true, defaultValue: false)
  bool isGroup;
  @JsonKey(name: 'totalMessageNotReads', includeIfNull: true, defaultValue: 0)
  int totalMessageNotReads;
  @JsonKey(name: 'createdBy', includeIfNull: true, defaultValue: 0)
  int createdBy;
}
