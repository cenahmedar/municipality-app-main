// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggestion_or_complaint_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuggestionOrComplaint _$SuggestionOrComplaintFromJson(
        Map<String, dynamic> json) =>
    SuggestionOrComplaint(
      requestDate: DateTime.parse(json['requestDate'] as String),
      thedoc: json['thedoc'] as String?,
      text: json['text'] as String?,
      email: json['email'] as String?,
      publicName: json['publicName'] as String?,
      telephone: json['telephone'] as String?,
      hazardLocation: json['hazardLocation'] as String?,
    );

Map<String, dynamic> _$SuggestionOrComplaintToJson(
        SuggestionOrComplaint instance) =>
    <String, dynamic>{
      'requestDate': instance.requestDate.toIso8601String(),
      'thedoc': instance.thedoc,
      'text': instance.text,
      'email': instance.email,
      'publicName': instance.publicName,
      'telephone': instance.telephone,
      'hazardLocation': instance.hazardLocation,
    };
