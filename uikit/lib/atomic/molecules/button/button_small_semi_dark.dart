// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class ButtonSmallSemiDark extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const ButtonSmallSemiDark({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonDefault(
      padding: const EdgeInsets.all(SizeToken.xs),
      backgroundColor: ColorToken.semiDark,
      onPressed: onPressed,
      child: TextLabelL2Light(text: text),
    );
  }
}
