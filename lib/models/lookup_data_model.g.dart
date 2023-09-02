// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lookup_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LookupDataModel _$LookupDataModelFromJson(Map<String, dynamic> json) =>
    LookupDataModel(
      json['code'] as String?,
      json['aName'] as String?,
      json['eName'] as String?,
      json['cascade'] as String?,
    );

Map<String, dynamic> _$LookupDataModelToJson(LookupDataModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'aName': instance.arabic,
      'eName': instance.english,
      'cascade': instance.cascade,
    };
