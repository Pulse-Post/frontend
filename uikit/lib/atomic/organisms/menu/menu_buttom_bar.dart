// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:uikit/tokens/token.dart';

class MenuButtomBar extends StatelessWidget {
  final Icon firstIcon;
  final Icon secoundIcon;
  final Icon thirdIcon;
  final String firstLabel;
  final String secoundLabel;
  final String thirdLabel;
  final int? courrentIndex;
  const MenuButtomBar({
    super.key,
    required this.firstIcon,
    required this.secoundIcon,
    required this.thirdIcon,
    required this.firstLabel,
    required this.secoundLabel,
    required this.thirdLabel,
    this.courrentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeToken.xl5,
      child: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: false,
        currentIndex: courrentIndex ?? 0,
        selectedLabelStyle: Style.l5(
          color: ColorToken.danger,
        ),
        items: [
          BottomNavigationBarItem(
              icon: courrentIndex != 0 ? firstIcon : const SizedBox.shrink(),
              label: firstLabel),
          BottomNavigationBarItem(
              icon: courrentIndex != 1 ? secoundIcon : const SizedBox.shrink(),
              label: secoundLabel),
          BottomNavigationBarItem(
            icon: courrentIndex != 2 ? thirdIcon : const SizedBox.shrink(),
            label: thirdLabel,
          ),
        ],
      ),
    );
  }
}
