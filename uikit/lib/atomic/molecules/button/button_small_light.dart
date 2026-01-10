// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class ButtonSmallLight extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const ButtonSmallLight({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonDefault(
      padding: const EdgeInsets.all(SizeToken.xs),
      backgroundColor: ColorToken.neutral,
      onPressed: onPressed,
      child: TextLabelL2Dark(text: text),
    );
  }
}
