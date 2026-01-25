import 'package:flutter/material.dart';
import 'package:hungry/shared/custom_text.dart';

class CustomTopping extends StatelessWidget {
  final String? image;
  final String? name;

  CustomTopping({super.key, this.image, this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 100,
      decoration: BoxDecoration(
        color: const Color(0xff3C2F2F),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 80,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: image != null && image!.isNotEmpty
                ? Image.network(image!, height: 30, width: 30, fit: BoxFit.cover)
                : const Icon(Icons.image_not_supported, size: 30, color: Colors.grey),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                    text: name ?? "No Name",
                    color: Colors.white,
                    size: 11,
                    weight: FontWeight.bold,
                  ),
                  const Spacer(),
                  Container(
                    width: 21,
                    height: 21,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
