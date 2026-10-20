import 'package:ditto/data/model/user_model.dart';

import '../../domain/entity/Auth/auth.dart';

class AuthModel {
  final String accessToken;
  final String tokenType;
  final int expiresIn;
  final UserModel user;

  const AuthModel({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
    required this.user
  });

  factory AuthModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return AuthModel(
      accessToken: json['accessToken'] as String,
      tokenType: json['tokenType'] as String,
      expiresIn: json['expiresIn'] as int,
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );
  }

  Auth toEntity() {
    return Auth(
      accessToken: accessToken,
      tokenType: tokenType,
      expiresIn: expiresIn,
      user: user.toEntity()
    );
  }
}