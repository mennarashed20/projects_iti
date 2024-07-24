import 'package:flutter/material.dart';

import '../../constant.dart';
import '../models/chat_model.dart';



class Whatsapp extends StatelessWidget {
  const Whatsapp({super.key});

  @override
  Widget build(BuildContext context) {
    final  List<ChatModel1> chatList = jsonList.map((e) => ChatModel1.fromJson(e)).toList();
    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _specificChat(
              icon: Icons.lock,
              text: "Locked Chats",
            ),
            const SizedBox(
              height: 10,
            ),
            _specificChat(
              icon: Icons.archive,
              text: "Archive Chats",
              isCountVisable: true,
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.separated(
              shrinkWrap: true,
              itemCount: chatList.length,
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey.withOpacity(.2),
              ),
              itemBuilder: (context, index) => _buildChatItem(
                name: chatList[index].name!,
                message: chatList[index].message!,
                image: chatList[index].image!,
                time: chatList[index].time!,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {},
        child: const Icon(
          Icons.messenger,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildChatItem({
    required String name,
    required String message,
    required String image,
    required String time,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(
            image,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                message,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        const Spacer(),
        Text(
          time,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _specificChat({
    required IconData icon,
    required String text,
    bool isCountVisable = false,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.green,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(text),
        const Spacer(),
        if (isCountVisable) const Text("1")
      ],
    );
  }
}

Widget _buildMyActionsItem(
    IconData? icon,
    ) {
  return Row(
    children: [
      Icon(
        icon,
        color: Colors.white,
      ),
      const SizedBox(
        width: 10,
      ),
    ],
  );
}

AppBar _appBar() {
  return AppBar(
    elevation: 5,
    backgroundColor: Colors.green,
    title: const Text(
      "WhatsApp",
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    actions: [
      _buildMyActionsItem(Icons.camera_alt_outlined),
      _buildMyActionsItem(Icons.search),
      _buildMyActionsItem(Icons.more_vert),
    ],
  );
}

List<Map> jsonList = [
  {


    "name": "mai",
    "message": "Hi..",
    "image": imageList[0],
    "time": "6 AM",

  },
  {

    "name": "olaa",
    "message": "Hello From",
    "image": imageList[1],
    "time": "9 AM",

  },
  {

    "name": "farida",
    "message": "Hello ",
    "image": imageList[2],
    "time": "5 pm",

  },
  {

    "name": "Menna",
    "message": "Hello From",
    "image": imageList[3],
    "createdAt": "4.30 pm",

  }
];