
class MessageActionResource {
  String groupId;
  String messageId;
  int actionType;

  MessageActionResource({this.groupId = '', this.messageId = '', this.actionType = 0});

  factory MessageActionResource.fromJson(Map<String, dynamic> json) {
    return MessageActionResource(
        groupId: json['groupId'] ?? '', messageId: json['messageId'] ?? '', actionType: json['actionType'] ?? 0);
  }

  Map<String, dynamic> toJson() => {'groupId': groupId, 'messageId': messageId, 'actionType': actionType};
}
