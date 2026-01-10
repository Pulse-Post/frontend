// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class ImageDetail extends StatelessWidget {
  final String? image;
  final String iconLeft;
  final String? iconRigth;
  final String? iconDown;
  final void Function() onTapIconLeft;
  final void Function()? onTapIconRight;
  final void Function()? onTapIconDown;
  final Widget? widgetDown;

  final Widget? widgetLeft;
  final Widget? widgetRigth;
  const ImageDetail({
    super.key,
    this.image,
    required this.iconLeft,
    this.iconRigth,
    this.iconDown,
    required this.onTapIconLeft,
    this.onTapIconRight,
    this.onTapIconDown,
    this.widgetDown,
    this.widgetLeft,
    this.widgetRigth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.width,
          minWidth: double.infinity),
      child: Stack(
        children: [
          Image.network(
            image != null ? image! : '',
            fit: BoxFit.cover,
            width: double.infinity,
            height: MediaQuery.of(context).size.width,
          ),
          Positioned(
            top: SizeToken.xl3,
            right: SizeToken.md,
            left: SizeToken.md,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widgetLeft ??
                    IconButtonLargeDark(
                      onTap: onTapIconLeft,
                      icon: iconLeft,
                    ),
                widgetRigth ??
                    (iconRigth != null
                        ? IconButtonLargeDark(
                            onTap: onTapIconRight!,
                            icon: iconRigth!,
                          )
                        : const SizedBox.shrink()),
              ],
            ),
          ),
          Positioned(
            bottom: SizeToken.md,
            right: SizeToken.md,
            child: widgetDown ??
                (iconDown != null
                    ? IconButtonLargeDark(
                        onTap: onTapIconDown!,
                        icon: iconDown!,
                      )
                    : const SizedBox.shrink()),
          ),
        ],
      ),
    );
  }
}
