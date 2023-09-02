// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpModel _$SignUpModelFromJson(Map<String, dynamic> json) => SignUpModel(
      json['userName'] as String,
      json['idNumber'] as String,
      json['mobileNumber'] as String,
      json['password'] as String,
      json['confirmPassword'] as String,
    );

Map<String, dynamic> _$SignUpModelToJson(SignUpModel instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'idNumber': instance.idNumber,
      'mobileNumber': instance.phone,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
    };
