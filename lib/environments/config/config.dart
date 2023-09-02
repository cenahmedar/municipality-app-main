import 'package:json_annotation/json_annotation.dart';

part 'config.g.dart';

@JsonSerializable()
class Config {
  Config({
    this.env,
    this.production,
    this.baseUrl,
    this.primaryColor,
    this.secondaryColor,
    this.logo,
    this.backgroundColor,
    this.textColor,
    this.logoRatio,
    this.termsConditionsUrl,
    this.privacyPolicyUrl,
    this.supportAddress,
    this.supportPhoneNumber,
    this.supportEmail,
    this.privacyPolicyEn,
    this.termsAndConditionsEn,
    this.privacyPolicyAr,
    this.termsAndConditionsAr,
    this.supportFaxNumber,
  });

  static Config? instance = new Config();

  factory Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);

  String getTermsAndConditions(String languageCode) {
    return languageCode == 'ar' ? termsAndConditionsAr! : termsAndConditionsEn!;
  }

  String getPrivacyPolicy(languageCode) {
    return languageCode == 'ar' ? privacyPolicyAr! : privacyPolicyEn!;
  }

  final String? env;
  final bool? production;
  @JsonKey(name: "base_url")
  final String? baseUrl;
  @JsonKey(name: "primary_color")
  final String? primaryColor;
  @JsonKey(name: "secondary_color")
  final String? secondaryColor;
  final String? logo;
  @JsonKey(name: "logo_ratio")
  final double? logoRatio;
  @JsonKey(name: "background_color")
  final String? backgroundColor;
  @JsonKey(name: "text_color")
  final String? textColor;
  @JsonKey(name: "terms_conditions_url")
  final String? termsConditionsUrl;
  @JsonKey(name: "privacy_policy_url")
  final String? privacyPolicyUrl;
  @JsonKey(name: "support_phone_number")
  final String? supportPhoneNumber;
  @JsonKey(name: "support_fax_number")
  final String? supportFaxNumber;
  @JsonKey(name: "support_address")
  final String? supportAddress;
  @JsonKey(name: "support_email")
  final String? supportEmail;
  @JsonKey(name: "privacy_policy_ar")
  final String? privacyPolicyAr;
  @JsonKey(name: "terms_and_conditions_ar")
  final String? termsAndConditionsAr;
  @JsonKey(name: "privacy_policy_en")
  final String? privacyPolicyEn;
  @JsonKey(name: "terms_and_conditions_en")
  final String? termsAndConditionsEn;
}

class FlavorConfig {
  final Config config;
  static FlavorConfig? _instance;

  factory FlavorConfig({required Config config}) {
    _instance ??= FlavorConfig._internal(config);
    return _instance ?? FlavorConfig(config: Config());
  }

  FlavorConfig._internal(this.config);
  static FlavorConfig? get instance {
    return _instance;
  }
}
