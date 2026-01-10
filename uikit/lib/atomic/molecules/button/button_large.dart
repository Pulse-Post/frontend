// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class ButtonLarge extends StatelessWidget {
  final bool isLoading;
  final String text;
  final void Function()? onPressed;
  final String icon;
  const ButtonLarge({
    super.key,
    required this.text,
    this.onPressed,
    required this.icon,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ButtonDefault(
        isBorderRadio: false,
        padding: const EdgeInsets.symmetric(vertical: SizeToken.lg),
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
            : Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconLargeLigth(icon: icon),
                  TextLabelL1Light(text: text),
                ],
              ),
      ),
    );
  }
}
