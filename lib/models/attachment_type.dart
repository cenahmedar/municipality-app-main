import 'package:json_annotation/json_annotation.dart';
import 'package:municipality_app/models/uploaded_file.dart';
import 'package:municipality_app/utils/json_serializer_utils.dart';
part 'attachment_type.g.dart';

@JsonSerializable()
class AttachmentType {
  @JsonKey(name: 'id')
  final double id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'registrationField', fromJson: boolFromString)
  final bool registrationField;

  @JsonKey(name: 'requiredType', fromJson: boolFromString)
  final bool requiredType;

  UploadedFile? file;

  AttachmentType({
    required this.id,
    required this.name,
    required this.registrationField,
    required this.requiredType,
  });
  factory AttachmentType.fromJson(Map<String, dynamic> json) =>
      _$AttachmentTypeFromJson(json);

  Map<String, dynamic> toJson() => _$AttachmentTypeToJson(this);
}
