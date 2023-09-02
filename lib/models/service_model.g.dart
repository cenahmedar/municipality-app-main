// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceModel _$ServiceModelFromJson(Map<String, dynamic> json) => ServiceModel(
      (json['serviceSeq'] as num?)?.toDouble(),
      json['eServiceName'] as String?,
      json['aServiceName'] as String?,
      json['isactive'] as String?,
      json['cat'] == null
          ? null
          : ServiceCategory.fromJson(json['cat'] as Map<String, dynamic>),
      (json['responseDays'] as num?)?.toDouble(),
      (json['fee'] as num?)?.toDouble(),
      json['feeCurn'] as String?,
      json['feeCurnNavigation'] == null
          ? null
          : CurrencyModel.fromJson(
              json['feeCurnNavigation'] as Map<String, dynamic>),
      (json['serviceFields'] as List<dynamic>)
          .map((e) => ServiceFieldModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ServiceModelToJson(ServiceModel instance) =>
    <String, dynamic>{
      'serviceSeq': instance.id,
      'eServiceName': instance.englishName,
      'aServiceName': instance.arabicName,
      'isactive': instance.active,
      'cat': ServiceCategory.toMap(instance.category),
      'responseDays': instance.responseDays,
      'fee': instance.fee,
      'feeCurn': instance.currency,
      'feeCurnNavigation': CurrencyModel.toMap(instance.currencyRate),
      'serviceFields': instance.serviceFields,
    };
