import 'package:flutter/material.dart';
import 'package:hungry/features/Auth/views/login_view.dart';
import 'package:hungry/shared/custom_text.dart';

class GoToLoginView extends StatelessWidget {
  const GoToLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "Already have an account..? ",
                      color: Colors.white,
                      size: 13,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginView()),
                      ),
                      child: CustomText(
                        text: "Login",
                        color: Colors.white,
                        size: 15,
                        weight: FontWeight.bold,
                      ),
                    ),
                  ],
                );
  }
}