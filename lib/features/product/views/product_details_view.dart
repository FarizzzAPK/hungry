import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_constants.dart';
import 'package:hungry/features/product/data/models/options_model.dart';
import 'package:hungry/features/product/data/models/topping_model.dart';
import 'package:hungry/features/product/data/repos/product_repo.dart';
import 'package:hungry/features/product/widgets/Custom_Topping.dart';
import 'package:hungry/features/product/widgets/Custom_option.dart';
import 'package:hungry/features/product/widgets/spicy_slider.dart';
import 'package:hungry/shared/custom_text.dart';
import 'package:hungry/shared/custom_total.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key, required this.image});
  final String image;
  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  double value = 0.7;
  double total = 18.5;
 int? selectedTopping;
  int? selectedOption;

  final ProductRepo productRepo = ProductRepo();

  List<ToppingModel>? toppings;
  List<OptionsModel>? options;

  @override
  void initState() {
    super.initState();
    getToppings();
    getOptions();
  }

  Future<void> getToppings() async {
    final response = await productRepo.getToppings();
    if (mounted) {
      setState(() => toppings = response);
    }
  }

  Future<void> getOptions() async {
    final response = await productRepo.getOptions();
    if (mounted) {
      setState(() => options = response);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isLoading = toppings == null || options == null;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, size: 25),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        foregroundColor: AppConstants().PrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Skeletonizer(
            enabled: isLoading,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SpicySlider(
                  image: widget.image,
                  value: value,
                  onChanged: (v) {
                    setState(() {
                      value = v;
                    });
                  },
                ),
                const SizedBox(height: 16),
                CustomText(text: "Toppings", weight: FontWeight.bold),

                const SizedBox(height: 8),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(toppings?.length ?? 4, (index) {
                      final topping =
                          (toppings != null && index < toppings!.length)
                          ? toppings![index]
                          : null;
                      bool isSelected = false;
                      if(selectedTopping == index){
                        isSelected=true;
                      }
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomTopping(
                          onTap: () {
                            setState(() {
                              selectedTopping = index;
                            });
                          },
                          isSelected: isSelected,
                          image: topping?.image ?? '',
                          name: topping?.name ?? 'Loading',
                        ),
                      );
                    }),
                  ),
                ),
                const SizedBox(height: 16),
                CustomText(text: "Side options", weight: FontWeight.bold),
                const SizedBox(height: 8),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(options?.length ?? 4, (index) {
                      final option =
                          (options != null && index < options!.length)
                          ? options![index]
                          : null;
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomOption(
                          onTap: (){
                        setState(() {
                        selectedOption = index;
                        });
                        },
                          isSelected: selectedOption == index,
                          image: option?.image ?? '',
                          name: option?.name ?? 'Loading',
                        ),
                      );
                    }),
                  ),
                ),

                const SizedBox(height: 24),

                /// 🔥 Total Section
                CustomTotal(
                  total: total,
                  totalText: "Total",
                  buttonText: "Add To Cart",
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
