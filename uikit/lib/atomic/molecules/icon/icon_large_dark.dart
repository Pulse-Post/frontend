// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class IconLargeDark extends StatelessWidget {
  final void Function()? onTap;
  final String icon;
  final bool? isBackgroundColor;
  final bool? isNarrow;
  final double? padding;
  final String? count;

  const IconLargeDark({
    super.key,
    this.onTap,
    required this.icon,
    this.isBackgroundColor = false,
    this.isNarrow = false,
    this.padding,
    this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconDefault(
          padding: padding ?? (isNarrow != false ? SizeToken.xs : SizeToken.sm),
          onTap: onTap,
          icon: icon,
          height: 19,
          isBackgroundColor: isBackgroundColor,
          colorIcon: ColorToken.dark,
        ),
        Positioned(
          top: 0,
          right: 7,
          child: count != null
              ? TextLabelL5Info(text: count.toString())
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
