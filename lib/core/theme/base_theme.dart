import 'package:flutter/material.dart';

abstract class BaseTheme {
  ThemeData get themeData;

  Color get primaryColor;
  Color get backgroundColor;
  Color get buttonPrimaryColor;
  Color get buttonSecondaryColor;
  Color get primaryTextColor;
  Color get secondaryTextColor;

  TextStyle get headlineStyle;
  TextStyle get bodyStyle;
  TextStyle get buttonTextStyle;

  InputDecoration get textFieldDecoration;
  ButtonStyle get buttonStyle;
}
