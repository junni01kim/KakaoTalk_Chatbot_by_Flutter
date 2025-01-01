import 'package:flutter/material.dart';

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