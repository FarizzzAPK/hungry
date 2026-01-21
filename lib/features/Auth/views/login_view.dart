import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hungry/core/constants/app_constants.dart';
import 'package:hungry/core/network/api_error.dart';
import 'package:hungry/features/auth/data/auth_repo.dart';
import 'package:hungry/features/auth/widgets/custom_auth_button.dart';
import 'package:hungry/features/auth/widgets/go_to_signup_view.dart';
import 'package:hungry/root.dart';
import 'package:hungry/shared/custom_snack.dart';
import 'package:hungry/shared/custom_text.dart';
import 'package:hungry/shared/custom_text_form_field.dart';

class LoginView extends StatefulWidget {
  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  final authRepo = AuthRepo();

  Future<void> login() async {
    log("done10");
    if (!formKey.currentState!.validate()) return;
    setState(() => isLoading = true);
    try {
      final user = await authRepo.login(
        emailController.text.trim(),
        passwordController.text.trim(),
      );
      if (user != null) Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) =>  Root()));
      log("done");
    } catch (e) {
      log("error1");
      ScaffoldMessenger.of(context).showSnackBar(
        customSnack(e is ApiError ? e.message : 'Unhandled login error'),
      );
    } finally {
      log("done2");
      setState(() => isLoading = false);
    }
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Color(0xff08431D),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 250),
                  Center(
                    child: SvgPicture.asset(AppConstants().logoPath, height: 50),
                  ),
                  SizedBox(height: 10),
                  CustomText(
                    text: "Welcome to the best fast food App",
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
                  CustomAuthButton(
                    buttonText: "Login",
                    widget: isLoading
                        ? CupertinoActivityIndicator(
                      color: AppConstants().PrimaryColor,
                    )
                        : null,
                    onTap: login,
                  ),

                  SizedBox(height: 15),
                  GoToSignupView(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
