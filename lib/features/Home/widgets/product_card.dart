import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_constants.dart';
import 'package:hungry/shared/custom_text.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
              height: 225,
              width: 185,
              decoration: BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 5,
        offset: Offset(0, 0),
      ),
      
    ],borderRadius: BorderRadius.circular(20),
    color: Colors.white
    ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Image.asset("assets/images/image6.png",height: 120,)),
                    CustomText(text: "Cheeseburger",size: 13,weight: FontWeight.bold,),
                    CustomText(text: "Wendy's Burger",size: 13,weight: FontWeight.w600,),
                    Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.star_rate,color: Color(0xffFF9633),size: 18,),
                            CustomText(text: " 4.9",size: 13,weight: FontWeight.w600,),
                          ],
                        ),
                        Icon(Icons.favorite,color:AppConstants().PrimaryColor,size: 20,),

                      ],
                    ),
                  ],
                ),
              ),
            );
  }
}