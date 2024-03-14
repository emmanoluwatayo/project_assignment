import 'package:flutter/material.dart';

class PsColors {
  PsColors._();

  ///
  /// Main Color
  ///
  static Color mainColor = const Color(0xff3498DB);
  static Color backgroundColor = const Color(0xff9395D3);
  static Color backgroundColor2 = const Color.fromARGB(255, 197, 197, 245);
  static Color greenColor = const Color(0xff00B761);
  static Color whiteColor = const Color(0xffFFFFFF);
  static Color blackColor = Colors.black;
  static Color redColor = Colors.red;



  //OLD TO CHANGE

  static MaterialColor primarySwatch = MaterialColor(
    0xFF005bbb, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: mainColor, //10%
      100: mainColor, //20%
      200: mainColor, //30%
      300: mainColor, //40%
      400: mainColor, //50%
      500: mainColor, //60%
      600: mainColor, //70%
      700: mainColor, //80%
      800: mainColor, //90%
      900: mainColor, //100%
    },
  );

  // static void loadColor(BuildContext context) {
  //   if (Utils.isLightMode(context)) {
  //     _loadLightColors();
  //   } else {
  //     _loadDarkColors();
  //   }
  // }

  static void loadColor2(bool isLightMode) {
    if (isLightMode) {
      _loadLightColors();
    } else {
      _loadDarkColors();
    }
  }

  static void _loadDarkColors() {
    ///
    /// Main Color
    ///
    mainColor = mainColor;
    whiteColor = Colors.white;
    blackColor = Colors.black;
  }

  static void _loadLightColors() {
    mainColor = mainColor;
    whiteColor = Colors.white;
    blackColor = Colors.black;
  }
}
