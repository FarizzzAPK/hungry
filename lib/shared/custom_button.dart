import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/constants/app_constants.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
   CustomButton({super.key, required this.buttonText, required this.width, required this.height, required this.onTap, required this.size});
   final String buttonText;
   final double width;
   final double height;
   final VoidCallback onTap;
   final double size;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppConstants().PrimaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: CustomText(
            size: size,
            text: buttonText,
            color: Colors.white,
            weight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
