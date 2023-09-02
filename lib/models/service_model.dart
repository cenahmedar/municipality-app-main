import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:municipality_app/main/main.dart';
import 'package:municipality_app/models/currency_model.dart';
import 'package:municipality_app/models/service_category.dart';
import 'package:municipality_app/models/service_field_model.dart';

part 'service_model.g.dart';

@JsonSerializable()
class ServiceModel extends Equatable {
  @JsonKey(name: "serviceSeq")
  double? id;

  @JsonKey(name: "eServiceName")
  String? englishName;

  @JsonKey(name: "aServiceName")
  String? arabicName;

  @JsonKey(name: "isactive")
  String? active;

  @JsonKey(ignore: true)
  bool isEmpty = false;

  @JsonKey(name: 'cat', toJson: ServiceCategory.toMap)
  ServiceCategory? category;

  double? responseDays = 0;

  double? fee = 0;

  @JsonKey(name: "feeCurn")
  String? currency;

  @JsonKey(name: 'feeCurnNavigation', toJson: CurrencyModel.toMap)
  CurrencyModel? currencyRate;

  List<ServiceFieldModel> serviceFields = [];

  ServiceModel(
      this.id,
      this.englishName,
      this.arabicName,
      this.active,
      this.category,
      this.responseDays,
      this.fee,
      this.currency,
      this.currencyRate,
      this.serviceFields);

  String getName(context) {
    return MunicipalityApp.of(context)!.locale.languageCode == 'ar'
        ? arabicName!
        : englishName!;
  }

  static List<ServiceModel> generateEmpty(int number) =>
      List<ServiceModel>.generate(1000, (number) => ServiceModel.empty(true));

  factory ServiceModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceModelFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceModelToJson(this);

  static Map<String, dynamic> toMap(json) => _$ServiceModelToJson(json);

  bool get isActive => active == 'Y';

  ServiceModel.empty(isEmpty) {
    this.isEmpty = isEmpty;
  }

  @override
  List<Object?> get props =>
      [this.id, this.englishName, this.arabicName, this.active, this.category];
}
