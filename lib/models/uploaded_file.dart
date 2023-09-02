import 'package:json_annotation/json_annotation.dart';
import 'package:municipality_app/models/attachment_type.dart';
part 'uploaded_file.g.dart';

@JsonSerializable()
class UploadedFile {
  @JsonKey(name: 'id')
  final double id;
  @JsonKey(name: 'citizenRef')
  final double citizenRef;

  @JsonKey(name: 'attachmentName')
  final String attachmentName;

  @JsonKey(name: 'thedoc')
  final String thedoc;

  @JsonKey(name: 'attachType', fromJson: _attachmentTypeModel)
  final AttachmentType attachmentType;

  static AttachmentType _attachmentTypeModel(dynamic value) =>
      AttachmentType.fromJson(value);

  UploadedFile({
    required this.id,
    required this.citizenRef,
    required this.attachmentName,
    required this.thedoc,
    required this.attachmentType,
  });
  factory UploadedFile.fromJson(Map<String, dynamic> json) =>
      _$UploadedFileFromJson(json);

  Map<String, dynamic> toJson() => _$UploadedFileToJson(this);
}
