// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_credentials.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserCredentials _$UserCredentialsFromJson(Map<String, dynamic> json) =>
    UserCredentials(
      json['idNumber'] as String,
      json['password'] as String,
    );

Map<String, dynamic> _$UserCredentialsToJson(UserCredentials instance) =>
    <String, dynamic>{
      'idNumber': instance.username,
      'password': instance.password,
    };
