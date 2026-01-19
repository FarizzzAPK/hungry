import 'package:flutter/material.dart';
import 'package:hungry/shared/custom_text.dart';

class CustomAuthButton extends StatelessWidget {
  CustomAuthButton({super.key, required this.buttonText, required this.onTap});
  String buttonText;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Center(
          child: CustomText(
            text: buttonText,
            weight: FontWeight.bold,
            size: 16,
          ),
        ),
      ),
    );
  }
}
