import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:uikit/uikit.dart';

class ModalSheetQrCode extends StatelessWidget {
  final String iconBack;
  final String title;
  final String cancelText;
  final String continueText;
  final bool isLoading;
  final String linkQrCode;
  final void Function() continueOnTap;
  final void Function()? sufixOnTap;
  final String? sufixIcon;
  final GlobalKey repaintKey;

  const ModalSheetQrCode({
    super.key,
    required this.iconBack,
    required this.title,
    required this.cancelText,
    required this.continueText,
    required this.isLoading,
    required this.linkQrCode,
    required this.continueOnTap,
    required this.repaintKey,
    this.sufixOnTap,
    this.sufixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: SizeToken.sm,
          vertical: SizeToken.md,
        ),
        child: Wrap(
          children: [
            
            RepaintBoundary(
              key: repaintKey,
              child: Container(
                padding: const EdgeInsets.only(top: SizeToken.md, bottom: SizeToken.lg, left: SizeToken.md, right: SizeToken.sm,),
                color: ColorToken.light,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextHeadlineH1(text: title),
                    const SizedBox(height: SizeToken.xs),
                    QrImageView(
                      data: linkQrCode,
                      size: SizeToken.xl6,
                      version: QrVersions.auto,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: SizeToken.md,
                right: SizeToken.md,
                bottom: SizeToken.xl,
              ),
              child: InputCopy(
                hintText: linkQrCode,
                sufixOnTap: sufixOnTap,
                sufixIcon: sufixIcon,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ButtonCancel(
                    text: cancelText,
                    onPressed: () => context.pop(),
                  ),
                ),
                const SizedBox(width: SizeToken.sm),
                Expanded(
                  child: ButtonProgress(
                    key: const Key("confirm"),
                    isLoading: isLoading,
                    text: continueText,
                    onPressed: continueOnTap,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
