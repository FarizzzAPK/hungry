import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_constants.dart';
import 'package:hungry/shared/custom_text.dart';

class CustomDataContainer extends StatelessWidget {
   CustomDataContainer({
     super.key, required this.text, required this.icon, required this.textColor, required this.iconColor});
   final String text ;
   final IconData icon;
   final Color textColor;
   final Color iconColor;
  AppConstants appConstants = AppConstants();


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 Icon(
                  icon,
                  color: iconColor,
                  size: 20,
                ),
                const SizedBox(width: 12),
                CustomText(
                  text: text,
                  color: textColor,
                  weight: FontWeight.bold,
                ),
              ],
            ),
          ),
        ),
      ),
    )
    ;
  }
}
