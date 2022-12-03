import 'package:flutter/material.dart';

class CColors{
  static Color primary = const Color(0xffF52A81);
  static Color red = const Color(0xffFF0000);
  static Color editBg = const Color(0xffD9D9D9);
  static Color textRed = const Color(0xffF52A81);
  static Color text = Colors.grey;
  static Color textGrey = const Color(0xff5E5E5E);
  static Color bCon = const Color(0xffD9D9D9);
  static Color conBg = const Color(0xffF2F2F2);
  static Color textG = const Color(0xff616161);
  static Color textGreyCalender = const Color(0xffB3B3B3);
  static Color weeks = const Color(0xff17A1FA);
  static Color textBlack = const Color(0xff5E5E5E);
  static Color textPrice = const Color(0xff989898);
  static Color textGreen = const Color(0xff07D30F);
  static Color green = const Color(0xff00BA29);
  static Color textYellow = Colors.yellow;
  static Color containerYellow = const Color(0xffF5DF13);
  static Color textBold = Colors.black;
  static Color iconBackground = Colors.yellow;
  static Color businessCoverBackground = const Color(0xff9E9E9E);
  static Color buttonFill = Colors.pink;
  static Color bottomNavSelected = Colors.yellow;
  static Color bottomNavUnselected = Colors.black;
  static Color priceText = Colors.yellow;
  static Color textFieldFill = const Color(0xffEDEDED);
  static Color textFieldStroke = Colors.transparent;
  static Color fieldText = const Color(0xff606060);
  static Color fieldGrey = const Color(0xffF2F2F2);
  static Color buttonText = const Color(0xffFFFFFF);
  static Color pinkText = const Color(0xffF52A81);
  static Color orangeText = const Color(0xffFF7D27);
  static Color profileText = const Color(0xff333333);


  static Map<int, Color> getSwatch(Color color) {
    final hslColor = HSLColor.fromColor(color);
    final lightness = hslColor.lightness;
    final lowDivisor = 6;
    final highDivisor = 5;
    final lowStep = (1.0 - lightness) / lowDivisor;
    final highStep = lightness / highDivisor;
    return {
      50: (hslColor.withLightness(lightness + (lowStep * 5))).toColor(),
      100: (hslColor.withLightness(lightness + (lowStep * 4))).toColor(),
      200: (hslColor.withLightness(lightness + (lowStep * 3))).toColor(),
      300: (hslColor.withLightness(lightness + (lowStep * 2))).toColor(),
      400: (hslColor.withLightness(lightness + lowStep)).toColor(),
      500: (hslColor.withLightness(lightness)).toColor(),
      600: (hslColor.withLightness(lightness - highStep)).toColor(),
      700: (hslColor.withLightness(lightness - (highStep * 2))).toColor(),
      800: (hslColor.withLightness(lightness - (highStep * 3))).toColor(),
      900: (hslColor.withLightness(lightness - (highStep * 4))).toColor(),
    };
  }
  // new

  static Color businessCardColor = Color(0xffF9F9F9);


}