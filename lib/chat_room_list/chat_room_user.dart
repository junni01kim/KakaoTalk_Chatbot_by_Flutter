import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../res/theme_color.dart';

/// 채팅방 정보를 보여주는 위젯이다.
///
/// [chatRoomName] 채팅방의 이름이 저장되는 변수이다.
/// [userProfileData] 채팅 상대의 프로필을 저장한 객체이다. (현재는 Icons.Person이다.)
/// [hover] 현재 호버링되었는지 여부를 판단하는 변수이다. [ChatRoomList.hoverChatRoomUser]를 참조한다.
class ChatRoomUser extends StatelessWidget {
  final String chatRoomName;
  final IconData userProfileData;
  final bool hover;

  const ChatRoomUser({super.key, required this.chatRoomName, required this.userProfileData, required this.hover});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: hover? Colors.white12 : Colors.white,
      child: Row(
        spacing: 10.0,
        children: [
          Icon( // TODO: clip 필요
            userProfileData,
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