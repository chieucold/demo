class RealTimeEvent {
  static const String competitionChangeRank = "CompetitionChangeRank";
  static const String competitionStart = "CompetitionStart";
  static const String competitionUserJoin = "CompetitionUserJoin";
  static const String competitionUserQuit = "CompetitionUserQuit";
  static const String competitionReciveQuestion = "sendQuestion";

  static const String eventAddGroup = "onAddGroup"; //Tạo nhóm mới
  static const String eventUpdateGroup = "onUpdateGroup"; // Cập nhật nhóm

  static const String chatSend = "Chat"; // Khi tạo tin nhắn
  static const String chatEvent = "onReciveMessage"; // Khi có tin nhắn mới
  static const String chatAction= "MessageActions"; // Đánh dấu đã đọc tin nhắn
  static const String chatEventAction = "onChatEventAction_{0}"; // Cập nhật hành động tin nhắn: Đã đọc
  static const String chatEventUpdateMessage = "onMessageUpdate"; // Thay đổi dữ liệu tin nhắn
}
