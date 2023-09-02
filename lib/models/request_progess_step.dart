import 'package:json_annotation/json_annotation.dart';
import 'package:municipality_app/main/main.dart';

part 'request_progess_step.g.dart';

@JsonSerializable()
class RequestProgressStep {
  @JsonKey(name: 'eDeptName')
  final String? eDeptName;

  @JsonKey(name: 'aDeptName')
  final String? aDeptName;

  @JsonKey(name: 'statusAr')
  final String? statusAr;

  @JsonKey(name: 'statusEn')
  final String? statusEn;

  String? getName(context) {
    return MunicipalityApp.of(context)!.locale.languageCode == 'ar'
        ? aDeptName
        : eDeptName;
  }

  String getStatus(context) {
    return MunicipalityApp.of(context)!.locale.languageCode == 'ar'
        ? statusAr!
        : statusEn!;
  }

  RequestProgressStep({
    this.aDeptName,
    this.eDeptName,
    this.statusAr,
    this.statusEn,
  });

  Map<String, dynamic> toJson() => _$RequestProgressStepToJson(this);
  factory RequestProgressStep.fromJson(Map<String, dynamic> json) =>
      _$RequestProgressStepFromJson(json);
}
