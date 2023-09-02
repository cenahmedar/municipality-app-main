import 'package:json_annotation/json_annotation.dart';
import 'package:municipality_app/main/main.dart';

part 'faq.g.dart';

@JsonSerializable()
class FAQ {
  @JsonKey(name: 'faqSeq')
  final double faqSeq;

  @JsonKey(name: 'answerText')
  final String answerText;
  @JsonKey(name: 'answerTextEn')
  final String answerTextEn;
  @JsonKey(name: 'questionTextEn')
  final String questionTextEn;
  @JsonKey(name: 'questionText')
  final String questionText;
  FAQ({
    required this.faqSeq,
    required this.answerText,
    required this.answerTextEn,
    required this.questionTextEn,
    required this.questionText,
  });

  factory FAQ.fromJson(Map<String, dynamic> json) => _$FAQFromJson(json);

  Map<String, dynamic> toJson() => _$FAQToJson(this);

  String getQuestion(context) {
    return MunicipalityApp.of(context)!.locale.languageCode == 'ar'
        ? questionText
        : questionTextEn;
  }

  String getAnswer(context) {
    return MunicipalityApp.of(context)!.locale.languageCode == 'ar'
        ? answerText
        : answerTextEn;
  }
}
