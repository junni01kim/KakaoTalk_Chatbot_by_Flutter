import 'package:flutter/material.dart';

import '../chat_room/chat_room.dart';
import '../res/theme_color.dart';

class ChatRoomListBody extends StatelessWidget {
  final List<String> chatRoomNames;

  const ChatRoomListBody({super.key, required this.chatRoomNames});

  @override
  Widget build(BuildContext context) {
    return ListView.builder( // 리스트 뷰
      padding: const EdgeInsets.all(8),
      itemCount: chatRoomNames.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChatRoom())
            );
          },
          onHover: (value) {
            // TODO: 색상 변경
          },
          child: Container(
            height: 50,
            margin: const EdgeInsets.symmetric(vertical: 4),
            color: Colors.white,
            child: Row(
              spacing: 10.0,
              children: [
                Icon( // TODO: clip 필요
                    Icons.person ,
                    size: 50,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chatRoomNames[index],
                      style: TextStyle(
                        color: ThemeColor.text,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text("일반 텍스트 작성"),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}