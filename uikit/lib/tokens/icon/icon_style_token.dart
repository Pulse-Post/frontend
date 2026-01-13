import 'package:flutter/material.dart';
import 'package:uikit/tokens/token.dart';

final class IconStyleToken {
  static Icon largeDark(IconData iconData) => Icon(
        iconData,
        size: 19,
        color: ColorToken.dark,
      );


  static Icon largeLight(IconData iconData) => Icon(
        iconData,
        size: 19,
        color: ColorToken.dark,
  );

  static Icon smallDark(IconData iconData) => Icon(
        iconData,
        size: 13,
        color: ColorToken.dark,
      );

  static Icon smallSemiDark(IconData iconData) => Icon(
        iconData,
        size: 13,
        color: ColorToken.semiDark,
      );
}
