import 'package:json_annotation/json_annotation.dart';
import 'package:municipality_app/models/request_progess_step.dart';

part 'request_progress.g.dart';

@JsonSerializable()
class RequestProgress {
  @JsonKey(name: 'finalStatusAr')
  final String? finalStatusAr;

  @JsonKey(name: 'finalStatusEn')
  final String? finalStatusEn;

  @JsonKey(
    name: 'steps',
    fromJson: _stepsModel,
  )
  final List<RequestProgressStep>? steps;

  RequestProgress({
    this.finalStatusAr,
    this.finalStatusEn,
    this.steps,
  });

  static List<RequestProgressStep> _stepsModel(dynamic data) => data
      .map<RequestProgressStep>((json) => RequestProgressStep.fromJson(json))
      .toList();

  Map<String, dynamic> toJson() => _$RequestProgressToJson(this);
  factory RequestProgress.fromJson(Map<String, dynamic> json) =>
      _$RequestProgressFromJson(json);
}
