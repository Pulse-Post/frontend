// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uikit/uikit.dart';

class ModalSheet extends StatelessWidget {
  final String? iconBack;
  final String? title;
  final String? description;
  final String? cancelText;
  final String? continueText;
  final bool isLoading;
  final void Function()? continueOnTap;
  final void Function()? cancelcontinueOnTap;

  const ModalSheet({
    super.key,
    this.iconBack,
    this.title,
    this.description,
    this.cancelText,
    this.continueText,
    this.isLoading = false,
    this.continueOnTap,
    this.cancelcontinueOnTap,
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
                if(iconBack != null)
                IconButtonLargeDark(onTap: () => context.pop(), icon: iconBack.toString()),
                const SizedBox(
                  width: SizeToken.sm,
                ),
                if (title != null)
                  Flexible(
                      child: TextLabelL1Dark(
                    text: title.toString(),
                  ))
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (description != null)
                  Padding(
                      padding: const EdgeInsets.only(
                          top: SizeToken.sm, bottom: SizeToken.md),
                      child: TextBodyB1SemiDark(
                        text: description.toString(),
                      )),
              ],
            ),
            if (cancelText != null && continueText != null)
              Row(
                children: [
                  Expanded(
                      child: ButtonCancel(
                    text: cancelText!,
                    onPressed: cancelcontinueOnTap ?? () => context.pop(),
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
