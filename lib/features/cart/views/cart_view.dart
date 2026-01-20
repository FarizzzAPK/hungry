import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_constants.dart';
import 'package:hungry/features/cart/widgets/cart_item_card.dart';
import 'package:hungry/features/chekout/views/checkout_view.dart';
import 'package:hungry/shared/custom_text.dart';
import 'package:hungry/shared/custom_total.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  late List<int> quantities;
  final int itemCount=20;
  @override
  void initState(){
    quantities = List.generate(itemCount, (_)=>1);
    super.initState();
  }

  void onAdd(int index){
    setState(() {
      quantities[index]++;
    });
  }
  void onMin(int index){
    setState(() {
      if(quantities[index] != 0)
      quantities[index]--;
    });
  }

  int number = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0,right: 16,top: 25,bottom: 60),
        child: Column(
          children: [
            Row(
              children: [
                CustomText(text: "Your Cart",color: AppConstants().PrimaryColor,size: 25,weight: FontWeight.bold,),
              ],
            ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.all(0),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return CartItemCard(
                        image: "assets/images/image6.png",
                        title: "Cheeseburger",
                        subtitle: "Wendy's Burger",
                        quantity: quantities[index],
                        onAdd: ()=> onAdd(index),
                        onMin: ()=> onMin(index),
                        onDelete: () {},
                      );
                    },
                  ),
                ),
            CustomTotal(
              totalText: "Total",
              total: 90.19,buttonText: "Checkout",onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CheckoutView(),));
            },),

          ],
        ),
      ),
    );
  }
}
