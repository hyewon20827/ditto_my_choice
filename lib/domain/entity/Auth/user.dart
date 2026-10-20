class User {
  final int id;
  final String nickname;
  final String? profileImageUrl;

  const User({
    required this.id,
    required this.nickname,
    this.profileImageUrl
  });
}