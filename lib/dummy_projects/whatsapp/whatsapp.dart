import 'package:flutter/material.dart';

import '../../constant.dart';
import 'models/chat_model.dart';




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
            Expanded(
              child: ListView.separated(
                //shrinkWrap: true,
                itemCount: chatList.length,
                separatorBuilder: (context, index) => Divider(
                  color: Colors.grey.withOpacity(.2),
                ),

                itemBuilder: (context, index) => _buildChatItem(
                  name: chatList[index].name!,
                  message: chatList[index].message!,
                  image: chatList[index].image!,
                  time: chatList[index].time!,
                  count: chatList[index].count!,

                ),
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
    required String count,
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
        Column(

          children: [
            Text(
              time,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),

            CircleAvatar(
              backgroundColor: Colors.green,
              radius: 13,
              child: Text(
                count,


              ),
            )

          ],
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
