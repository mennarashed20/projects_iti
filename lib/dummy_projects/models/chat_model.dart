
class ChatModel1 {

  String? image;
  String? name;
  String? message;
  String? time;

  ChatModel1.fromJson(Map json) {
    name = json["name"];
    image = json["image"];
    message = json["message"];
   time = json["time"];
  }
}
