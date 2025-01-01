import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'chat.dart';

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
        Expanded(
          child: ListView.builder( // 리스트 뷰
            padding: const EdgeInsets.all(8),
            itemCount: widget.chats.length,
            itemBuilder: (context, index) {
              return Align(
                alignment: widget.chats[index].user == User.ME
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  padding: const EdgeInsets.symmetric(
                      vertical: 8, horizontal: 12),
                  decoration: BoxDecoration(
                    color: widget.chats[index].user == User.ME
                        ? Colors.yellow
                        : Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    widget.chats[index].message,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              );
            },
          ),
        ),

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