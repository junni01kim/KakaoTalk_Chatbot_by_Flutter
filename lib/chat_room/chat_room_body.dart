import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kakaotalk_chatbot_by_flutter/chat_room/writing_field.dart';

import 'chat.dart';
import 'chat_board.dart';

class ChatRoomBody extends StatefulWidget {
  @override
  State<ChatRoomBody> createState() => _ChatRoomBody();
}

class _ChatRoomBody extends State<ChatRoomBody> {
  final List<Chat> chats = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /**
         * 채팅 내역이 등장하는 공간
         */
        ChatBoard(chats: chats),

        /**
         * 채팅 작성란
         */
        WritingField(
          chats: chats,
          addChat: (value) {
            setState(() {
              chats.add(value);
            });
          },
        ),
      ],
    );
  }
}