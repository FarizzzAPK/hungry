import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_constants.dart';

class ProfileTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final bool obscureText;

  const ProfileTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: TextStyle(color: AppConstants().PrimaryColor),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: AppConstants().PrimaryColor),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey.shade300),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppConstants().PrimaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppConstants().PrimaryColor),
        ),
        prefixIcon: obscureText
            ? Icon(Icons.lock, color: AppConstants().PrimaryColor)
            : null,
      ),
    );
  }
}
