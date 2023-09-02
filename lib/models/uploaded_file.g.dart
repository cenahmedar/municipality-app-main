// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uploaded_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadedFile _$UploadedFileFromJson(Map<String, dynamic> json) => UploadedFile(
      id: (json['id'] as num).toDouble(),
      citizenRef: (json['citizenRef'] as num).toDouble(),
      attachmentName: json['attachmentName'] as String,
      thedoc: json['thedoc'] as String,
      attachmentType: UploadedFile._attachmentTypeModel(json['attachType']),
    );

Map<String, dynamic> _$UploadedFileToJson(UploadedFile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'citizenRef': instance.citizenRef,
      'attachmentName': instance.attachmentName,
      'thedoc': instance.thedoc,
      'attachType': instance.attachmentType,
    };
