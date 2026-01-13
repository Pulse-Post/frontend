// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class ButtonProgress extends StatelessWidget {
  final String text;
  final bool isLoading;
  final void Function()? onPressed;
  const ButtonProgress({
    super.key,
    required this.text,
    required this.isLoading,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonDefault(
      padding: const EdgeInsets.symmetric(vertical: SizeToken.md),
      backgroundColor: ColorToken.danger,
      onPressed: onPressed,
      child: isLoading
          ? const SizedBox(
              height: SizeToken.lg,
              width: SizeToken.lg,
              child: CircularProgressIndicator(
                color: ColorToken.light,
              ),
            )
          : TextLabelL1Light(
              text: text,
            ),
    );
  }
}
