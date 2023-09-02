import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:municipality_app/main/main.dart';

part 'lookup_data_model.g.dart';

@JsonSerializable()
class LookupDataModel extends Equatable {
  final String? code;
  @JsonKey(name: 'aName')
  final String? arabic;
  @JsonKey(name: 'eName')
  final String? english;

  final String? cascade;

  LookupDataModel(this.code, this.arabic, this.english, this.cascade);

  String getName(context) {
    return MunicipalityApp.of(context)!.locale.languageCode == 'ar'
        ? arabic!
        : english!;
  }

  @override
  List<Object?> get props => [];

  factory LookupDataModel.fromJson(Map<String, dynamic> json) =>
      LookupDataModel(
        json['code'],
        json['aName'] ?? json['aname'],
        json['eName'] ?? json['ename'],
        json['cascade'],
      );
}
