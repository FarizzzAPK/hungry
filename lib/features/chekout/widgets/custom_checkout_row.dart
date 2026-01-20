import 'package:flutter/material.dart';
import 'package:hungry/shared/custom_text.dart';

class CustomCheckoutRow extends StatelessWidget {
   CustomCheckoutRow({super.key, required this.Text, required this.amount, this.color,
     this.size,
     this.weight,});
   final String Text;
   final double amount;
   double? size;
   FontWeight? weight;
   Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(text: Text,color: Color(0xff7D7D7D),weight: weight,size: size,),
          CustomText(text: "\$ $amount",color: Color(0xff7D7D7D),weight: weight,size: size,),
        ],
      ),
    );
  }
}
