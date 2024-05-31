import 'package:flutter/material.dart';
import 'package:kratos/core/extension/padding_extension.dart';
import 'package:kratos/core/theme/app_colors.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? bgColor;
  final Color? textColor;
  const AppButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.bgColor = AppColors.primary,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: 20.verticalP,
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: textColor),
        ),
      ),
    );
  }
}
