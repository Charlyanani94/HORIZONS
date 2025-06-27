import 'package:flutter/material.dart';

class LanguageProvider with ChangeNotifier {
  Locale _currentLocale = const Locale('fr', '');

  Locale get currentLocale => _currentLocale;

  void changeLanguage(Locale locale) {
    _currentLocale = locale;
    notifyListeners();
  }
}
