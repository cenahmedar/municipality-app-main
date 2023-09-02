// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceInput _$ServiceInputFromJson(Map<String, dynamic> json) => ServiceInput(
      inputFieldId: (json['inputFieldId'] as num).toDouble(),
      valueString: json['valueString'],
      attachment: json['attachment'],
    );

Map<String, dynamic> _$ServiceInputToJson(ServiceInput instance) =>
    <String, dynamic>{
      'inputFieldId': instance.inputFieldId,
      'valueString': instance.valueString,
      'attachment': instance.attachment,
    };
