import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class CustomTheme extends ChangeNotifier {
  static bool _isDarkTheme = true;
  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.light : ThemeMode.dark;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  static ThemeData get lightTheme {
    //1
    return ThemeData(
        //2
        primarySwatch: Colors.amber,
        primaryColor: Colors.yellow,
        primaryColorLight: Colors.yellow,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Prompt',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline1: GoogleFonts.prompt(
                  fontSize: 106,
                  fontWeight: FontWeight.w300,
                  letterSpacing: -1.5),
              headline2: GoogleFonts.prompt(
                  fontSize: 66,
                  fontWeight: FontWeight.w300,
                  letterSpacing: -0.5),
              headline3:
                  GoogleFonts.prompt(fontSize: 53, fontWeight: FontWeight.w400),
              headline4: GoogleFonts.prompt(
                  fontSize: 38,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.25),
              headline5:
                  GoogleFonts.prompt(fontSize: 27, fontWeight: FontWeight.w400),
              headline6: GoogleFonts.prompt(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.15),
              subtitle1: GoogleFonts.prompt(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.15),
              subtitle2: GoogleFonts.prompt(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.1),
              bodyText1: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.5),
              bodyText2: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.25),
              button: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.25),
              caption: GoogleFonts.roboto(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.4),
              overline: GoogleFonts.roboto(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.5),
            ), //3
        buttonTheme: ButtonThemeData(
          // 4
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: CustomColors.yellowBrown,
        ));
  }

  static ThemeData get darkTheme {
    return ThemeData(
        primaryColor: Colors.yellow,
        scaffoldBackgroundColor: Colors.black,
        fontFamily: 'Prompt',
        textTheme: ThemeData.dark().textTheme.copyWith(
              headline1: GoogleFonts.prompt(
                  fontSize: 106,
                  fontWeight: FontWeight.w300,
                  letterSpacing: -1.5),
              headline2: GoogleFonts.prompt(
                  fontSize: 66,
                  fontWeight: FontWeight.w300,
                  letterSpacing: -0.5),
              headline3:
                  GoogleFonts.prompt(fontSize: 53, fontWeight: FontWeight.w400),
              headline4: GoogleFonts.prompt(
                  fontSize: 38,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.25),
              headline5:
                  GoogleFonts.prompt(fontSize: 27, fontWeight: FontWeight.w400),
              headline6: GoogleFonts.prompt(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.15),
              subtitle1: GoogleFonts.prompt(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.15),
              subtitle2: GoogleFonts.prompt(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.1),
              bodyText1: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.5),
              bodyText2: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.25),
              button: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.25),
              caption: GoogleFonts.roboto(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.4),
              overline: GoogleFonts.roboto(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.5),
            ),
        buttonTheme: ButtonThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: CustomColors.lightGrey,
        ));
  }
}
