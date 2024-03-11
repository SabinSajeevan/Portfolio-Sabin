import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_sabin/constants/colors.dart';

class ThemeClass {
  Color lightPrimaryColor = const Color(0xffADD8E6);
  Color lightAccentColor = const Color(0xffFDE3DC);

  // Colors: Main Colors
  static const Color primaryColor = Color.fromRGBO(1, 159, 171, 1.0);
  static const Color secondaryColor = Color.fromRGBO(18, 18, 18, 1.0);

  Color darkPrimaryColor = const Color(0xffFDE3DC);

  // Colors: Text
  // static const textPrimary = primaryColor;
  static const textWhite = Color.fromRGBO(255, 255, 255, 1.0);
  static const textGreyDark = Color.fromRGBO(147, 147, 147, 1.0);
  static const textGreyLight = Color.fromRGBO(205, 205, 205, 1.0);
  static const textCursor = Color.fromRGBO(61, 61, 61, 1.0);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.light()
        .copyWith(primary: _themeClass.lightPrimaryColor),
    textTheme: GoogleFonts.sourceSans3TextTheme().copyWith(
        headlineSmall: const TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.w700,
            height: 1.2,
            color: textGreyDark),
        headlineMedium: const TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.w700,
            height: 1.2,
            color: textPrimary),
        headlineLarge: const TextStyle(
            fontWeight: FontWeight.bold,
            height: 1.2,
            fontSize: 46,
            color: textPrimary),
        bodyMedium: const TextStyle(
            fontSize: 18,
            color: textGreyDark,
            height: 1.8,
            fontWeight: FontWeight.w500),
        bodyLarge: const TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.w700,
            height: 1.2,
            color: textCursor)),

    scaffoldBackgroundColor: background,
    appBarTheme: const AppBarTheme(
        backgroundColor: background,
        surfaceTintColor: Colors.transparent,
        elevation: 10.0),
    // - - - - -Light Theme Elevated Button Styles - - - - -
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(
          const Size(double.infinity, 55),
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (states) => _themeClass.lightPrimaryColor),
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
          (_) {
            return const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)));
          },
        ),
        textStyle: MaterialStateProperty.resolveWith(
          (states) =>
              const TextStyle(fontWeight: FontWeight.normal, fontSize: 23),
        ),
        foregroundColor:
            MaterialStateProperty.all<Color>(Colors.white), //actual text color
      ),
    ),
    // - - - - - - - - - - - - - - -  - - - - -
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.dark()
        .copyWith(primary: _themeClass.darkPrimaryColor),

    // - - - - -Dark Theme Elevated Button Styles - - - - -
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(
          const Size(double.infinity, 55),
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (states) => _themeClass.lightPrimaryColor),
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
          (_) {
            return const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)));
          },
        ),
        textStyle: MaterialStateProperty.resolveWith(
          (states) =>
              const TextStyle(fontWeight: FontWeight.normal, fontSize: 23),
        ),
        foregroundColor:
            MaterialStateProperty.all<Color>(Colors.white), //actual text color
      ),
    ),
    // - - - - - - - - - - - - - - -  - - - - -

    textTheme: GoogleFonts.sourceSans3TextTheme().copyWith(
      displayMedium: const TextStyle(
        fontSize: 54.0,
        fontWeight: FontWeight.w700,
        color: textWhite,
      ),
      bodyLarge: const TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.w700,
          height: 1.2,
          color: textGreyLight),
      bodyMedium: const TextStyle(
          fontSize: 18,
          color: textGreyDark,
          height: 1.8,
          fontWeight: FontWeight.w500),
      displaySmall: const TextStyle(
          fontSize: 42.0, fontWeight: FontWeight.w700, color: textWhite),
      headlineSmall: const TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.w700,
          height: 1.2,
          color: textGreyDark),
      headlineMedium: const TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.w700,
          height: 1.2,
          color: textWhite),
      headlineLarge: const TextStyle(
          fontSize: 46,
          fontWeight: FontWeight.bold,
          height: 1.2,
          color: textWhite),
      titleLarge: const TextStyle(
          fontSize: 20.0, fontWeight: FontWeight.w500, color: textGreyDark),
      titleMedium: const TextStyle(
          fontSize: 18.0, fontWeight: FontWeight.w500, color: textWhite),
      titleSmall: const TextStyle(
          fontSize: 16.0, fontWeight: FontWeight.w400, color: textGreyLight),
      labelLarge: const TextStyle(
          fontSize: 14.0, fontWeight: FontWeight.w400, color: textGreyDark),
      labelMedium: const TextStyle(
          fontSize: 12.0, fontWeight: FontWeight.w500, color: textWhite),
    ),
  );
}

ThemeClass _themeClass = ThemeClass();
