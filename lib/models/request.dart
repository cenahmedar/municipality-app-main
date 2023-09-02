import 'package:json_annotation/json_annotation.dart';
import 'package:municipality_app/models/request_progress.dart';

import 'package:municipality_app/models/service_model.dart';
import 'package:municipality_app/utils/json_serializer_utils.dart';
part 'request.g.dart';

@JsonSerializable()
class Request {
  @JsonKey(name: 'dateSubmitted', fromJson: dateTimeFromString)
  final DateTime? dateSubmitted;

  @JsonKey(name: 'serviceFormSeq')
  final double serviceFormSeq;

  @JsonKey(name: 'dateEnd', fromJson: dateTimeFromString)
  final DateTime? dateEnd;

  @JsonKey(name: 'isFromInternet', fromJson: boolFromString)
  final bool isFromInternet;

  @JsonKey(name: 'progress', fromJson: _requestProgress)
  final RequestProgress requestProgress;

  @JsonKey(
    name: 'serviceRefNavigation',
    toJson: ServiceModel.toMap,
    fromJson: _serviceModel,
  )
  final ServiceModel service;

  static ServiceModel _serviceModel(dynamic value) =>
      ServiceModel.fromJson(value);

  static RequestProgress _requestProgress(dynamic value) =>
      RequestProgress.fromJson(value);

  Request({
    required this.dateSubmitted,
    required this.serviceFormSeq,
    required this.dateEnd,
    required this.isFromInternet,
    required this.requestProgress,
    required this.service,
  });
  factory Request.fromJson(Map<String, dynamic> json) =>
      _$RequestFromJson(json);

  Map<String, dynamic> toJson() => _$RequestToJson(this);
}
