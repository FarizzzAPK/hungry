import 'package:flutter/material.dart';
import 'package:hungry/features/orderHistory/widgets/ex_order_card.dart';
import 'package:hungry/shared/custom_button.dart';
import 'package:hungry/shared/custom_text.dart';
import 'package:hungry/shared/custom_total.dart';

class OrderHistoryView extends StatelessWidget {
  const OrderHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: ListView.builder(itemCount: 5,
padding: EdgeInsets.all(0),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: ExOrderCard(image: "assets/images/image6.png",quantity: 3,price: 20,productName: "Hamburger"),
              );
    },
      )
    )
    );
  }
}
