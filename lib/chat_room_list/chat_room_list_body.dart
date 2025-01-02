import 'package:flutter/material.dart';
import 'package:kakaotalk_chatbot_by_flutter/chat_room_list/chat_room_user.dart';

import '../chat_room/chat_room.dart';

/// `ChatRoomList`의 `Body`를 디자인한 위젯이다.
///
/// [chatRoomNames] 채팅방의 이름을 추가해둔 객체이다.
/// [hoverChatRoomUser] 각 채팅방이 `Hoverring` 되었는지 확인하기 위한 객체이다.
class ChatRoomListBody extends StatefulWidget {
  final List<String> chatRoomNames;
  final List<bool> hoverChatRoomUser;

  const ChatRoomListBody({super.key, required this.chatRoomNames, required this.hoverChatRoomUser});

  @override
  State<ChatRoomListBody> createState() => _ChatRoomListBody();
}

class _ChatRoomListBody extends State<ChatRoomListBody> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder( // 리스트 뷰
      padding: const EdgeInsets.all(8),
      itemCount: widget.chatRoomNames.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatRoom())
            );
          },
          onHover: (value) {
            setState(() {
              widget.hoverChatRoomUser[index] = value;
            });
          },
          child: ChatRoomUser(
            userProfileData: Icons.person,
            chatRoomName: widget.chatRoomNames[index],
            hover: widget.hoverChatRoomUser[index]
          ),
        );
      },
    );
  }
}