// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class IconLargeLigth extends StatelessWidget {
  final void Function()? onTap;
  final String icon;
  final bool? isBackgroundColor;

  const IconLargeLigth({
    super.key,
    this.onTap,
    required this.icon,
    this.isBackgroundColor = false,
  });

  @override
  Widget build(BuildContext context) {
    return IconDefault(
      padding: SizeToken.xxs,
      onTap: onTap,
      icon: icon,
      height: 19,
      isBackgroundColor: isBackgroundColor,
      colorIcon: ColorToken.light,
    );
  }
}
