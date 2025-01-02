import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../res/theme_color.dart';
import 'chat.dart';

class ChatBoard extends StatelessWidget {
  final List<Chat> chats;

  const ChatBoard({super.key, required this.chats});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder( // 리스트 뷰
        padding: const EdgeInsets.all(8),
        itemCount: chats.length,
        itemBuilder: (context, index) {
          return Align(
            alignment: chats[index].user == User.ME
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 4),
              padding: const EdgeInsets.symmetric(
                  vertical: 8, horizontal: 12),
              decoration: BoxDecoration(
                color: chats[index].user == User.ME
                    ? Colors.yellow
                    : Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                chats[index].message,
                style: TextStyle(
                  color: ThemeColor.text,
                  fontSize: 18,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

}