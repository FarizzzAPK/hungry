import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_constants.dart';
import 'package:hungry/features/product/widgets/Custom_Topping.dart';
import 'package:hungry/features/product/widgets/Custom_option.dart';
import 'package:hungry/features/product/widgets/spicy_slider.dart';
import 'package:hungry/features/product/widgets/total_and_add_to_cart_btn.dart';
import 'package:hungry/shared/custom_text.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  double value = 0.7;
  double total = 18.5;
  List<String> toppings = ["Tomato", "Onions", "Pickles", "Bacons"];

  List<String> options = ["Fries", "Coleslaw", "Salad", "Onion"];

  List<String> topping_image = [
    "assets/images/pngwing15.png",
    "assets/images/pngwing17.png",
    "assets/images/pngwing18.png",
    "assets/images/pngwing19.png",
  ];

  List<String> optioon_image = [
    "assets/images/image20.png",
    "assets/images/image21.png",
    "assets/images/pngwing22.png",
    "assets/images/pngwing23.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, weight: 700, size: 25),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        foregroundColor: AppConstants().PrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SpicySlider(
              value: value,
              onChanged: (v) {
                setState(() {
                  value = v;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: CustomText(text: "Toppings", weight: FontWeight.bold),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(toppings.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomTopping(
                      image: topping_image[index],
                      topping_name: toppings[index],
                    ),
                  );
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: CustomText(text: "Side options", weight: FontWeight.bold),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(options.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomOption(
                      image: optioon_image[index],
                      option_name: options[index],
                    ),
                  );
                }),
              ),
            ),
            Spacer(),
            TotalAndAddToCartBtn(total: total),
          ],
        ),
      ),
    );
  }
}
