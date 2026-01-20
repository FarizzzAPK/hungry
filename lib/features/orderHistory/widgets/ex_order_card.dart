import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungry/shared/custom_button.dart';
import 'package:hungry/shared/custom_text.dart';


class ExOrderCard extends StatelessWidget {
   ExOrderCard({super.key, required this.image, required this.productName, required this.quantity, required this.price});
  final String image;
  final String productName;
  final int quantity;
  final double price;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 4),
      child: Container(
        padding: EdgeInsets.all(16),
        height: 240,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadiusGeometry.circular(20),
            boxShadow: [BoxShadow(
              color: Colors.black.withOpacity(0.15),
              offset: Offset(0, 0),
              blurRadius: 2,
            )]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(image,height: 150,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: productName,weight: FontWeight.bold,),
                    CustomText(text: "Qty : x$quantity",size: 13,),
                    CustomText(text: "Price : $price \$",size: 13,),
                  ],
                )
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: CustomButton(buttonText: "Re Order",height: 50,width: double.infinity,onTap: (){},size: 16,),
            )
          ],
        ),
      ),
    );
  }
}
