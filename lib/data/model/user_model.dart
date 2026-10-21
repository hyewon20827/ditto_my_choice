import 'package:ditto/domain/entity/Auth/user.dart';

class UserModel {
  final int id;
  final String nickname;
  final String? profileImageUrl;

  UserModel({
    required this.id,
    required this.nickname,
    this.profileImageUrl
  });

  factory UserModel.fromJson(
      Map<String, dynamic> json,
      ){
    return UserModel(
        id: json['id'] as int,
        nickname: json['nickname'] as String,
        profileImageUrl: json['profileImageUrl'] == null
            ? null
            : json['profileImageUrl'] as String
    );
  }

  User toEntity(){
    return User(
      id: id,
      nickname: nickname,
      profileImageUrl: profileImageUrl
    );
  }
}