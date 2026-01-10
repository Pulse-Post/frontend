// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class MenuItem extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final double? paddinIcon;
  final String icon;
  const MenuItem({
    super.key,
    required this.text,
    this.onPressed,
    this.paddinIcon,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: SizeToken.sm,
        left: SizeToken.md,
        right: SizeToken.md,
      ),
      child: InkWell(
        onTap: onPressed,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: paddinIcon != null
                  ? EdgeInsets.symmetric(horizontal: paddinIcon!)
                  : EdgeInsets.zero,
              child: IconLargeDark(icon: icon),
            ),
            const SizedBox(
              width: SizeToken.xs,
            ),
            TextLabelL2Dark(text: text)
          ],
        ),
      ),
    );
  }
}
