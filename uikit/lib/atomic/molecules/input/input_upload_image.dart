// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class InputUploadImage extends StatelessWidget {
  final void Function() onTap;
  final String labelText;
  final String hintText;
  final String icon;
  final File? image;
  final String? imageNetwork;
  const InputUploadImage({
    super.key,
    required this.onTap,
    required this.labelText,
    required this.hintText,
    required this.icon,
    this.image, 
    this.imageNetwork,
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
              child: image != null
                  ? Stack(
                      children: [
                        Image.file(
                          File(image!.path),
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
                  : imageNetwork != null?
                  Stack(
                      children: [
                        Image.network(
                          imageNetwork!,
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
                    ): Row(
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
