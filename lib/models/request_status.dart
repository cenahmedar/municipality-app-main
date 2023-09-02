import 'package:json_annotation/json_annotation.dart';

part 'request_status.g.dart';

@JsonSerializable()
class RequestStatus {
  @JsonKey(name: 'id')
  final double id;

  @JsonKey(name: 'nameAr')
  final String nameAr;

  @JsonKey(name: 'nameEn')
  final String nameEn;
  RequestStatus({required this.id, required this.nameAr, required this.nameEn});

  factory RequestStatus.fromJson(Map<String, dynamic> json) =>
      _$RequestStatusFromJson(json);

  Map<String, dynamic> toJson() => _$RequestStatusToJson(this);
}
