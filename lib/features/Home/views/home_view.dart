import 'package:flutter/material.dart';
import 'package:hungry/features/home/widgets/Product_card.dart';
import 'package:hungry/features/home/widgets/categories_row.dart';
import 'package:hungry/features/home/widgets/logo_and_profile_img.dart';
import 'package:hungry/features/home/widgets/search_field.dart';
import 'package:hungry/features/product/views/product_details_view.dart';
import 'package:hungry/shared/custom_text.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 75),
            LogoAndProfileImg(),
            CustomText(text: "Hello, Salem"),
            const SizedBox(height: 10),
            SearchField(),
            const SizedBox(height: 25),
            CategoriesRow(),
            const SizedBox(height: 25),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.81,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailsView(),
                        ),
                      );
                    },
                    child: ProductCard(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
