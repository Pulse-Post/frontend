// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class IconSemiLargeSemiDark extends StatelessWidget {
  final void Function()? onTap;
  final String icon;
  final bool? isBackgroundColor;
  final double? padding;

  const IconSemiLargeSemiDark({
    super.key,
    this.onTap,
    required this.icon,
    this.isBackgroundColor = false,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return IconDefault(
      isBackgroundColor: isBackgroundColor,
      padding: padding ?? SizeToken.sm,
      onTap: onTap,
      icon: icon,
      height: 15,
      colorIcon: ColorToken.semiDark,
    );
  }
}
