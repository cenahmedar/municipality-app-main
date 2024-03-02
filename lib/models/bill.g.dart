// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bill _$BillFromJson(Map<String, dynamic> json) => Bill(
      invoiceAmount: Bill.stringToDouble(json['invoiceAmount']),
      lateFees: Bill.stringToDouble(json['lateFees']),
      invoiceNo: json['invoiceNo'] as String?,
      invoiceDate: json['invoiceDate'] as String?,
      serviceNo: json['serviceNo'] as String?,
    );

Map<String, dynamic> _$BillToJson(Bill instance) => <String, dynamic>{
      'invoiceAmount': instance.invoiceAmount,
      'lateFees': instance.lateFees,
      'invoiceNo': instance.invoiceNo,
      'invoiceDate': instance.invoiceDate,
      'serviceNo': instance.serviceNo,
    };
