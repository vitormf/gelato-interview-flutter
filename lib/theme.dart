import 'package:flutter/material.dart';

class GelatoPhotosTheme {
  static ThemeData get themeData {
    final themeData = ThemeData();
    return themeData.copyWith(
      colorScheme: themeData.colorScheme.copyWith(
          primary: Colors.pink.shade400,
          secondary: Colors.purple.shade400,
          background: Colors.black,
          onBackground: Colors.white),
      scaffoldBackgroundColor: Colors.black,
      splashColor: Colors.purple.shade400.withAlpha(100),
    );
  }
}
