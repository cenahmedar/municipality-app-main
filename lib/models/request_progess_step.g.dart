// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_progess_step.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestProgressStep _$RequestProgressStepFromJson(Map<String, dynamic> json) =>
    RequestProgressStep(
      aDeptName: json['aDeptName'] as String?,
      eDeptName: json['eDeptName'] as String?,
      statusAr: json['statusAr'] as String?,
      statusEn: json['statusEn'] as String?,
    );

Map<String, dynamic> _$RequestProgressStepToJson(
        RequestProgressStep instance) =>
    <String, dynamic>{
      'eDeptName': instance.eDeptName,
      'aDeptName': instance.aDeptName,
      'statusAr': instance.statusAr,
      'statusEn': instance.statusEn,
    };
