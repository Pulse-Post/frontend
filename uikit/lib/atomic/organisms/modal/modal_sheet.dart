// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';
import 'package:go_router/go_router.dart';

class ModalSheet extends StatelessWidget {
  final String iconBack;
  final String title;
  final String description;
  final String? cancelText;
  final String? continueText;
  final bool isLoading;
  final void Function()? continueOnTap;
  const ModalSheet({
    super.key,
    required this.iconBack,
    required this.title,
    required this.description,
    this.cancelText,
    this.continueText,
    this.isLoading = false,
    this.continueOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: SizeToken.sm, vertical: SizeToken.md),
        child: Wrap(
          children: [
            Row(
              children: [
                IconButtonLargeDark(onTap: () => context.pop(), icon: iconBack),
                const SizedBox(
                  width: SizeToken.sm,
                ),
                Flexible(child: TextLabelL1Dark(text: title, ))
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.only(
                        top: SizeToken.sm, bottom: SizeToken.md),
                    child: TextBodyB1SemiDark(
                      text: description,
                    )),
              ],
            ),
            if (cancelText != null && continueText != null)
              Row(
                children: [
                  Expanded(
                      child: ButtonCancel(
                    text: cancelText!,
                    onPressed: () => context.pop(),
                  )),
                  const SizedBox(
                    width: SizeToken.sm,
                  ),
                  Expanded(
                    child: ButtonProgress(
                      key: const Key("confirm"),
                      isLoading: isLoading,
                      text: continueText!,
                      onPressed: continueOnTap,
                    ),
                  )
                ],
              )
          ],
        ),
      ),
    );
  }
}
