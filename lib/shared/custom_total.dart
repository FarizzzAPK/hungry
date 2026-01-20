import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_constants.dart';
import 'package:hungry/shared/custom_text.dart';

import 'custom_button.dart';

class CustomTotal extends StatelessWidget {
  CustomTotal({super.key, required this.total, required this.buttonText, required this.onTap, required this.totalText});
  final double total;
  final String buttonText;
  final VoidCallback onTap;
  final String totalText;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: totalText, weight: FontWeight.bold, size: 18),
              SizedBox(height: 15),
              Row(
                children: [
                  CustomText(
                    text: "\$ ",
                    color: AppConstants().PrimaryColor,
                    weight: FontWeight.bold,
                    size: 18,
                  ),
                  CustomText(
                    text: "$total",
                    color: AppConstants().PrimaryColor,
                    weight: FontWeight.bold,
                    size: 20,
                  ),
                ],
              ),
            ],
          ),
          CustomButton(buttonText: buttonText,width: 150,height: 70,onTap: onTap,size: 16,)
        ],
      ),
    );
  }
}
