import 'package:flutter/material.dart';

import '../res/theme_color.dart';
import 'chat_room_list_body.dart';
import 'chat_room_list_app_bar.dart';


/// 사용자 채팅방 리스트 최상위 컴포넌트이다.
///
/// 채팅방 생성과 입장을 할 수 있다.
/// [ChatRoomList]은 `AppBar`와 `Body`로 구분된다.
class ChatRoomList extends StatefulWidget {
  @override
  State<ChatRoomList> createState() => _ChatRoomListState();
}

class _ChatRoomListState extends State<ChatRoomList> {
  List<String> chatRoomNames = [];
  List<bool> hoverChatRoomUser = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold( // 상단 제목
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: ThemeColor.background,
        title: ChatRoomListAppBar(
          onAddRoom: (String newRoomName) {
            setState(() {
              chatRoomNames.add(newRoomName);
              hoverChatRoomUser.add(false);
            });
          }),
      ),

      body: ChatRoomListBody(
        chatRoomNames: chatRoomNames,
        hoverChatRoomUser: hoverChatRoomUser,
      )
    );
  }
}