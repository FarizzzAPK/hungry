import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText({
    super.key,
    required this.text,
    this.color,
    this.size,
    this.overflow,
    this.weight,
  });
  String? text;
  double? size;
  TextOverflow? overflow;
  FontWeight? weight;
  Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: overflow,
      textScaler: TextScaler.linear(1.0),
      text!,
      style: TextStyle(color: color, fontSize: size, fontWeight: weight,decoration: TextDecoration.none,),
    );
  }
}
