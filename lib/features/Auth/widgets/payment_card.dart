import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_constants.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppConstants().PrimaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Image.asset('assets/images/visa.png', height: 40),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("Debit card", style: TextStyle(color: Colors.white)),
              Text(
                "3566 **** **** 0505",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          const Spacer(),
          Icon(Icons.check_circle, color: Colors.white,)
        ],
      ),
    );
  }
}
