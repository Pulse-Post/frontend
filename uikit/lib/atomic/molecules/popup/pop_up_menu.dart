// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:uikit/tokens/token.dart';

class PopUpMenu extends StatelessWidget {
  final List<PopupMenuEntry> menuList;
  final Offset offset;
  final EdgeInsets menuPadding;
  final Widget? icon;
  final double? maxWidth;

  const PopUpMenu({
    super.key,
    required this.menuList,
    required this.offset,
    required this.menuPadding,
    this.icon,
    this.maxWidth,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      offset: offset,
      color: ColorToken.light,
      padding: EdgeInsets.zero,
      constraints:
          maxWidth != null ? BoxConstraints(maxWidth: maxWidth!) : null,
      menuPadding: menuPadding,
      itemBuilder: (context) => menuList,
      icon: icon,
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: ColorToken.semiDark, width: 0.2),
        borderRadius: BorderRadius.circular(SizeToken.sm),
      ),
    );
  }
}
