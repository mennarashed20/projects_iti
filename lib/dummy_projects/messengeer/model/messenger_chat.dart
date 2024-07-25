class MessangerChatModel {
  String? image;
  String? name;
  String? message;
  Status? status;


  MessangerChatModel.fromJson(Map json) {
    image = json["image"];
    name = json["name"];
    message = json["message"];
    status = _stringToChatStatus(json['status']);
    }
  }


enum Status { read, received, online }

Status? _stringToChatStatus(String? status) {
  switch (status) {
    case 'read':
      return Status.read;
    case 'received':
      return Status.received;
    case 'online':
      return Status.online;
    default:
      return null;
  }
}



/*
enum Status {
  Read,
  Received,
  ReadAndReceived,
}*/