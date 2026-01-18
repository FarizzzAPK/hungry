import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hungry/core/constants/app_constants.dart';
import 'package:hungry/features/auth/views/signup_view.dart';
import 'package:hungry/features/auth/widgets/custom_auth_button.dart';
import 'package:hungry/features/auth/widgets/go_to_signup_view.dart';
import 'package:hungry/shared/custom_text.dart';
import 'package:hungry/shared/custom_text_form_field.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Color(0xff08431D),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 250),
                Center(
                  child: SvgPicture.asset(AppConstants().logoPath, height: 50),
                ),
                SizedBox(height: 10),
                CustomText(
                  text: "Welcome to teh best fastfood App",
                  color: Colors.white,
                  size: 13,
                  weight: FontWeight.w300,
                ),
                SizedBox(height: 50),
                CustomTextFormField(
                  controller: emailController,
                  hintText: "Email",
                  isPassword: false,
                ),
                SizedBox(height: 15),
                CustomTextFormField(
                  controller: passwordController,
                  hintText: "Password",
                  isPassword: true,
                ),
                SizedBox(height: 15),
                CustomAuthButton(buttonText: "Login", onTap: () {}),
                SizedBox(height: 15),
                GoToSignupView()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
