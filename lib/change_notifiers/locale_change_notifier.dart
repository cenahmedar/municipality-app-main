import 'dart:async';
import 'dart:ui';

import 'package:flutter/foundation.dart';

class LocaleChangeNotifier extends ChangeNotifier {
  StreamController<Locale> _localeController =
      StreamController<Locale>.broadcast();
  Stream<Locale> get locale => _localeController.stream;

  void setLocale(Locale locale) {
    _localeController.add(locale);
  }
}
