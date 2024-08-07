import 'package:flutter/material.dart';
import 'package:projects_iti/dummy_projects/messengeer/widgets/search.dart';
import 'package:projects_iti/dummy_projects/messengeer/widgets/status.dart';

import '../../../constant.dart';
import '../model/messenger_chat.dart';
import 'appbar_w.dart';

class MessangerScreen extends StatelessWidget {
  const MessangerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final chatList =
    jsonList.map((e) => MessangerChatModel.fromJson(e)).toList();
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildSearchField(),
            _buildStatusContainer(),
            const SizedBox(
              height: 20,
            ),
            ListView.builder(
              itemCount: chatList.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (c, i) => _chatItem(chatList[i]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _chatItem(
      MessangerChatModel chat,
      ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(chat.image!),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                chat.name ?? "",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                chat.message!,
                style: TextStyle(
                  color: Colors.grey,
                ),
              )
            ],
          ),
          Spacer(),
          _buildIcon(chat),
        ],
      ),
    );
  }

  Widget _buildIcon(MessangerChatModel chat) {
    if (chat.status == Status.online) {
      return Icon(
        Icons.check_circle,
        color: Colors.blue,
      );
    } else if (chat.status == Status.read) {
      return Icon(
        Icons.check_circle,
        color: Colors.grey,
      );
    } else {
      return CircleAvatar(
        radius: 8,
        backgroundColor: Colors.blue,
      );
    }
  }

  Container _buildStatusContainer() {
    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: ListView.separated(
        itemCount: imageList.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(
          width: 10,
        ),
        itemBuilder: (context, index) {
          return buildStatusItem(
            imageList[index],
          );
        },
      ),
    );
  }
}
