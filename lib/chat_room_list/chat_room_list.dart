import 'package:flutter/material.dart';

import 'chat_room_list_body.dart';
import 'chat_room_list_app_bar.dart';

/**
 * 채팅방 정보를 볼 수 있는 클래스이다.
 *
 * 채팅방 생성과 입장을 할 수 있다.
 */
class ChatRoomList extends StatefulWidget {
  @override
  State<ChatRoomList> createState() => _ChatRoomListState();
}

class _ChatRoomListState extends State<ChatRoomList> {
  List<String> chatRoomNames = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold( // 상단 제목
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: ChatRoomListAppBar(
          onAddRoom: (String newRoomName) {
            setState(() {
              chatRoomNames.add(newRoomName);
            });
          }),
      ),

      body: ChatRoomListBody(chatRoomNames: chatRoomNames,)
    );
  }
}