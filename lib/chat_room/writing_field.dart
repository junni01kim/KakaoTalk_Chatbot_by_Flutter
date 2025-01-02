import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'chat.dart';

/// 전송할 채팅 내역을 작성하는 위젯이다.
///
/// [chats] 채팅방에서 작성된 채팅 내역 `ChatRoomBody`  에서 참조하는 `property`이다.
/// [addChat] 새로운 채팅을 chats에 포함시키는 함수이다. 상태 Hoisting을 이용한다.
class WritingField extends StatefulWidget {
  final List<Chat> chats;
  final Function(Chat) addChat;

  WritingField({super.key, required this.chats, required this.addChat});

  @override
  State<WritingField> createState() => _WritingField();
}

class _WritingField extends State<WritingField> {
  final textFieldController = TextEditingController();
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child:  Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 5,
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
            child: TextField(
              controller: textFieldController,
              decoration: InputDecoration(
                border: InputBorder.none, // 하단 보라색 라인 제거
                hintText: "메시지 입력",
              ),
              minLines: 1,
              maxLines: 13,
            )
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: (){
              !_isChecked && textFieldController.text != ""
                  ? widget.addChat(Chat(User.ME, textFieldController.text))
                  : widget.addChat(Chat(User.YOU, textFieldController.text));
              textFieldController.text = "";
            },
          )
        ],
      )
    );
  }

  @override
  void dispose() {
    textFieldController.dispose();
    super.dispose();
  }
}