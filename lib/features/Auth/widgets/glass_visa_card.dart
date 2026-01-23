import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_constants.dart';

class GlassVisaCard extends StatelessWidget {
  final String cardNumber;
  final String cardHolder;


   GlassVisaCard({
    super.key,
    required this.cardNumber, required this.cardHolder,
  });
AppConstants appConstants = AppConstants();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Container(
            padding: const EdgeInsets.all(20),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Top Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(
                      Icons.credit_card,
                      color: Colors.white,
                      size: 28,
                    ),
                    Text(
                      "VISA",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30,),
                Text(
                  cardHolder,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Text(
                  cardNumber,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w600,
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
