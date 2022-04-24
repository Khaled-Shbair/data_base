import 'package:data_base/pref/shared_preference.dart';
import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  String language = SharedPrefController().language;

  void changeLanguage() {
    language = language == 'en' ? 'ar' : 'en';
    SharedPrefController().changeLanguage(language);
    notifyListeners();
  }
}
