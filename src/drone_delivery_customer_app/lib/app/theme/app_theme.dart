import 'package:flutter/material.dart';

class AppTextTheme {
  late TextStyle txt12grey;
  late TextStyle txt18grey;
  late TextStyle txt24grey;
  late TextStyle txt40primary;
  late TextStyle txt40white;

  AppTextTheme.lightTheme() {
    this.txt12grey =
        TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 12);
    this.txt18grey =
        TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 18);
    this.txt24grey =
        TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 24);
    this.txt40primary = TextStyle(fontSize: 40, color: Color(0xFFA85CF9));
    this.txt40white =
        TextStyle(fontSize: 40, color: Color.fromARGB(255, 255, 255, 255));
  }

  AppTextTheme.darkTheme() {}
}

class AppColorTheme {
  late Color colorBackground;
  late Color primaryColor;
  late Color secondaryColor;
  late Color colorGrey;
  late Color colorWhite;
  late Color colorBlack;
  late Color shadowColor1;
  late BoxShadow shadowMild;
  late BoxShadow shadowMedium;
  late BoxShadow shadowMediumUp;

  AppColorTheme.darkTheme() {}

  AppColorTheme.lightTheme() {
    colorBlack = Color.fromARGB(255, 0, 0, 0);
    colorBackground = Color(0xFFA85CF9);
    primaryColor = Color(0xFFA85CF9);
    secondaryColor = Color.fromRGBO(108, 219, 251, 1);
    colorGrey = Color.fromARGB(255, 212, 212, 212);
    colorWhite = Color(0xFFFFFFFF);
    shadowColor1 = Color(0x20616161);
    shadowMild = BoxShadow(
        offset: Offset(2, 2),
        blurRadius: 10,
        spreadRadius: 2,
        color: shadowColor1.withOpacity(0.04));
    shadowMedium = BoxShadow(
        offset: Offset(1, 1),
        blurRadius: 2,
        spreadRadius: 2,
        color: shadowColor1);
    shadowMediumUp = BoxShadow(
        offset: Offset(-2, -2),
        blurRadius: 10,
        spreadRadius: 10,
        color: shadowColor1);
  }
}

class AppSvgImages {
  AppSvgImages.lightTheme() {}

  AppSvgImages.darkTheme() {}

  String getAnImage(int index) {
    return "Implement Here";
  }
}

class AppPngImages {
  String getWeatherIcon(String weatherIcon) {
    return "Implement Here";
  }
}

class AppTheme {
  static late AppTextTheme appTextTheme;
  static late AppColorTheme appColorTheme;
  static late AppSvgImages appSvgImages;
  static late AppPngImages appPngImages;
  AppTheme.lightTheme() {
    appSvgImages = AppSvgImages.lightTheme();
    appColorTheme = AppColorTheme.lightTheme();
    appTextTheme = AppTextTheme.lightTheme();
    appPngImages = AppPngImages();
  }
  AppTheme.darkTheme() {
    appSvgImages = AppSvgImages.darkTheme();
    appTextTheme = AppTextTheme.darkTheme();
    appColorTheme = AppColorTheme.darkTheme();
    appPngImages = AppPngImages();
  }
}
