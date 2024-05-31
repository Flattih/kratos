import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kratos/core/extension/context_extension.dart';
import 'package:kratos/core/theme/app_colors.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final Widget? prefixIcon;
  final Color? prefixIconColor;
  final Widget? suffixIcon;
  final double horizontalPadding;
  final double verticalPadding;
  final double borderRadius;
  final double? prefixRightPadding;
  final double? prefixLeftPadding;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? contentPadding;
  final double prefixIconSize;
  final double suffixIconSize;
  final Color fillColor;
  final void Function(String)? onChanged;
  final bool readOnly;
  final VoidCallback? onTap;
  final int? maxLength;
  final void Function(String)? onSubmitted;
  final TextInputType? keyboardType;
  final Widget? suffix;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  final int maxLines;
  final bool? alignLabelWithHint;
  final bool? isCollapsed;
  final Color hintColor;

  const AppTextField({
    required this.controller,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.contentPadding = const EdgeInsets.all(20),
    this.fillColor = const Color(0xFF1F2430),
    this.prefixRightPadding,
    this.prefixLeftPadding,
    this.prefixIconColor,
    this.onChanged,
    this.prefixIconSize = 30,
    this.suffixIconSize = 30,
    this.horizontalPadding = 0,
    this.verticalPadding = 0,
    this.borderRadius = 10,
    this.textStyle,
    this.readOnly = false,
    this.obscureText = false,
    this.onTap,
    this.maxLength,
    this.onSubmitted,
    this.keyboardType,
    this.suffix,
    this.inputFormatters,
    this.maxLines = 1,
    this.alignLabelWithHint,
    this.isCollapsed,
    this.hintColor = AppColors.hintColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
      child: TextField(
        maxLines: maxLines,
        obscureText: obscureText,
        inputFormatters: inputFormatters,
        keyboardType: keyboardType,
        onSubmitted: onSubmitted,
        maxLength: maxLength,
        onTap: onTap,
        readOnly: readOnly,
        controller: controller,
        textAlignVertical: TextAlignVertical.center,
        style: textStyle,
        onChanged: onChanged,
        cursorColor: AppColors.primary,
        decoration: InputDecoration(
            fillColor: fillColor,
            filled: true,
            alignLabelWithHint: alignLabelWithHint,
            isCollapsed: isCollapsed,
            hintStyle:
                context.textTheme.labelLarge!.copyWith(color: hintColor, fontSize: 16, fontWeight: FontWeight.bold),
            border: outlinedBorder(borderRadius),
            contentPadding: contentPadding,
            focusedBorder: focusedBorder(borderRadius),
            enabledBorder: outlinedBorder(borderRadius),
            disabledBorder: outlinedBorder(borderRadius),
            suffix: suffix,
            prefixIcon: prefixIcon,
            hintText: hintText,
            suffixIcon: suffixIcon),
      ),
    );
  }

  OutlineInputBorder outlinedBorder(double borderRadius) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      );

  OutlineInputBorder focusedBorder(double borderRadius) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: const BorderSide(color: AppColors.primary, width: 2),
      );
}
