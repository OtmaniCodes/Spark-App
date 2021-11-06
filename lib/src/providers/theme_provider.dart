import 'package:anas_cars/src/utils/constansts.dart';
import 'package:anas_cars/src/utils/palette.dart';

import 'package:flutter/material.dart';

class ThemeProv with ChangeNotifier {
  late ThemeData _theme;

  ThemeData defaultTheme = ThemeData(
    fontFamily: KFontFam,
    scaffoldBackgroundColor: KScaffoldClr,
    appBarTheme: AppBarTheme(
      elevation: 0.0,
      backgroundColor: Palette.kTransparentClr
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: InputBorder.none,
      hintStyle: TextStyle(
        color: Color(0xFF707070),
      ),
    ),
  );

  ThemeProv() {
    _theme = defaultTheme;
  }

  //getters
  ThemeData get getTheme => _theme;

  //setters
}
