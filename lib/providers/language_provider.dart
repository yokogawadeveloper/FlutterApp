import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  bool _isHindi = false;

  bool get isHindi => _isHindi;

  void toggleLanguage(bool value) {
    _isHindi = value;
    notifyListeners(); // Notifies all listening widgets to rebuild
  }
}
