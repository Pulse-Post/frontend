// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uikit/uikit.dart';

class InputDefault extends StatelessWidget {
  final String? prefixIcon;
  final String? prefix;
  final String? sufixIcon;
  final void Function()? onTap;
  final TextInputType? keyBoardType;
  final String hintText;
  final int maxLines;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function()? sufixOnTap;
  final double? paddingLeftPrefix;
  final double? paddingLeftSufix;
  final bool isTextActive;
  final bool enable;
  const InputDefault({
    super.key,
    this.prefixIcon,
    this.prefix,
    this.sufixIcon,
    this.onTap,
    this.keyBoardType,
    required this.hintText,
    this.maxLines = 1,
    this.focusNode,
    this.textInputAction,
    this.inputFormatters,
    this.validator,
    this.controller,
    this.onChanged,
    this.sufixOnTap,
    this.paddingLeftPrefix,
    this.paddingLeftSufix,
    this.isTextActive = false,
    this.enable = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enable,
      focusNode: focusNode,
      onTap: onTap,
      readOnly: onTap != null ? true : false,
      keyboardType: keyBoardType,
      maxLines: maxLines,
      style: Style.b1(color: ColorToken.dark),
      textInputAction: textInputAction,
      controller: controller ?? controller,
      validator: validator ?? validator,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorToken.neutral,
        contentPadding: const EdgeInsets.all(SizeToken.sm),
        isDense: true,
        prefixText: prefix,
        prefixStyle: Style.b1(color: ColorToken.dark),
        prefixIconConstraints: const BoxConstraints(),
        suffixIconConstraints: const BoxConstraints(),
        suffixIcon: Padding(
          padding: EdgeInsets.only(
              right: sufixIcon != null ? SizeToken.xs : SizeToken.sm,
              left: sufixIcon != null ? 0 : SizeToken.xxs),
          child: sufixIcon != null
              ? isTextActive?  IconLargeDark(
                  onTap: sufixOnTap,
                  icon: sufixIcon!,
                  isNarrow: true,
                ):  IconLargeSemiDark(
                  onTap: sufixOnTap,
                  icon: sufixIcon!,
                  padding: SizeToken.xs,
                )
              : const SizedBox.shrink(),
        ),
        prefixIcon: isTextActive? const Padding(padding: EdgeInsetsGeometry.only(right: SizeToken.sm)) : Padding(
          padding: EdgeInsets.only(
              right: paddingLeftPrefix != null ? paddingLeftPrefix! : 0,
              left: SizeToken.xxs),
          child: prefixIcon != null
              ?
                   IconLargeSemiDark(
                      icon: prefixIcon!,
                      padding: SizeToken.xs,
                    )
              : const SizedBox.shrink(),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(SizeToken.xs),
          ),
          borderSide: BorderSide.none,
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(SizeToken.xs),
          ),
          borderSide: BorderSide.none,
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(SizeToken.xs),
          ),
          borderSide: BorderSide.none,
        ),
        disabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(SizeToken.xs),
          ),
          borderSide: BorderSide.none,
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(SizeToken.xs),
          ),
          borderSide: BorderSide(color: ColorToken.danger, width: 1),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(SizeToken.xs),
          ),
          borderSide: BorderSide.none,
        ),
        hintText: hintText,
        hintStyle: Style.b1(
            color: isTextActive ? ColorToken.dark : ColorToken.semiDark),
      ),
      onChanged: onChanged,
    );
  }
}
