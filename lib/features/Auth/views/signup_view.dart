import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hungry/core/constants/app_constants.dart';
import 'package:hungry/core/network/api_error.dart';
import 'package:hungry/features/auth/data/auth_repo.dart';
import 'package:hungry/features/auth/widgets/custom_auth_button.dart';
import 'package:hungry/features/auth/widgets/go_to_login_view.dart';
import 'package:hungry/root.dart';
import 'package:hungry/shared/custom_snack.dart';
import 'package:hungry/shared/custom_text.dart';
import 'package:hungry/shared/custom_text_form_field.dart';

class SignupView extends StatefulWidget {
  SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;

  AuthRepo authRepo = AuthRepo();
  Future<void> signup() async {
    if (!formKey.currentState!.validate()) return;

    setState(() => isLoading = true);
    try {
      final user = await authRepo.signup(
        nameController.text.trim(),
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => Root()),
        );
      }
    } catch (e) {
      String errMsg = 'Error in Register';
      if (e is ApiError) errMsg = e.message;
      ScaffoldMessenger.of(context).showSnackBar(customSnack(errMsg));
    } finally {
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
                  SizedBox(height: 200),
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
                    controller: nameController,
                    hintText: "Name",
                    isPassword: false,
                  ),
                  SizedBox(height: 15),
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
                    buttonText: "Sign Up",
                    widget: isLoading
                        ? CupertinoActivityIndicator(
                      color: AppConstants().PrimaryColor,
                    )
                        : null,
                    onTap: signup,
                  ),                SizedBox(height: 15),
                  GoToLoginView(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
