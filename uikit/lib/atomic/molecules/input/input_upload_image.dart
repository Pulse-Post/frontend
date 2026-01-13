// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class InputUploadMedia extends StatelessWidget {
  final void Function() onTap;
  final String labelText;
  final String hintText;
  final String icon;
  final bool isVideo;
  final File? file;
  final String? fileUrl;
  const InputUploadMedia({
    super.key,
    required this.onTap,
    required this.labelText,
    required this.hintText,
    required this.icon,
    required this.isVideo,
    this.file,
    this.fileUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextLabelL1Dark(text: labelText),
        const SizedBox(
          height: SizeToken.xs,
        ),
        InkWell(
          onTap: onTap,
          child: DottedBorder(
            color: ColorToken.semiDark,
            strokeWidth: 1,
            dashPattern: const [6, 3],
            child: Container(
              height: 120,
              color: ColorToken.neutral,
              width: double.infinity,
              child: file != null
                  ? Stack(
                      children: [
                        isVideo
                            ? VideoPreview(
                                file: file,
                              )
                            : Image.file(
                                File(file!.path),
                                height: 120,
                                width: double.infinity,
                                fit: BoxFit.contain,
                              ),
                        Positioned(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconSemiLargeSemiDark(
                                    icon: icon,
                                    padding: SizeToken.xxs,
                                  ),
                                  TextLabelL3SemiDark(
                                    text: hintText,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : fileUrl != null
                      ? Stack(
                          children: [
                            isVideo
                                ? VideoPreview(
                                    videoUrl: fileUrl,
                                  )
                                : Image.network(
                                    fileUrl!,
                                    height: 120,
                                    width: double.infinity,
                                    fit: BoxFit.contain,
                                  ),
                            Positioned(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      IconSemiLargeSemiDark(
                                        icon: icon,
                                        padding: SizeToken.xxs,
                                      ),
                                      TextLabelL3SemiDark(
                                        text: hintText,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconSemiLargeSemiDark(
                              icon: icon,
                              padding: SizeToken.xxs,
                            ),
                            TextLabelL3SemiDark(
                              text: hintText,
                            ),
                          ],
                        ),
            ),
          ),
        ),
      ],
    );
  }
}
