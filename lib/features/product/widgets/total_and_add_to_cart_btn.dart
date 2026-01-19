import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_constants.dart';
import 'package:hungry/shared/custom_text.dart';

class TotalAndAddToCartBtn extends StatelessWidget {
   TotalAndAddToCartBtn({super.key, required this.total});
   final double total;
  @override
  Widget build(BuildContext context) {
    return Container(
              color: Colors.white,
              height: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: "Total",weight: FontWeight.bold,size: 18,),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          CustomText(text: "\$ ",color: AppConstants().PrimaryColor,weight: FontWeight.bold,size: 18,),
                          CustomText(text: "$total",color: AppConstants().PrimaryColor,weight: FontWeight.bold,size: 20,),
                          
                        ],
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 200,
                      height: 70,
                      decoration: BoxDecoration(
                        color: AppConstants().PrimaryColor,
                        borderRadius: BorderRadius.circular(16)
                      ),
                      child: Center(
                        child: 
                        CustomText(text: "Add To Cart",color: Colors.white,weight: FontWeight.bold,)
                      ),
                    ),
                  )
                ],
              ),
            );
  }
}