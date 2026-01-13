import 'package:flutter/material.dart';

final class ColorToken {
  static const Color primary = Color(0xffFF00A6);
  static const Color secundary = Color(0xffFFC100);
  static const Color danger = Color(0xffFE0019);
  static const Color dark = Color(0xff0f0f0f);
  static const Color semiDark = Color(0xff8f959e);
  static const Color neutral = Color(0xfff5f6fa);
  static const Color light = Color(0xfffefefe);
  static const Color success = Color(0xff38b257);

  static String colorToHex(Color color) {
    return '#${color.toARGB32().toRadixString(16).padLeft(6, '0').toUpperCase().substring(2)}';
  }
}
