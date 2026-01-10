// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../../../uikit.dart';

class ContentDefault extends StatelessWidget {
  final Widget child;
  const ContentDefault({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: SizeToken.md,
        right: SizeToken.md,
      ),
      child: child,
    );
  }
}
