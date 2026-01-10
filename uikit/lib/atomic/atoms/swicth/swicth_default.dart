// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class SwicthDefault extends StatelessWidget {
  final bool value;
  final void Function(bool value)? onChanged;

  const SwicthDefault({
    super.key,
    required this.value,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.9,
      child: Switch(
        activeThumbColor: ColorToken.light,
        activeTrackColor: ColorToken.danger,
        value: value,
        onChanged: onChanged,
        padding: EdgeInsets.zero,
      ),
    );
  }
}
