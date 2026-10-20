

import 'package:freezed_annotation/freezed_annotation.dart';

part 'social_login_request.g.dart';

@JsonSerializable()
class SocialLoginRequest {
  final String provider;
  final String idToken;

  const SocialLoginRequest({
    required this.provider,
    required this.idToken
  });

  factory SocialLoginRequest.fromJson(Map<String, dynamic> json) =>
      _$SocialLoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SocialLoginRequestToJson(this);
}