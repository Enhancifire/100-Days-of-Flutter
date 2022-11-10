import 'package:flutter/material.dart';

class ThemeModel extends ChangeNotifier {
  bool _darkTheme = true;

  Color bg = Color(0xFF000000);
  Color text = Color(0xFFEEEEEE);
  Color highlightText = Color(0xFFEEEEEE);
  Color highlightRow = Color(0xFF404258);

  Color bgDark = Color(0xFFEFEFEF);
  Color textDark = Color(0xFF000000);
  Color highlightTextDark = Color(0xFFF66B0E);
  Color highlightRowDark = Color(0xFF112B3C);

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    notifyListeners();
  }
}
