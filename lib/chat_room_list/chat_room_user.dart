import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../res/theme_color.dart';

class ChatRoomUser extends StatelessWidget {
  final String chatRoomName;
  final IconData userProfileName;
  final bool hover;

  const ChatRoomUser({super.key, required this.chatRoomName, required this.userProfileName, required this.hover});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: hover? Colors.white12 : Colors.white,
      child: Row(
        spacing: 10.0,
        children: [
          Icon( // TODO: clip 필요
            userProfileName,
            size: 50,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                chatRoomName,
                style: TextStyle(
                  color: ThemeColor.text,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text("일반 텍스트 작성"), // TODO: 최근 메세지 가져오기
            ],
          )
        ],
      ),
    );
  }
}