
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '카카오톡 채팅창',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ChatRoomList(title: '채팅방'),
    );
  }
}

class ChatRoomList extends StatefulWidget {
  const ChatRoomList({super.key, required this.title});

  final String title;

  @override
  State<ChatRoomList> createState() => _ChatRoomListState();
}

class _ChatRoomListState extends State<ChatRoomList> {
  List<String> chatRoomNames = ["첫번째","두번째"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
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
