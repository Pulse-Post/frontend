// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uikit/tokens/token.dart';

class IconDefault extends StatelessWidget {
  final String icon;
  final double height;
  final Color colorIcon;
  final double padding;
  final double? borderRadius;
  final bool? isBackgroundColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  const IconDefault({
    super.key,
    required this.icon,
    required this.height,
    required this.colorIcon,
    this.padding = SizeToken.sm,
    this.borderRadius,
    this.isBackgroundColor = false,
    this.backgroundColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      radius: padding != 0 ? SizeToken.xl3 : 0,
      child: Container(
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius != null
              ? borderRadius!
              : padding != 0
                  ? SizeToken.xl3
                  : 0),
          color: isBackgroundColor != false
              ? backgroundColor ?? ColorToken.neutral
              : null,
        ),
        child: SvgPicture.asset(
          icon,
          height: height,
          colorFilter: ColorFilter.mode(colorIcon, BlendMode.srcIn),
        ),
      ),
    );
  }
}
