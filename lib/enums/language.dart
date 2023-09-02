enum Language { arabic, english, unknown }

extension LanguageExtension on Language {
  int get value {
    switch (this) {
      case Language.arabic:
        return 1;
      case Language.english:
        return 2;
      default:
        return 2;
    }
  }

  String get code {
    switch (this) {
      case Language.arabic:
        return 'ar';
      case Language.english:
        return 'en';
      default:
        return 'en';
    }
  }

  String get display {
    switch (this) {
      case Language.arabic:
        return 'العربية';
      case Language.english:
        return 'English';
      default:
        return 'English';
    }
  }
}
