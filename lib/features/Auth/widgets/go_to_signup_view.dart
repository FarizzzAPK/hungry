import 'package:flutter/material.dart';
import 'package:hungry/features/auth/views/signup_view.dart';
import 'package:hungry/shared/custom_text.dart';

class GoToSignupView extends StatelessWidget {
  const GoToSignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomText(
          text: "Don't have an account?.. ",
          color: Colors.white,
          size: 13,
        ),
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignupView()),
          ),
          child: CustomText(
            text: "SignUp",
            color: Colors.white,
            size: 15,
            weight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
