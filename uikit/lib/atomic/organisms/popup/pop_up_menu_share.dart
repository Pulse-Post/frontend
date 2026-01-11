// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class PopUpMenuShare extends StatelessWidget {
  final Widget menuIcon;
  final String firstLabel;
  final String firstIcon;
  final void Function() firtOnTap;
  final String secoundLabel;
  final String secoundIcon;
  final void Function() secoundOnTap;

  const PopUpMenuShare({
    super.key,
    required this.menuIcon,
    required this.firstLabel,
    required this.firstIcon,
    required this.firtOnTap,
    required this.secoundLabel,
    required this.secoundIcon,
    required this.secoundOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return PopUpMenu(
      offset: const Offset(0, 60),
      menuPadding:
          const EdgeInsets.symmetric(horizontal: 0, vertical: SizeToken.xxs),
      maxWidth: 230,
      icon: menuIcon,
      menuList: [
        PopupMenuItem(
          onTap: firtOnTap,
          child: Row(
            children: [
              IconLargeDark(isNarrow: true, icon: firstIcon),
              TextLabelL3Dark(
                text: firstLabel,
              ),
            ],
          ),
        ),
        PopupMenuItem(
          enabled: false,
          height: 0,
          padding: EdgeInsets.zero,
          child: Container(
              padding: EdgeInsets.zero,
              width: double.infinity,
              child: const DividerDefault()),
        ),
        PopupMenuItem(
          onTap: secoundOnTap,
          child: Row(
            children: [
              IconLargeDark(isNarrow: true, icon: secoundIcon),
              TextLabelL3Dark(
                text: secoundLabel,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
