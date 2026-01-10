// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class IconButtonLargeLight extends StatelessWidget {
  final void Function() onTap;
  final String icon;
  final bool? isBackgroundColor;
  final Color? backgroundColor;
  final bool isSquareBorderRadius;

  const IconButtonLargeLight({
    super.key,
    required this.onTap,
    required this.icon,
    this.isBackgroundColor = true,
    this.backgroundColor,
    this.isSquareBorderRadius = false,
  });

  @override
  Widget build(BuildContext context) {
    return IconDefault(
      borderRadius: isSquareBorderRadius ? SizeToken.xs : null,
      backgroundColor: backgroundColor,
      padding: SizeToken.sm,
      onTap: onTap,
      isBackgroundColor: isBackgroundColor,
      icon: icon,
      height: 19,
      colorIcon: ColorToken.light,
    );
  }
}
