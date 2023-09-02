import 'package:json_annotation/json_annotation.dart';
import 'package:municipality_app/main/main.dart';

part 'service_category.g.dart';

@JsonSerializable()
class ServiceCategory {
  @JsonKey(name: "eCatName")
  final String english;

  @JsonKey(name: "aCatName")
  final String arabic;

  ServiceCategory(this.english, this.arabic);

  String getName(context) {
    return MunicipalityApp.of(context)!.locale.languageCode == 'ar'
        ? arabic
        : english;
  }

  factory ServiceCategory.fromJson(Map<String, dynamic> json) =>
      _$ServiceCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceCategoryToJson(this);

  static Map<String, dynamic> toMap(json) => _$ServiceCategoryToJson(json);
}
