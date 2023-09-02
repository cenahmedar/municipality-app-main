import 'package:json_annotation/json_annotation.dart';

part 'service_input.g.dart';

@JsonSerializable()
class ServiceInput {
  final double inputFieldId;
  dynamic valueString;
  dynamic? attachment;

  ServiceInput({
    required this.inputFieldId,
    required this.valueString,
    this.attachment,
  });
  factory ServiceInput.fromJson(Map<String, dynamic> json) =>
      _$ServiceInputFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceInputToJson(this);
}
