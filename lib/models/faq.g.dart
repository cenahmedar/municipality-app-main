// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FAQ _$FAQFromJson(Map<String, dynamic> json) => FAQ(
      faqSeq: (json['faqSeq'] as num).toDouble(),
      answerText: json['answerText'] as String,
      answerTextEn: json['answerTextEn'] as String,
      questionTextEn: json['questionTextEn'] as String,
      questionText: json['questionText'] as String,
    );

Map<String, dynamic> _$FAQToJson(FAQ instance) => <String, dynamic>{
      'faqSeq': instance.faqSeq,
      'answerText': instance.answerText,
      'answerTextEn': instance.answerTextEn,
      'questionTextEn': instance.questionTextEn,
      'questionText': instance.questionText,
    };
