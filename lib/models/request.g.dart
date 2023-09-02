// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Request _$RequestFromJson(Map<String, dynamic> json) => Request(
      dateSubmitted: dateTimeFromString(json['dateSubmitted']),
      serviceFormSeq: (json['serviceFormSeq'] as num).toDouble(),
      dateEnd: dateTimeFromString(json['dateEnd']),
      isFromInternet: boolFromString(json['isFromInternet']),
      requestProgress: Request._requestProgress(json['progress']),
      service: Request._serviceModel(json['serviceRefNavigation']),
    );

Map<String, dynamic> _$RequestToJson(Request instance) => <String, dynamic>{
      'dateSubmitted': instance.dateSubmitted?.toIso8601String(),
      'serviceFormSeq': instance.serviceFormSeq,
      'dateEnd': instance.dateEnd?.toIso8601String(),
      'isFromInternet': instance.isFromInternet,
      'progress': instance.requestProgress,
      'serviceRefNavigation': ServiceModel.toMap(instance.service),
    };
