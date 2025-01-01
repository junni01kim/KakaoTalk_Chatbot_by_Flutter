import 'package:flutter/material.dart';

import 'chat.dart';

class ChatRoomBody extends StatefulWidget {
  final List<Chat> chats = [];

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
              return Container(
                height: 150,
                margin: const EdgeInsets.symmetric(vertical: 4),
                color: index % 2 == 0 ? Colors.deepOrange : Colors.deepOrangeAccent,
                child: Center(
                  child: Text(
                    widget.chats[index].message,
                    style: const TextStyle(
                      color: Colors.white,
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
            Expanded(
              child: TextField()
            ),
            IconButton(
                icon: Icon(Icons.send),
                onPressed: (){ /* TODO: 전송 기능 추가 */ },
            )
          ],
        )
      ],
    );
  }
}