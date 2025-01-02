import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'chat.dart';
import 'chat_board.dart';

class ChatRoomBody extends StatefulWidget {
  @override
  State<ChatRoomBody> createState() => _ChatRoomBody();
}

class _ChatRoomBody extends State<ChatRoomBody> {
  final List<Chat> chats = [];
  final textFieldController = TextEditingController();
  bool _isChecked = false;

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
        Row(
          children: [
            CupertinoSwitch(
              value: _isChecked,
              onChanged: (value) {
                setState(() {
                  _isChecked = value;
                });
              },
            ),
            Expanded(
              child: TextField( controller: textFieldController,)
            ),
            IconButton(
                icon: Icon(Icons.send),
                onPressed: (){
                  setState(() {
                    !_isChecked
                        ? chats.add(Chat(User.ME, textFieldController.text))
                        : chats.add(Chat(User.YOU, textFieldController.text));
                    textFieldController.text = "";
                  });
                },
            )
          ],
        )
      ],
    );
  }

  @override
  void dispose() {
    textFieldController.dispose();
    super.dispose();
  }
}