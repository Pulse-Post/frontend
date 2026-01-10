// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:uikit/uikit.dart';
import 'package:flutter/material.dart';

class ButtonCancel extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const ButtonCancel({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonDefault(
      padding: const EdgeInsets.symmetric(vertical: SizeToken.md),
      backgroundColor: ColorToken.neutral,
      onPressed: onPressed,
      child: TextLabelL1Dark(text: text),
    );
  }
}
