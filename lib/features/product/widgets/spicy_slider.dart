import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_constants.dart';
import 'package:hungry/shared/custom_text.dart';

class SpicySlider extends StatefulWidget {
  SpicySlider({super.key, required this.value, required this.onChanged});
  final double value;
  final ValueChanged<double> onChanged;

  @override
  State<SpicySlider> createState() => _SpicySliderState();
}

class _SpicySliderState extends State<SpicySlider> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/pngwing12.png",
          height: 250,
          errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.fastfood, size: 100),
        ),

        const SizedBox(width: 16),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Customize Your Burger\nto Your Tastes. Ultimate Experience",
                style: TextStyle(
                  color: Color(0xff3C2F2F),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              CustomText(text: "Spicy", weight: FontWeight.bold),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  trackHeight: 5,
                ),
                child: Slider(
                  max: 1,
                  min: 0,
                  value: widget.value,
                  onChanged: widget.onChanged,
                  activeColor: AppConstants().PrimaryColor,
                ),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("🥶", style: TextStyle(fontSize: 16)),
                    Text("🌶", style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
