import 'package:flutter/material.dart';
import 'dart:math' as math;

class Colorutil {
  static Color getRandomColor([int? seed]) {
    return Color((math.Random(seed).nextDouble() * 0xFFFFFF).toInt())
        .withOpacity(1.0);
  }
}
