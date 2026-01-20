import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_constants.dart';
import 'package:hungry/features/auth/widgets/Button_row.dart';
import 'package:hungry/features/auth/widgets/payment_card.dart';
import 'package:hungry/features/auth/widgets/profilr_text_field.dart';
import 'package:hungry/shared/custom_text.dart';


class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:16.0,vertical: 25),
                child: CustomText(text: "Profile Details",color: AppConstants().PrimaryColor,size: 25,weight: FontWeight.bold,),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/salem.jpeg'),
                  ),
                  const SizedBox(height: 25),
                  ProfileTextField(
                      label: "Name",
                      hint: "Farizzz",
                      controller: nameController),
                  const SizedBox(height: 15),
                  ProfileTextField(
                      label: "Email",
                      hint: "Farizzz@gmail.com",
                      controller: emailController),
                  const SizedBox(height: 15),
                  ProfileTextField(
                      label: "Delivery address",
                      hint: "Giza",
                      controller: addressController),
                  const SizedBox(height: 15),
                  ProfileTextField(
                      label: "Password",
                      hint: "********",
                      controller: passwordController,
                      obscureText: true),
                  const SizedBox(height: 100),
                  const PaymentCard(),
                  const SizedBox(height: 16),
                  ButtonRow(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
