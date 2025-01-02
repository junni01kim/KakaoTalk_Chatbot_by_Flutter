import 'package:flutter/material.dart';

import '../chat_room/chat_room.dart';

class ChatRoomListBody extends StatelessWidget {
  final List<String> chatRoomNames;

  const ChatRoomListBody({super.key, required this.chatRoomNames});

  @override
  Widget build(BuildContext context) {
    return ListView.builder( // 리스트 뷰
      padding: const EdgeInsets.all(8),
      itemCount: chatRoomNames.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChatRoom())
            );
          },
          child: Container(
            height: 150,
            margin: const EdgeInsets.symmetric(vertical: 4),
            color: index % 2 == 0 ? Colors.deepOrange : Colors.deepOrangeAccent,
            child: Center(
              child: Text(
                chatRoomNames[index],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}