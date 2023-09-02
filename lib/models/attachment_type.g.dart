// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttachmentType _$AttachmentTypeFromJson(Map<String, dynamic> json) =>
    AttachmentType(
      id: (json['id'] as num).toDouble(),
      name: json['name'] as String,
      registrationField: boolFromString(json['registrationField']),
      requiredType: boolFromString(json['requiredType']),
    )..file = json['file'] == null
        ? null
        : UploadedFile.fromJson(json['file'] as Map<String, dynamic>);

Map<String, dynamic> _$AttachmentTypeToJson(AttachmentType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'registrationField': instance.registrationField,
      'requiredType': instance.requiredType,
      'file': instance.file,
    };
