class Chat {
  User user;
  String message;
  DateTime time = DateTime.now();

  Chat(this.user, this.message);
}

enum User {
  ME,
  YOU
}