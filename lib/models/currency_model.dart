import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:municipality_app/main/main.dart';
import 'package:municipality_app/utils/tools.dart';

part 'currency_model.g.dart';

@JsonSerializable()
class CurrencyModel extends Equatable {
  @JsonKey(name: "curnCode")
  String? code;

  @JsonKey(name: "eCurnName")
  String? english;

  @JsonKey(name: "aCurnName")
  String? arabic;

  @JsonKey(name: "rateToLocal")
  double? rate;

  CurrencyModel(this.code, this.english, this.arabic, this.rate);

  String getName(context) {
    return MunicipalityApp.of(context)!.locale.languageCode == 'ar'
        ? arabic!
        : english!;
  }

  factory CurrencyModel.fromJson(Map<String, dynamic> json) =>
      _$CurrencyModelFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyModelToJson(this);

  static Map<String, dynamic> toMap(json) => _$CurrencyModelToJson(json);

  @override
  List<Object?> get props => [this.code, this.english, this.arabic, this.rate];
}
