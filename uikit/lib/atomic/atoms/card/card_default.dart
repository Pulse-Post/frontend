// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:uikit/uikit.dart';

class CardDefault extends StatelessWidget {
  final void Function()? onTap;
  final Widget child;
  final bool isBoard;
  final double? borderRadius;
  final EdgeInsets? padding;
  const CardDefault({
    super.key,
    this.onTap,
    required this.child,
    this.borderRadius,
    this.isBoard = true,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(
        borderRadius != null ? borderRadius! : SizeToken.xs,
      ),
      onTap: onTap,
      child: Container(
        padding: padding ?? const EdgeInsets.all(SizeToken.sm),
        decoration: BoxDecoration(
          border:
              isBoard ? Border.all(color: ColorToken.semiDark, width: 1) : null,
          borderRadius: BorderRadius.circular(
            borderRadius != null ? borderRadius! : SizeToken.xs,
          ),
        ),
        child: child,
      ),
    );
  }
}
