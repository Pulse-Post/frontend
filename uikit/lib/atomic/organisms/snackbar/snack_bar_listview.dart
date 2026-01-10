// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class SnackBarListview extends SnackBar {
  final String title;
  final String subtitle;
  final String iconLeading;
  final String iconTrailing;
  final BuildContext context;
  final bool isSuccess;

  SnackBarListview({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconLeading,
    required this.iconTrailing,
    required this.context,
    this.isSuccess = true,
  }) : super(
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SizeToken.xs),
          ),
          dismissDirection: DismissDirection.up,
          duration: const Duration(seconds: 8),
          backgroundColor: ColorToken.light,
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height - 200,
            left: SizeToken.md,
            right: SizeToken.md,
          ),
          behavior: SnackBarBehavior.floating,
          content: Container(
            padding: const EdgeInsets.symmetric(horizontal: SizeToken.sm),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(SizeToken.xs),
                color: ColorToken.light,
                border: Border.all(color: ColorToken.neutral, width: 1.5)),
            child: ListTile(
              minVerticalPadding: 0,
              contentPadding: EdgeInsets.zero,
              title: TextLabelL1Dark(text: title),
              subtitle: TextBodyB2Dark(
                text: subtitle,
                overflow: true,
              ),
              leading: isSuccess
                  ? IconLargerCircularSuccess(icon: iconLeading)
                  : IconLargerCircularDanger(
                      icon: iconLeading,
                    ),
              trailing: IconButtonMediumDark(
                isBackgroundColor: false,
                onTap: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                },
                key: const Key('messageButton'),
                icon: iconTrailing,
              ),
            ),
          ),
        );
}
