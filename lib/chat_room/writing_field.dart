import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'chat.dart';

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
    return Row(
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
            !_isChecked
                ? widget.addChat(Chat(User.ME, textFieldController.text))
                : widget.addChat(Chat(User.YOU, textFieldController.text));
            textFieldController.text = "";
          },
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