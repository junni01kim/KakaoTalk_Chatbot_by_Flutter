class Chat {
  User user = User.ME;
  String message = "";
  DateTime time = DateTime.now();
}

enum User {
  ME,
  YOU
}