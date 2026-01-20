import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_constants.dart';
import 'package:hungry/features/chekout/widgets/checkout_bottom_sheet.dart';
import 'package:hungry/features/chekout/widgets/custom_checkout_row.dart';
import 'package:hungry/features/chekout/widgets/payment_method_tile.dart';
import 'package:hungry/shared/custom_text.dart';
import 'package:hungry/shared/custom_total.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  int selectedMethod = 0;
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    late int? from = 15;
    late int? to = 30;
    int selectedIndex = 0;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: AppConstants().PrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "Order summary",
              size: 18,
              weight: FontWeight.bold,
            ),
            SizedBox(height: 20),
            CustomCheckoutRow(Text: "Order", amount: 16.48),
            CustomCheckoutRow(Text: "Taxes", amount: 0.3),
            CustomCheckoutRow(Text: "Delivery fees", amount: 1.5),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: SizedBox(
                height: 2,
                width: double.infinity,
                child: ColoredBox(color: Color(0xfff0f0f0)),
              ),
            ),
            CustomCheckoutRow(
              Text: "Total",
              amount: 18.19,
              weight: FontWeight.bold,
              color: Color(0xff3C2F2F),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "Estimated delivery time:",
                    size: 13,
                    weight: FontWeight.w700,
                    color: Color(0xff3C2F2F),
                  ),
                  CustomText(
                    text: "$from - $to mins",
                    size: 13,
                    weight: FontWeight.bold,
                    color: Color(0xff3C2F2F),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            CustomText(
              text: "Payment methods",
              weight: FontWeight.bold,
              size: 22,
              color: Color(0xff3C2F2F),
            ),
            SizedBox(height: 16),

            Column(
              children: [
                PaymentMethodTile(
                  value: 0,
                  groupValue: selectedMethod,
                  title: "Cash on Delivery",
                  subtitle: "",
                  imagePath: "assets/images/cash.png",
                  color: const Color(0xFF2D1F1F),
                  onTap: () {
                    setState(() => selectedMethod = 0);
                  },
                ),
                SizedBox(height: 16),

                PaymentMethodTile(
                  groupValue: selectedMethod,
                  value: 1,
                  title: "Debit card",
                  subtitle: "**** **** **** 2342",
                  imagePath: "assets/images/visa.png",
                  color: const Color(0xFF0D47A1),
                  onTap: () {
                    setState(() => selectedMethod = 1);
                  },
                ),
                Row(
                  children: [
                    Checkbox(
                      activeColor: const Color(0xffEF2A39),
                      value: isSelected,
                      onChanged: (value) {
                        setState(() {
                          isSelected = value!;
                        });
                      },
                    ),

                    CustomText(
                      text: "Save card details for future payments",
                      size: 12,
                      color: Color(0xff808080),
                      weight: FontWeight.bold,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25),
            topLeft: Radius.circular(25),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 5,
              offset: Offset(0, -5),
              blurRadius: 5,
            ),
          ],
        ),
        height: 120,
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: CustomTotal(
          buttonText: "Pay Now",
          total: 18.19,
          totalText: "total Price",
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 200),
                  child: CheckoutBottomSheet(),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
