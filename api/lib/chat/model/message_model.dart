import 'dart:convert';

import 'package:api/api/realtime_api_models.dart';
import 'package:api/chat/model/user_model.dart';
import 'package:core/common/constants/const/enum.dart';
import 'package:core/common/common.dart';
import 'package:core/components/core_component.dart';
import 'package:get_it/get_it.dart';
import 'package:json_annotation/json_annotation.dart';

class MessageFilterResult {
  MessageFilterResult({
    this.totalRows = 0,
    this.data,
  });

  int totalRows;

  List<MessageModel>? data;

  MessageFilterResult copyWith({
    int? totalRows,
    List<MessageModel>? data,
  }) =>
      MessageFilterResult(
        totalRows: totalRows ?? this.totalRows,
        data: data ?? this.data,
      );

  factory MessageFilterResult.fromJson(Map<String, dynamic> json) => MessageFilterResult(
        totalRows: json["totalRows"] ?? 0,
        data: (json['data'] as List<dynamic>?)
                ?.map((e) => MessageModel.fromJsonSocket(e as Map<String, dynamic>, false))
                .toList() ??
            [],
      );

  Map<String, dynamic> toJson() => {
        "totalRows": totalRows,
        "data": data,
      };
}

@JsonSerializable()
class MessageModel {
  String id;
  String toGroupId;
  MessageDetailModel? message;
  MessengerListContactResource? group;
  int createdBy;
  int status;
  DateTime? time;
  DateTime? createdDate;
  DateTime? lastModifiedDate;
  int? messageType;
  bool isOwner;
  UserModel? sender;

  MessageModel(
      {this.id = '',
      this.message,
      this.time,
      this.status = 0,
      this.messageType,
      this.createdDate,
      this.isOwner = true,
      this.createdBy = 0,
      this.toGroupId = '',
      this.lastModifiedDate,
      this.group,
      this.sender});

  factory MessageModel.fromJsonSocket(Map<String, dynamic> json, bool isLocal) {
    final message = json["message"];
    return MessageModel(
        id: json["id"] ?? '',
        toGroupId: json["toGroupId"] ?? '',
        sender: UserModel.fromJson(json["sender"]),
        group: MessengerListContactResource.fromJson(json['group']),
        message:
            json["message"] != null ? MessageDetailModel.fromJson(jsonDecode(json["message"]), isLocal: isLocal) : null,
        createdBy: json["createdBy"] ?? 0,
        status: json["status"] ?? MessageSendingStatus.sending.index,
        lastModifiedDate: json["lastModifiedDate"] == null ? null : DateTime.parse(json["lastModifiedDate"] ?? 0),
        time: json["time"] == null ? null : DateTime.parse(json["time"] ?? 0),
        createdDate: json["createdDate"] == null ? null : DateTime.parse(json["createdDate"] ?? 0),
        messageType: json["messageType"] ?? 0,
        isOwner:
            json["createdBy"] != null ? json["createdBy"] == GetIt.I<AuthenticateApp>().getCurrentUserId() : false);
  }

  factory MessageModel.fromJsonLocal(Map<String, dynamic> json, bool isLocal) {
    final _messageType = json["messageType"];
    final _message = json["message"];

    return MessageModel(
        id: json["id"] ?? '',
        toGroupId: json["toGroupId"] ?? '',
        sender: json["sender"] != null ? UserModel.fromJson(jsonDecode(json["sender"])) : null,
        message: _messageType != MessageTypeEnum.Text.index
            ? _message != null
                ? MessageDetailModel.fromJson(jsonDecode(_message), isLocal: isLocal)
                : null
            : MessageDetailModel(message: json["message"] ?? ''),
        lastModifiedDate: json["lastModifiedDate"] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json["lastModifiedDate"] ?? 0),
        createdBy: json["createdBy"] ?? 0,
        status: json["status"] ?? MessageSendingStatus.sending.index,
        time: json["time"] == null ? null : DateTime.fromMillisecondsSinceEpoch(json["time"] ?? 0),
        createdDate: json["createdDate"] == null ? null : DateTime.fromMillisecondsSinceEpoch(json["createdDate"] ?? 0),
        messageType: _messageType ?? 0,
        isOwner:
            json["createdBy"] != null ? json["createdBy"] == GetIt.I<AuthenticateApp>().getCurrentUserId() : false);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "message": messageType == MessageTypeEnum.Text.index ? message?.message ?? '' : jsonEncode(message),
      "createdBy": createdBy,
      "status": status,
      "time": time?.millisecondsSinceEpoch ?? null,
      "createdDate": createdDate?.millisecondsSinceEpoch ?? null,
      "lastModifiedDate": lastModifiedDate?.millisecondsSinceEpoch ?? null,
      "messageType": messageType,
      "toGroupId": toGroupId,
      "sender": sender != null ? jsonEncode(sender) : null,
    };
  }
}

class MessageDetailModel {
  String message;

  MessageDetailModel({this.message = '', this.attachment, this.location});

  List<MessageFileResource>? attachment;
  LocationResource? location;

  factory MessageDetailModel.fromJson(Map<String, dynamic> json, {bool isLocal = false}) {
    final attachment = json['attachment'];
    return MessageDetailModel(
      message: json["message"] ?? '',
      location: json['location'] != null ? LocationResource.fromJson(json['location']) : null,
      attachment: attachment != null
          ? (json['attachment'] as List<dynamic>?)
                  ?.map((e) => MessageFileResource.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              []
          : [],
    );
  }

  Map<String, dynamic> toJson() => {
        "message": message,
        "location": location,
        "attachment": attachment,
      };
}

class MessageFileResource {
  String fileName;
  String url;
  String extension;
  double size;

  MessageFileResource({this.fileName = '', this.url = '', this.size = 0, this.extension = ''});

  factory MessageFileResource.fromJson(Map<String, dynamic> json) => MessageFileResource(
        fileName: json["fileName"] ?? '',
        url: json["url"] ?? '',
        extension: json["extension"] ?? '',
        size: json["size"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "fileName": fileName,
        "extension": extension,
        "url": url,
        "size": size,
      };
}

class MessageRequest {
  int pageSize;
  int pageIndex;
  DateTime time;
  String groupId;
  bool isAfter;
  String? keyWord;

  MessageRequest(
      {this.pageSize = 0,
      this.pageIndex = 20,
      this.groupId = '',
      this.isAfter = true,
      required this.time,
      this.keyWord});
}

class MessengerResource {
  String id;
  String toGroupId;
  String message;
  int? messageType;

  MessengerResource({this.id = '', this.toGroupId = '', this.message = '', this.messageType});

  Map<String, dynamic> toJson() => {"id": id, "toGroupId": toGroupId, "message": message, "messageType": messageType};
}

class LocationResource {
  double lat;
  double lng;
  String imageUrl;

  LocationResource({this.lat = 0.0, this.lng = 0.0, this.imageUrl = ''});

  factory LocationResource.fromJson(Map<String, dynamic> json, {bool isLocal = false}) {
    return LocationResource(
      lat: json["lat"] ?? 0.0,
      lng: json["lng"] ?? 0.0,
      imageUrl: json["imageUrl"] ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
        "imageUrl": imageUrl,
      };
}
