import 'package:flutter/material.dart';

class ChatRoomAppBar extends StatelessWidget {
  const ChatRoomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("채팅방 이름"),
      ],
    );
  }
}