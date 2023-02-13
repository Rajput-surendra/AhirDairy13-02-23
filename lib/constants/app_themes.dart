import 'package:flutter/material.dart';

class AppThemes {
  AppThemes._();
  static const primaryColor = Color(0xffE7873B);

  static const Color lightGreyBackGroundColor = Color(0xffE8EFF1);
  static const Color lightTextFieldBackGroundColor = Color(0xfff5f5f5);
  static const Color lightButtonBackGroundColor = Color(0xffE7873B);
  static const Color lightWhiteBackGroundColor = Colors.white;
  static const Color lightTextColor = Colors.black;
  static const Color lightWhiteColor = Color(0xffffffff);
  static const Color lightBlackColor = Colors.black;
  static const Color DarkModeColor = Color.fromRGBO(18, 18, 18, 1);
  static const Color smoothBlack = Color.fromRGBO(41, 41, 41, 1);
  static const Color lightDeepOrangeAccentColor = Colors.deepOrangeAccent;
  static const Color lightAmountColor = Color(0xffE7873B);
  static const Color lightYellowColor = Color(0xfffedf8a);
  static const Color lightRedColor = Color(0xfff28b76);
  static const Color lightGreenColor = Color(0xffE7873B);
  static const Color lightBlueColor = Color(0xffE7873B);
  static const Color lightTextGreyColor = Color(0xffcacfd2);
  static const Color lightGreyColor = Color(0xff707b7c);
  static const Color lightGrey = Colors.grey;

  static ThemeData lightFontTheme = ThemeData(
    fontFamily: "Montserrat",
    textTheme: TextTheme(
      headline1: TextStyle(color: Colors.red),
    ),
  );
}
