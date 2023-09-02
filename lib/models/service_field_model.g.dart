// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_field_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceFieldModel _$ServiceFieldModelFromJson(Map<String, dynamic> json) =>
    ServiceFieldModel(
      (json['fieldRef'] as num?)?.toDouble(),
      (json['sfSeq'] as num?)?.toDouble(),
      boolFromString(json['required']),
      (json['fieldOrder'] as num?)?.toDouble(),
      ServiceFieldModel._readValueWithString(json, 'fieldName') as String?,
      ServiceFieldModel._readValueWithString(json, 'fieldType') as String?,
      (ServiceFieldModel._readValueWithString(json, 'lookupData')
              as List<dynamic>?)
          ?.map((e) => LookupDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (ServiceFieldModel._readValueWithString(json, 'cascadeField') as num?)
          ?.toDouble(),
    )
      ..fieldArabicName =
          ServiceFieldModel._readValueWithString(json, 'fieldArabicName')
              as String?
      ..lookup =
          ServiceFieldModel._readValueWithString(json, 'islookup') as String?;

Map<String, dynamic> _$ServiceFieldModelToJson(ServiceFieldModel instance) =>
    <String, dynamic>{
      'fieldRef': instance.fieldReference,
      'sfSeq': instance.sfSeq,
      'required': instance.requiredField,
      'fieldOrder': instance.fieldOrder,
      'fieldType': instance.fieldType,
      'fieldName': instance.fieldName,
      'fieldArabicName': instance.fieldArabicName,
      'islookup': instance.lookup,
      'lookupData': instance.lookupData,
      'cascadeField': instance.cascadeField,
    };
