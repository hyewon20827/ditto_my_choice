import 'package:ditto/data/model/user_model.dart';

import '../../domain/entity/Auth/social_login.dart';

class SocialLoginModel {
  final String accessToken;
  final String tokenType;
  final int expiresIn;
  final bool isNewUser;
  final UserModel user;

  const SocialLoginModel({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
    required this.isNewUser,
    required this.user
  });

  factory SocialLoginModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return SocialLoginModel(
      accessToken: json['accessToken'] as String,
      tokenType: json['tokenType'] as String,
      expiresIn: json['expiresIn'] as int,
      isNewUser: json['isNewUser'] as bool,
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );
  }

  SocialLogin toEntity() {
    return SocialLogin(
      accessToken: accessToken,
      tokenType: tokenType,
      expiresIn: expiresIn,
      user: user.toEntity()
    );
  }
}