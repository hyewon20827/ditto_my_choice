import 'package:ditto/data/model/user_model.dart';
import 'package:ditto/domain/entity/Auth/dev_login.dart';

import '../../domain/entity/Auth/social_login.dart';

class DevAuthModel {
  final String accessToken;
  final String tokenType;
  final int expiresIn;
  final UserModel? user;

  const DevAuthModel({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
    this.user
  });

  factory DevAuthModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return DevAuthModel(
      accessToken: json['accessToken'] as String,
      tokenType: json['tokenType'] as String,
      expiresIn: json['expiresIn'] as int,
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );
  }

  DevLogin toEntity() {
    return DevLogin(
      accessToken: accessToken,
      tokenType: tokenType,
      expiresIn: expiresIn,
      user: user?.toEntity()
    );
  }
}