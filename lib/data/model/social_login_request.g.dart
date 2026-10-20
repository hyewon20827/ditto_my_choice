// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SocialLoginRequest _$SocialLoginRequestFromJson(Map<String, dynamic> json) =>
    SocialLoginRequest(
      provider: json['provider'] as String,
      idToken: json['idToken'] as String,
    );

Map<String, dynamic> _$SocialLoginRequestToJson(SocialLoginRequest instance) =>
    <String, dynamic>{
      'provider': instance.provider,
      'idToken': instance.idToken,
    };
