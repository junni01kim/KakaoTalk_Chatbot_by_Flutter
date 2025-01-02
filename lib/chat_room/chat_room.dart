import 'package:flutter/material.dart';
import 'package:kakaotalk_chatbot_by_flutter/res/theme_color.dart';

import 'chat_room_app_bar.dart';
import 'chat_room_body.dart';

/// 사용자 채팅방 최상위 컴포넌트이다.
/// [ChatRoom]은 `AppBar`와 `Body`로 구분된다.
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