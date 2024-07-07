// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Token _$TokenFromJson(Map<String, dynamic> json) => Token(
      json['accessToken'] as String,
      json['name'] as String,
      json['isAdmin'] as bool,
      json['userId'] as String,
      json['userEmail'] as String,
      json['profileImagePath'] as String,
      json['shouldChangePassword'] as bool,
    );

Map<String, dynamic> _$TokenToJson(Token instance) => <String, dynamic>{
      'accessToken': instance.accessToken,
      'name': instance.name,
      'isAdmin': instance.isAdmin,
      'userId': instance.userId,
      'userEmail': instance.userEmail,
      'profileImagePath': instance.profileImagePath,
      'shouldChangePassword': instance.shouldChangePassword,
    };
