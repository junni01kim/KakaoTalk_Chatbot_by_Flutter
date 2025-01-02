import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'new_room_dialog/new_room_dialog.dart';

/// `ChatRoomList`의 `AppBar`를 디자인한 위젯이다.
///
/// 1. 화면 제목 생성
/// 2. 우측 버튼 클릭 시, 새로운 채팅방을 만드는 모달이 등장한다.
class ChatRoomListAppBar extends StatelessWidget {
  final Function(String) onAddRoom;

  const ChatRoomListAppBar({Key? key, required this.onAddRoom});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('채팅방'),
        IconButton(
          icon: Icon(Icons.add_comment),
          onPressed: (){
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return NewRoomDialog(onAddRoom);
              }
            );
          },
        ),
      ],
    );
  }
}
