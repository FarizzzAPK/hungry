import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_constants.dart';
import 'package:hungry/shared/custom_text.dart';

class ProductCard extends StatefulWidget {
  ProductCard({
    super.key,
    required this.image,
    required this.name,
    required this.description,
    required this.rate,
    required this.price,
  });

  final String image;
  final String name;
  final String description;
  final double rate;
  final double price;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
        height: 250,
        width: 185,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              offset: Offset(0, 0),
            ),
          ],
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  widget.image,
                  height: 120,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return SizedBox(
                      height: 120,
                      child: Center(child: CupertinoActivityIndicator()),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 120,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.image_not_supported,
                        size: 40,
                        color: Colors.grey,
                      ),
                    );
                  },
                ),
              ),

              SizedBox(
                height: 20,
                child: CustomText(
                  text: widget.name,
                  size: 13,
                  weight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
                child: CustomText(
                  overflow: TextOverflow.ellipsis,
                  text: widget.description,
                  size: 11,
                  weight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.star_rate,
                          color: Color(0xffFF9633),
                          size: 18,
                        ),
                        CustomText(
                          text: "${widget.rate}",
                          size: 13,
                          weight: FontWeight.w600,
                        ),
                      ],
                    ),
                    CustomText(
                      text: "${widget.price} LE",
                      size: 14,
                      weight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
