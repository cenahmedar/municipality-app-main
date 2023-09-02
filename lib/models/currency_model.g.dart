// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyModel _$CurrencyModelFromJson(Map<String, dynamic> json) =>
    CurrencyModel(
      json['curnCode'] as String?,
      json['eCurnName'] as String?,
      json['aCurnName'] as String?,
      (json['rateToLocal'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CurrencyModelToJson(CurrencyModel instance) =>
    <String, dynamic>{
      'curnCode': instance.code,
      'eCurnName': instance.english,
      'aCurnName': instance.arabic,
      'rateToLocal': instance.rate,
    };
