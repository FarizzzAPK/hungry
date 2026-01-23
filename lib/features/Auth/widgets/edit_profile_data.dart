import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_constants.dart';
import 'package:hungry/features/auth/data/user_model.dart';
import 'package:hungry/features/auth/widgets/profilr_text_field.dart';
import 'package:hungry/shared/custom_button.dart';

import 'custom_auth_button.dart';

class EditProfileData extends StatelessWidget {
  const EditProfileData({
    super.key,
    required this.userModel,
    required this.isLoadingUpdate,
    required this.updateUserData,
    required this.pickImage,
    required this.nameController,
    required this.emailController,
    required this.addressController,
    required this.visaController,
  });

  final UserModel userModel;
  final VoidCallback updateUserData;
  final VoidCallback pickImage;
  final bool isLoadingUpdate;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController addressController;
  final TextEditingController visaController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          GestureDetector(
            onTap: pickImage,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                ClipOval(
                  child: Container(
                    height: 110,
                    width: 110,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppConstants().PrimaryColor,
                        width: 2,
                      ),
                    ),
                    child: userModel.image != null &&
                        userModel.image!.isNotEmpty
                        ? Image.network(
                      userModel.image!,
                      fit: BoxFit.cover,
                    )
                        : const Icon(Icons.person, size: 60),
                  ),
                ),
                CircleAvatar(
                  radius: 16,
                  backgroundColor: AppConstants().PrimaryColor,
                  child: const Icon(Icons.camera_alt,
                      size: 16, color: Colors.white),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ProfileTextField(
            controller: nameController,
            label: 'Name', hint: '',
          ),
          const SizedBox(height: 15),
          ProfileTextField(
            controller: emailController,
            label: 'Email', hint: '',
          ),
          const SizedBox(height: 15),
          ProfileTextField(
            controller: addressController,
            label: 'Address', hint: '',
          ),
          const SizedBox(height: 15),
          ProfileTextField(
            controller: visaController,
            label: 'Card Number', hint: '',
          ),
          const SizedBox(height: 25),

          CustomAuthButton(
            buttonText: "Save Changes",
            widget: isLoadingUpdate
                ? CupertinoActivityIndicator(
              color: AppConstants().PrimaryColor,
            )
                : null,
            onTap: updateUserData,
          ),
          // CustomButton(
          //   onTap: updateUserData,
          //   buttonText: 'Save Changes',
          //   width: double.infinity,
          //   height: 70,
          //   size: 18,
          // ),
        ],
      ),
    );
  }
}
