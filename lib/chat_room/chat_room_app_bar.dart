import 'package:flutter/material.dart';

/// `ChatRoom`의 `AppBar`를 디자인한 위젯이다.
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