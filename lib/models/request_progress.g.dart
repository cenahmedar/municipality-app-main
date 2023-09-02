// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestProgress _$RequestProgressFromJson(Map<String, dynamic> json) =>
    RequestProgress(
      finalStatusAr: json['finalStatusAr'] as String?,
      finalStatusEn: json['finalStatusEn'] as String?,
      steps: RequestProgress._stepsModel(json['steps']),
    );

Map<String, dynamic> _$RequestProgressToJson(RequestProgress instance) =>
    <String, dynamic>{
      'finalStatusAr': instance.finalStatusAr,
      'finalStatusEn': instance.finalStatusEn,
      'steps': instance.steps,
    };
