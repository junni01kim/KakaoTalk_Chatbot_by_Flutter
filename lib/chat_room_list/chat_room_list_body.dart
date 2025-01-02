import 'package:flutter/material.dart';
import 'package:kakaotalk_chatbot_by_flutter/chat_room_list/chat_room_user.dart';

import '../chat_room/chat_room.dart';

class ChatRoomListBody extends StatefulWidget {
  final List<String> chatRoomNames;
  final List<bool> hoverChatRoomUser;

  const ChatRoomListBody({super.key, required this.chatRoomNames, required this.hoverChatRoomUser});

  @override
  State<ChatRoomListBody> createState() => _ChatRoomListBody();
}

class _ChatRoomListBody extends State<ChatRoomListBody> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder( // 리스트 뷰
      padding: const EdgeInsets.all(8),
      itemCount: widget.chatRoomNames.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatRoom())
            );
          },
          onHover: (value) {
            setState(() {
              widget.hoverChatRoomUser[index] = value;
            });
          },
          child: ChatRoomUser(
            userProfileName: Icons.person,
            chatRoomName: widget.chatRoomNames[index],
            hover: widget.hoverChatRoomUser[index]
          ),
        );
      },
    );
  }
}