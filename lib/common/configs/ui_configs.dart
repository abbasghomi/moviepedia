import 'package:flutter/material.dart';

class UiConfigs {
  static FontWeight get boldFontWeight => FontWeight.w700;

  //colors
  static Color get pageBackColor => const Color(0xFF00172E);
  static Color get overviewTextColor => const Color(0xFF1e2141);
  static Color get progressBarColor => const Color(0xFF1cb06e);

  static int get primaryColor => 0xFF032541;

  static Color get whiteTextColor => Colors.white;

  static Map<int, Color> colorSwatch =
  {
    50:const Color.fromRGBO(3,37,65, .1),
    100:const Color.fromRGBO(3,37,65, .2),
    200:const Color.fromRGBO(3,37,65, .3),
    300:const Color.fromRGBO(3,37,65, .4),
    400:const Color.fromRGBO(3,37,65, .5),
    500:const Color.fromRGBO(3,37,65, .6),
    600:const Color.fromRGBO(3,37,65, .7),
    700:const Color.fromRGBO(3,37,65, .8),
    800:const Color.fromRGBO(3,37,65, .9),
    900:const Color.fromRGBO(3,37,65, 1),
  };

  static TextStyle get defaultTextStyle => TextStyle(
        color: whiteTextColor,
        fontSize: 16.0,
        fontWeight: boldFontWeight,
      );

  static TextStyle get defaultTextStyle2 => TextStyle(
    color: whiteTextColor,
    fontSize: 14.0,
    fontWeight: boldFontWeight,
  );
}
