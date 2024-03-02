// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tax.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tax _$TaxFromJson(Map<String, dynamic> json) => Tax(
      taxAmount: Tax.stringToDouble(json['taxAmount']),
      taxName: json['taxName'] as String,
      ptid: json['ptid'] as String,
      serviceNo: json['serviceNo'] as String,
      taxDate: Tax.stringToDate(json['taxDate']),
    );

Map<String, dynamic> _$TaxToJson(Tax instance) => <String, dynamic>{
      'taxAmount': instance.taxAmount,
      'taxName': instance.taxName,
      'serviceNo': instance.serviceNo,
      'ptid': instance.ptid,
      'taxDate': instance.taxDate?.toIso8601String(),
    };
