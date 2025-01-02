import 'dart:convert';
import 'package:http/http.dart' as http;

import 'chat_completion.dart';

class GptApi {
  static String API_URL = "https://api.openai.com/v1/chat/completions";

  static Future<ChatCompletion?> question(String message) async {
    var url = Uri.parse(API_URL);
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer YOUR_API_KEY' // API 키를 설정해야 함
    };

    var body = jsonEncode(
      GptRequest(
        model: "gpt-4o-mini",
        messages: [
          Message(role: "developer", content: "You are a helpful assistant."),
          Message(role: "user", content: "나의 대화상대가 되어줘. $message"),
        ],
      ).toJson()
    );

    var response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        var jsonResult = jsonDecode(response.body);
        return ChatCompletion.fromJson(jsonResult);
      } else {
        return null;
      }
    } else if (response.statusCode == 404) {
      return null;
    } else {
      throw Exception("Failed to load response");
    }
  }
}

// Request 모델
class GptRequest {
  final String model;
  final List<Message> messages;

  GptRequest({
    required this.model,
    required this.messages,
  });

  Map<String, dynamic> toJson() {
    return {
      'model': model,
      'messages': messages.map((msg) => msg.toJson()).toList(),
    };
  }
}

// Message 클래스
class Message {
  final String role;
  final String content;

  Message({
    required this.role,
    required this.content,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      role: json['role'],
      content: json['content'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'role': role,
      'content': content,
    };
  }
}