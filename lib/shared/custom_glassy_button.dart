import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_constants.dart';
import 'package:hungry/shared/custom_text.dart';

class CustomGlassyButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;
  final Color textColor;
  final Color iconColor;

  final double textSize;
  final double height;
  final double width;

  final FontWeight textWeight;

   CustomGlassyButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap, required this.textColor, required this.textSize, required this.textWeight, required this.height, required this.width, required this.iconColor,
  });
AppConstants appConstants = AppConstants();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            height: height,
            width: width,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: appConstants.PrimaryColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 10,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText(text: text,weight: textWeight,color: textColor,size: textSize,),
                const SizedBox(width: 12),
                Icon(
                  icon,
                  color: iconColor,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
