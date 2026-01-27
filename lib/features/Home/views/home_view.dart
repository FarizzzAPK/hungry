import 'package:flutter/material.dart';
import 'package:hungry/features/auth/data/auth_repo.dart';
import 'package:hungry/features/auth/data/user_model.dart';
import 'package:hungry/features/home/widgets/Product_card.dart';
import 'package:hungry/features/home/widgets/categories_row.dart';
import 'package:hungry/features/home/widgets/logo_and_profile_img.dart';
import 'package:hungry/features/home/widgets/search_field.dart';
import 'package:hungry/features/product/data/models/product_model.dart';
import 'package:hungry/features/product/data/repos/product_repo.dart';
import 'package:hungry/features/product/views/product_details_view.dart';
import 'package:hungry/shared/custom_text.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController searchController = TextEditingController();

  final ProductRepo productRepo = ProductRepo();
  List<ProductModel>? products;

  UserModel? userModel;
  final AuthRepo authRepo = AuthRepo();

  @override
  void initState() {
    super.initState();
    getUserData();
    getProducts();
  }

  Future<void> getUserData() async {
    try {
      final user = await authRepo.getProfileData();
      if (mounted) {
        setState(() => userModel = user);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> getProducts() async {
    final response = await productRepo.getProducts();
    if (mounted) {
      setState(() => products = response);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16,top: 16,right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  LogoAndProfileImg(userModel: userModel),
                  const SizedBox(height: 8),
                  CustomText(text: "Hello, ${userModel?.name ?? ""}"),
                  const SizedBox(height: 10),
                  SearchField(),
                  const SizedBox(height: 20),
                  const SizedBox(
                    height: 50,
                    child: CategoriesRow(),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            Expanded(
              child: Skeletonizer(
                enabled: products == null,
                child: GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  itemCount: products?.length ?? 6, // skeleton count
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.81,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    final product = products?[index];

                    return GestureDetector(
                      onTap: product == null
                          ? null
                          : () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProductDetailsView(
                              id: product.id ?? 1,
image: product.image ?? "",
                            ),
                          ),
                        );
                      },
                      child: ProductCard(
                        image: product?.image ?? "",
                        name: product?.name ?? "Loading",
                        description:
                        product?.description ?? "Loading description",
                        rate: product?.rating ?? 0,
                        price: product?.price ?? 0,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

