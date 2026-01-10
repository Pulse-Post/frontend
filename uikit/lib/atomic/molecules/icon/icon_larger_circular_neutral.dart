// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class IconLargerCircularNeutral extends StatelessWidget {
  final String icon;
  final double? padding;
  const IconLargerCircularNeutral({
    super.key,
    required this.icon,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return IconDefault(
      padding:  SizeToken.sm,
      isBackgroundColor: true,
      icon: icon,
      height: 19,
      colorIcon: ColorToken.dark,
    );
  }
}
