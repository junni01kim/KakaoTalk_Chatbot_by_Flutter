import 'package:flutter/material.dart';

/// 새로운 채팅방의 이름을 작성하기 위한 `Dialog`이다.
AlertDialog NewRoomDialog(Function(String) onAddRoom) {
  return AlertDialog(
    title: Text('채팅방 생성'),
    content: TextField(
      onSubmitted: (String value) {
        onAddRoom(value);
      },
    ),
  );
}