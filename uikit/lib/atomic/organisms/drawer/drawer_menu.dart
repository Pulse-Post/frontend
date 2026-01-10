// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:uikit/uikit.dart';

class DrawerMenu extends StatelessWidget {
  final void Function() firstOnPressed;
  final void Function() secoundOnPressed;
  final void Function() thirdOnPressed;
  final void Function() fourthOnPressed;
  final void Function() fifthOnPressed;
  final void Function() logoutOnPressed;
  final String firstText;
  final String secoundText;
  final String thirdText;
  final String fourthText;
  final String fifthText;
  final String logoutText;
  final String firstIcon;
  final String secoundIcon;
  final String thirdIcon;
  final String fourthIcon;
  final String fifthIcon;
  final String logoutIcon;
  final String menuIcon;
  final String logo;
  const DrawerMenu({
    super.key,
    required this.firstOnPressed,
    required this.secoundOnPressed,
    required this.thirdOnPressed,
    required this.fourthOnPressed,
    required this.fifthOnPressed,
    required this.logoutOnPressed,
    required this.firstText,
    required this.secoundText,
    required this.thirdText,
    required this.fourthText,
    required this.fifthText,
    required this.logoutText,
    required this.firstIcon,
    required this.secoundIcon,
    required this.thirdIcon,
    required this.fourthIcon,
    required this.fifthIcon,
    required this.logoutIcon,
    required this.menuIcon,
    required this.logo,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding:
            const EdgeInsets.only(top: SizeToken.xl4, bottom: SizeToken.md),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: SizeToken.md),
                  child: Row(
                    spacing: SizeToken.md,
                    children: [
                      IconButtonLargeDark(
                        icon: menuIcon,
                        onTap: () => context.pop(),
                      ),
                      SvgPicture.asset(logo, height: SizeToken.xxl),
                    ],
                  ),
                ),
                const SizedBox(
                  height: SizeToken.xs,
                ),
                Column(
                  children: [
                    MenuItem(
                      text: firstText,
                      icon: firstIcon,
                      onPressed: firstOnPressed,
                    ),
                    MenuItem(
                      key: const Key('productsNavigator'),
                      text: secoundText,
                      icon: secoundIcon,
                      onPressed: secoundOnPressed,
                    ),
                    MenuItem(
                      text: thirdText,
                      icon: thirdIcon,
                      onPressed: thirdOnPressed,
                    ),
                    const SizedBox(
                      height: SizeToken.sm,
                    ),
                    const DividerDefault(),
                    MenuItem(
                      text: fourthText,
                      icon: fourthIcon,
                      onPressed: fourthOnPressed,
                      key: const Key('myStoreNavigator'),
                    ),
                    MenuItem(
                      text: fifthText,
                      icon: fifthIcon,
                      onPressed: fifthOnPressed,
                      key: const Key('myDelieveryAddressNavigator'),
                      paddinIcon: 2.5,
                    ),
                  ],
                ),
              ],
            ),
            MenuItem(
              text: logoutText,
              icon: logoutIcon,
              onPressed: logoutOnPressed,
            ),
          ],
        ),
      ),
    );
  }
}
