// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../uikit.dart';

class InputCopy extends StatelessWidget {
  final String hintText;
  final String? sufixIcon;
  final void Function()? sufixOnTap;
  const InputCopy({
    super.key,
    required this.hintText,
    this.sufixIcon, 
    this.sufixOnTap,
  });

   @override
   Widget build(BuildContext context) {
       return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputDefault(
          onTap: sufixOnTap,
          sufixOnTap: sufixOnTap,
          sufixIcon: sufixIcon,
          paddingLeftSufix: SizeToken.sm,
          hintText: hintText,
          isTextActive: true,
        ),
      ],
    );
  }
}
