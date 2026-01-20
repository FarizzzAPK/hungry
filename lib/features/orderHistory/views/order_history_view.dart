import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_constants.dart';
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
        padding: const EdgeInsets.only(top: 25.0),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:16.0),
                  child: CustomText(text: "Last Orders",color: AppConstants().PrimaryColor,size: 25,weight: FontWeight.bold,),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(itemCount: 5,
                          padding: EdgeInsets.all(0),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: ExOrderCard(image: "assets/images/image6.png",quantity: 3,price: 20,productName: "Hamburger"),
                    );
                },
                          ),
            ),
          ],
        ),
      )
    );
  }
}
