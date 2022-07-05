import 'package:flutter/material.dart';

class FlutterFlowTheme {
  static Color primaryColor = const Color(0xffc62828);

  static Color color2 = const Color(0xFFD74745);
  static Color color3 = const Color(0xFF515151);
  static Color color4 = const Color(0xFFD3D3D3);

  static TextStyle subtitle1 = const TextStyle(
    color: Color(0xFF3f3f3f),
    fontWeight: FontWeight.w500,
    fontSize: 18,
    fontFamily: 'Poppins',
  );

  static TextStyle subtitle2 = const TextStyle(
    color: Color(0xFFa9ada4),
    fontWeight: FontWeight.w400,
    fontSize: 12,
    fontFamily: 'Roboto',
  );

  static TextStyle title1 = const TextStyle(
    color: Color(0xFF3f3f3f),
    fontWeight: FontWeight.w600,
    fontSize: 24,
    fontFamily: 'Roboto',
  );

  static TextStyle bodyText1 = const TextStyle(
    color: Color(0xFF3f3f3f),
    fontWeight: FontWeight.w500,
    fontSize: 14,
    fontFamily: 'Roboto',
  );

  static TextStyle numero = const TextStyle(
    color: Color(0xFFD3D3D3),
    fontWeight: FontWeight.w500,
    fontSize: 14,
    fontFamily: 'Roboto',
  );
}

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}

MaterialColor createMaterialColor2(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};

  for (int i = 1; i <= 10; i++) {
    strengths.add(0.1 * i);
  }

  final int r = color.red, g = color.green, b = color.blue;

  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}
