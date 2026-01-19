import 'package:flutter/material.dart';
import 'package:hungry/shared/custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.isPassword,
  });
  TextEditingController controller = TextEditingController();
  String hintText;
  bool isPassword;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      controller: controller,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),

        enabled: true,
        filled: true,
        hint: CustomText(text: hintText),
        fillColor: Colors.white,
      ),
    );
  }
}
