import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'chat_room_list_app_bar.dart';

/**
 * 채팅방 정보를 볼 수 있는 클래스이다.
 *
 * 채팅방 생성과 입장을 할 수 있다.
 */
class ChatRoomList extends StatefulWidget {
  @override
  State<ChatRoomList> createState() => _ChatRoomListState();
}

class _ChatRoomListState extends State<ChatRoomList> {
  List<String> chatRoomNames = ['첫번째', '두번째'];

  @override
  Widget build(BuildContext context) {
    return Scaffold( // 상단 제목
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: ChatRoomListAppBar(
            onAddRoom: (String newRoomName) {
              setState(() {
                chatRoomNames.add(newRoomName);
              });
            }),
      ),

      body: ListView.builder( // 리스트 뷰
        padding: const EdgeInsets.all(8),
        itemCount: chatRoomNames.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              // 여기에 각 채팅방 클릭 시 동작을 정의할 수 있습니다.
              print('Tapped on: ${chatRoomNames[index]}');
            },
            child: Container(
              height: 150,
              margin: const EdgeInsets.symmetric(vertical: 4),
              color: index % 2 == 0 ? Colors.deepOrange : Colors.deepOrangeAccent,
              child: Center(
                child: Text(
                  chatRoomNames[index],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}