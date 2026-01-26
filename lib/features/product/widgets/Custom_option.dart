import 'package:flutter/material.dart';
import 'package:hungry/shared/custom_text.dart';

class CustomOption extends StatelessWidget {
  final String? image;
  final String? name;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomOption({
    super.key,
    this.image,
    this.name,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // الضغط على الكارت كله
      child: Container(
        height: 120,
        width: 100,
        decoration: BoxDecoration(
          color: isSelected ? Colors.green : const Color(0xff3C2F2F),
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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: image != null && image!.isNotEmpty
                    ? Image.network(
                  image!,
                  height: 80,
                  width: 100,
                  fit: BoxFit.cover,
                )
                    : const Icon(
                  Icons.image_not_supported,
                  size: 30,
                  color: Colors.grey,
                ),
              ),
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
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.green : Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        isSelected ? Icons.check : Icons.add,
                        color: Colors.white,
                        size: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
