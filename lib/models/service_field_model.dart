import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:municipality_app/main/main.dart';
import 'package:municipality_app/models/lookup_data_model.dart';
import 'package:municipality_app/utils/json_serializer_utils.dart';

part 'service_field_model.g.dart';

@JsonSerializable()
class ServiceFieldModel extends Equatable {
  @JsonKey(name: 'fieldRef')
  double? fieldReference;
  double? sfSeq;

  @JsonKey(name: 'required', fromJson: boolFromString)
  bool requiredField;

  double? fieldOrder;

  @JsonKey(readValue: _readValueWithString)
  String? fieldType;

  @JsonKey(readValue: _readValueWithString)
  String? fieldName;

  @JsonKey(name: 'fieldArabicName', readValue: _readValueWithString)
  String? fieldArabicName;

  ServiceFieldModel(
    this.fieldReference,
    this.sfSeq,
    this.requiredField,
    this.fieldOrder,
    this.fieldName,
    this.fieldType,
    this.lookupData,
    this.cascadeField,
  );

  @JsonKey(name: 'islookup', readValue: _readValueWithString)
  String? lookup;

  @JsonKey(name: 'lookupData', readValue: _readValueWithString)
  List<LookupDataModel>? lookupData;

  @JsonKey(name: 'cascadeField', readValue: _readValueWithString)
  double? cascadeField;

  @override
  List<Object?> get props => [];

  static dynamic _readValueWithString(Map map, String key) =>
      map['fieldRefNavigation'][key];

  factory ServiceFieldModel.fromJson(Map<String, dynamic> json) {
    return _$ServiceFieldModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ServiceFieldModelToJson(this);

  bool get isLookup => lookup == 'Y';

  String getName(context) {
    return MunicipalityApp.of(context)!.locale.languageCode == 'ar'
        ? fieldArabicName!
        : fieldName!;
  }
}
