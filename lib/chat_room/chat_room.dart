import 'package:flutter/material.dart';
import 'package:kakaotalk_chatbot_by_flutter/res/theme_color.dart';

import 'chat_room_app_bar.dart';
import 'chat_room_body.dart';

class ChatRoom extends StatefulWidget {
  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.main,
      appBar: AppBar(
        foregroundColor: ThemeColor.text,
        backgroundColor: ThemeColor.main,
        title: ChatRoomAppBar(),
      ),
      body: ChatRoomBody(),
    );
  }
}