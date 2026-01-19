import 'package:flutter/material.dart';
import 'package:hungry/shared/custom_text.dart';

class OrderHistoryView extends StatelessWidget {
  const OrderHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: CustomText(text: "Order History Screen")),
    );
  }
}
