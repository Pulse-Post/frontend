// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class ButtonNavigatorMenu extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onTap;
  final void Function()? firstonOnTap;
  final void Function()? secoundOnTap;
  final void Function()? thirdOnTap;
  final void Function()? fourthOnTap;
  final String firstLabel;
  final String secoundLabel;
  final String thirdLabel;
  final String fourthLabel;
  final String firstIcon;
  final String secoundIcon;
  final String thirdIcon;
  final String fourthIcon;
  final int? fourthCount;

  const ButtonNavigatorMenu({
    super.key,
    required this.currentIndex,
    required this.onTap,
    this.firstonOnTap,
    this.secoundOnTap,
    this.thirdOnTap,
    this.fourthOnTap,
    required this.firstLabel,
    required this.secoundLabel,
    required this.thirdLabel,
    required this.fourthLabel,
    required this.firstIcon,
    required this.secoundIcon,
    required this.thirdIcon,
    required this.fourthIcon,
    this.fourthCount,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeToken.xl5,
      child: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        selectedLabelStyle: Style.l4(),
        onTap: onTap,
        currentIndex: currentIndex,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedItemColor: ColorToken.danger,
        items: [
          BottomNavigationBarItem(
              icon: currentIndex != 0
                  ? IconLargeDark(icon: firstIcon, onTap: firstonOnTap,)
                  : const SizedBox.shrink(),
              label: firstLabel),
          BottomNavigationBarItem(
              icon: currentIndex != 1
                  ? IconLargeDark(icon: secoundIcon, onTap: secoundOnTap,)
                  : const SizedBox.shrink(),
              label: secoundLabel),
          BottomNavigationBarItem(
              icon: currentIndex != 2
                  ? IconLargeDark(icon: thirdIcon, onTap: thirdOnTap,)
                  : const SizedBox.shrink(),
              label: thirdLabel),
          BottomNavigationBarItem(
            icon: currentIndex != 3
                ? IconLargeDark(
                  
                    icon: fourthIcon,
                    count: fourthCount == 0
                        ? null
                        : fourthCount! > 99
                            ? '99+'
                            : fourthCount.toString(),
                            onTap: fourthOnTap,
                  )
                : const SizedBox.shrink(),
            label: fourthLabel,
          ),
        ],
      ),
    );
  }
}
