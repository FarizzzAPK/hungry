import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_constants.dart';
import 'package:hungry/shared/custom_text.dart';

class CategoriesRow extends StatefulWidget {
  const CategoriesRow({super.key});

  @override
  State<CategoriesRow> createState() => _CategoriesState();
}

class _CategoriesState extends State<CategoriesRow> {
  List<String> category = ["All", "Combo", "Sliders", "Classic"];

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(category.length, (index) {
          final bool isSelected = selectedIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              height: 50,
              width: 110,
              decoration: BoxDecoration(
                color: isSelected
                    ? AppConstants().PrimaryColor
                    : const Color(0xffF3F4F6),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: CustomText(
                  text: category[index],
                  size: 13,
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
