// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestStatus _$RequestStatusFromJson(Map<String, dynamic> json) =>
    RequestStatus(
      id: (json['id'] as num).toDouble(),
      nameAr: json['nameAr'] as String,
      nameEn: json['nameEn'] as String,
    );

Map<String, dynamic> _$RequestStatusToJson(RequestStatus instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameAr': instance.nameAr,
      'nameEn': instance.nameEn,
    };
