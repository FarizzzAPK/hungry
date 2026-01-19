import 'package:flutter/material.dart';
import 'package:hungry/features/cart/widgets/cart_item_card.dart';

import '../../../shared/custom_button.dart';


class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  int number = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0,right: 16,top: 40,bottom: 60),
        child: Column(
          children: [
            SizedBox(height: 5),
                Expanded(
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return CartItemCard(
                        image: "assets/images/image6.png",
                        title: "Cheeseburger",
                        subtitle: "Wendy's Burger",
                        quantity: number,
                        onAdd: () {},
                        onRemove: () {},
                        onDelete: () {},
                      );
                    },
                  ),
                ),
            CustomButton(total: 90.19,buttonText: "Checkout",),

          ],
        ),
      ),
    );
  }
}
