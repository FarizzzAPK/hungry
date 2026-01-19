import 'package:flutter/material.dart';
import 'package:hungry/shared/custom_text.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: CustomText(text: "Profile Screen")),
    );
  }
}
