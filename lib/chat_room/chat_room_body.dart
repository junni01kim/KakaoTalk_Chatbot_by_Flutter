import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'chat.dart';
import 'chat_board.dart';

class ChatRoomBody extends StatefulWidget {
  final List<Chat> chats = [];
  final textFieldController = TextEditingController();

  bool _isChecked = false;

  @override
  State<ChatRoomBody> createState() => _ChatRoomBody();
}

class _ChatRoomBody extends State<ChatRoomBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /**
         * 채팅 내역이 등장하는 공간
         */
        ChatBoard(chats: widget.chats),

        /**
         * 채팅 작성란
         */
        Row(
          children: [
            CupertinoSwitch(
              value: widget._isChecked,
              onChanged: (bool? value) {
                setState(() {
                  widget._isChecked = value ?? false;
                });
              },
            ),
            Expanded(
              child: TextField( controller: widget.textFieldController,)
            ),
            IconButton(
                icon: Icon(Icons.send),
                onPressed: (){
                  setState(() {
                    !widget._isChecked
                        ? widget.chats.add(Chat(User.ME, widget.textFieldController.text))
                        : widget.chats.add(Chat(User.YOU, widget.textFieldController.text));
                    widget.textFieldController.text = "";
                  });
                },
            )
          ],
        )
      ],
    );
  }
}