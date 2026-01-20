import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_constants.dart';
import 'package:hungry/shared/custom_button.dart';
import 'package:hungry/shared/custom_text.dart';

class CheckoutBottomSheet extends StatelessWidget {
  const CheckoutBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 340,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 15,
            offset: Offset(0, 0),
            spreadRadius: 5
          )
        ],
        color: Colors.white,
        borderRadius: BorderRadiusGeometry.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Icon(
            CupertinoIcons.checkmark_alt_circle_fill,
            color: AppConstants().PrimaryColor,
            weight: 1,
            size: 150,
            fill: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: CustomText(
              text:
                  "Your payment was successful. A receipt for this purchase has been sent to your email.",
              color: Color(0xffBcBBBB),
              size: 12,
              weight: FontWeight.w400,
            ),
          ),
          CustomButton(
            size: 15,
            buttonText: "Close",
            width: 220,
            height: 60,
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
