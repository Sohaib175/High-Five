enum MessageStatus {
  notSent,
  notRecieverd,
  notSceen,
  sceen,
}

class InboxModel {
  String name;
  String image;
  String lastText;
  int unreadText;
  DateTime time;
  MessageStatus messageStatus;
  InboxModel({
    required this.image,
    required this.name,
    required this.lastText,
    required this.unreadText,
    required this.time,
    required this.messageStatus,
  });
}