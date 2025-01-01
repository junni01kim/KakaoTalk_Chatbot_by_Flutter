import 'package:flutter/material.dart';

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
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: ChatRoomAppBar(),
      ),
      body: ChatRoomBody(),
    );
  }
  
}