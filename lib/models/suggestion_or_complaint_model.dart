import 'package:json_annotation/json_annotation.dart';
part 'suggestion_or_complaint_model.g.dart';

@JsonSerializable()
class SuggestionOrComplaint {
  @JsonKey(name: 'requestDate')
  final DateTime requestDate;
  @JsonKey(name: 'thedoc')
  final String? thedoc;
  @JsonKey(name: 'text')
  final String? text;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'publicName')
  final String? publicName;
  @JsonKey(name: 'telephone')
  final String? telephone;
  @JsonKey(name: 'hazardLocation')
  final String? hazardLocation;

  SuggestionOrComplaint({
    required this.requestDate,
    required this.thedoc,
    required this.text,
    required this.email,
    required this.publicName,
    required this.telephone,
    required this.hazardLocation,
  });

  factory SuggestionOrComplaint.fromJson(Map<String, dynamic> json) =>
      _$SuggestionOrComplaintFromJson(json);

  Map<String?, dynamic> toJson() => _$SuggestionOrComplaintToJson(this);
}
