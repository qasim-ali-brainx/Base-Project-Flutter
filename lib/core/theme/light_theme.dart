


import 'package:flutter/material.dart';
import '../constants/theme_constants.dart';
import '../constants/view_constants.dart';
import 'base_theme.dart';

class LightTheme extends BaseTheme {
  @override
  Color get backgroundColor => const Color.fromARGB(255, 249, 249, 254);

  @override
  TextStyle get bodyStyle => TextStyle(
        fontSize: ThemeConstants.font14Px,
        color: primaryTextColor,
        fontWeight: FontWeight.w400,
      );

  @override
  Color get buttonPrimaryColor => const Color.fromARGB(255, 49, 25, 107);

  @override
  Color get buttonSecondaryColor => const Color.fromARGB(255, 72, 17, 201);

  @override
  ButtonStyle get buttonStyle => ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ViewConstants.radius12x),
        ),
      );

  @override
  TextStyle get buttonTextStyle => TextStyle(
        fontSize: ThemeConstants.font14Px,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      );

  @override
  TextStyle get headlineStyle => TextStyle(
        fontSize: ThemeConstants.font16Px,
        color: primaryTextColor,
        fontWeight: FontWeight.w700,
      );

  @override
  Color get primaryColor => const Color.fromARGB(255, 28, 79, 167);

  @override
  Color get primaryTextColor => Colors.black;

  @override
  InputDecoration get textFieldDecoration => InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(ViewConstants.radius12x),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(ViewConstants.radius12x),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(ViewConstants.radius12x),
        ),
        filled: true,
        fillColor: Colors.white,
        hintStyle: TextStyle(color: Colors.grey),
        labelStyle: TextStyle(color: Colors.grey),
      );

  @override
  ThemeData get themeData => ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        fontFamily: ThemeConstants.fontFamily,
        scaffoldBackgroundColor: backgroundColor,
        textTheme: TextTheme(
          headlineLarge: headlineStyle,
          bodyMedium: bodyStyle,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: buttonStyle,
        ),
      );

  @override
  Color get secondaryTextColor => Colors.grey;
}
