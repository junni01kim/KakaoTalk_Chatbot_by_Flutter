
import 'package:flutter/material.dart';

import 'chat_room_list/chat_room_list.dart';

void main() {
  runApp(const KakaoTalk());
}

/**
 * 상태 변형이 없는 위젯이다.
 *
 * 처음 생성되는 최상단 위젯
 */
class KakaoTalk extends StatelessWidget {
  const KakaoTalk({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '카카오톡 채팅창',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChatRoomList(), // 여기에 작성하면 되는 것이며, ChatRoomList로 단순히 모듈화 해둔 것
    );
  }
}