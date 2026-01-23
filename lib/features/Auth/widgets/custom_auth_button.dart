import 'package:flutter/material.dart';
import 'package:hungry/shared/custom_text.dart';

class CustomAuthButton extends StatelessWidget {
  const CustomAuthButton({
    super.key,
    required this.buttonText,
    required this.onTap,
    this.widget,
  });

  final String buttonText;
  final VoidCallback onTap;
  final Widget? widget;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget != null ? null : onTap,
      child: Container(
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: widget ??
              CustomText(
                text: buttonText,
                weight: FontWeight.bold,
                size: 16,
              ),
        ),
      ),
    );
  }
}
