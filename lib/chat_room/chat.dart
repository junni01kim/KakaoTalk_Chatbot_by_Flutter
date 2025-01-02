/// 유저가 작성한 채팅 정보가 담긴 클래스
///
/// [user] 작성한 사용자 구분
/// [message] 작성한 메세지 내용
/// [time] 전송 시간 (현재 시간)
class Chat {
  User user;
  String message;
  DateTime time = DateTime.now();

  Chat(this.user, this.message);
}

/// 사용자를 구분하는 단위이다.
/// 현재 개인 채팅창만 구현했기 때문에, `enum`으로 구분한다.
enum User {
  ME,
  YOU
}