import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText({
    super.key,
    required this.text,
    this.color,
    this.size,
    this.weight,
  });
  String? text;
  double? size;
  FontWeight? weight;
  Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(color: color, fontSize: size, fontWeight: weight,decoration: TextDecoration.none,),
    );
  }
}
