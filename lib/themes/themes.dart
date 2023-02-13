import 'package:flutter/material.dart';
import 'package:milk/constants/app_themes.dart';
import 'package:milk/constants/constants.dart';

class MyTheme {
  static final darkTheme = ThemeData(
    fontFamily: "Montserrat",
    primaryColor: AppThemes.lightWhiteColor,
    navigationBarTheme:
        const NavigationBarThemeData(backgroundColor: Colors.black),
    brightness: Brightness.dark,
    primaryTextTheme: Typography(platform: TargetPlatform.android).white,
    textTheme: TextTheme(
      headline1: TextStyle(color: Colors.white),
    ),
    scaffoldBackgroundColor: AppThemes.DarkModeColor,
    dividerTheme: const DividerThemeData(color: Colors.transparent),
    iconTheme: const IconThemeData(color: AppThemes.lightGreyColor),
    inputDecorationTheme:
        InputDecorationTheme(fillColor: AppThemes.smoothBlack),
  );
  static final lightTheme = ThemeData(
    fontFamily: "Montserrat",
    textTheme: TextTheme(
      headline1: TextStyle(color: Colors.red),
    ),
    primaryColor: AppThemes.primaryColor,
    brightness: Brightness.light,
    iconTheme: const IconThemeData(color: AppThemes.lightBlackColor),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppThemes.lightTextFieldBackGroundColor,
    ),
    // buttonTheme: const ButtonThemeData(
    //     textTheme: ButtonTextTheme.primary, buttonColor: ColorUtil.whiteColor),
    // textTheme: Typography(platform: TargetPlatform.android).black,
    scaffoldBackgroundColor: AppThemes.lightTextFieldBackGroundColor,
  );
}
