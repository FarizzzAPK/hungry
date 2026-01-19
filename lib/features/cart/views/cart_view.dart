import 'package:flutter/material.dart';
import 'package:hungry/shared/custom_text.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: CustomText(text: "Cart Screen")),
    );
  }
}
