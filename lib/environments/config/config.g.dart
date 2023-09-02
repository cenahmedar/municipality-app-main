// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Config _$ConfigFromJson(Map<String, dynamic> json) => Config(
      env: json['env'] as String?,
      production: json['production'] as bool?,
      baseUrl: json['base_url'] as String?,
      primaryColor: json['primary_color'] as String?,
      secondaryColor: json['secondary_color'] as String?,
      logo: json['logo'] as String?,
      backgroundColor: json['background_color'] as String?,
      textColor: json['text_color'] as String?,
      logoRatio: (json['logo_ratio'] as num?)?.toDouble(),
      termsConditionsUrl: json['terms_conditions_url'] as String?,
      privacyPolicyUrl: json['privacy_policy_url'] as String?,
      supportAddress: json['support_address'] as String?,
      supportPhoneNumber: json['support_phone_number'] as String?,
      supportEmail: json['support_email'] as String?,
      privacyPolicyEn: json['privacy_policy_en'] as String?,
      termsAndConditionsEn: json['terms_and_conditions_en'] as String?,
      privacyPolicyAr: json['privacy_policy_ar'] as String?,
      termsAndConditionsAr: json['terms_and_conditions_ar'] as String?,
      supportFaxNumber: json['support_fax_number'] as String?,
    );

Map<String, dynamic> _$ConfigToJson(Config instance) => <String, dynamic>{
      'env': instance.env,
      'production': instance.production,
      'base_url': instance.baseUrl,
      'primary_color': instance.primaryColor,
      'secondary_color': instance.secondaryColor,
      'logo': instance.logo,
      'logo_ratio': instance.logoRatio,
      'background_color': instance.backgroundColor,
      'text_color': instance.textColor,
      'terms_conditions_url': instance.termsConditionsUrl,
      'privacy_policy_url': instance.privacyPolicyUrl,
      'support_phone_number': instance.supportPhoneNumber,
      'support_fax_number': instance.supportFaxNumber,
      'support_address': instance.supportAddress,
      'support_email': instance.supportEmail,
      'privacy_policy_ar': instance.privacyPolicyAr,
      'terms_and_conditions_ar': instance.termsAndConditionsAr,
      'privacy_policy_en': instance.privacyPolicyEn,
      'terms_and_conditions_en': instance.termsAndConditionsEn,
    };
