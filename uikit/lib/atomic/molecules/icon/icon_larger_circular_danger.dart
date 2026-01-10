// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class IconLargerCircularDanger extends StatelessWidget {
  final String icon;
  final double? padding;
  const IconLargerCircularDanger({
    super.key,
    required this.icon,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeToken.xl3,
      width: SizeToken.xl3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeToken.xl3),
        color: ColorToken.danger,
      ),
      child: IconDefault(
         icon: icon, height: 19, colorIcon: ColorToken.light),
    );
  }
}
