import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_constants.dart';
import 'package:hungry/features/auth/data/user_model.dart';
import 'package:hungry/features/auth/widgets/profilr_text_field.dart';

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
    this.selectedImagePath,
  });

  final UserModel userModel;
  final VoidCallback updateUserData;
  final VoidCallback pickImage;
  final bool isLoadingUpdate;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController addressController;
  final TextEditingController visaController;
  final String? selectedImagePath;

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
                Container(
                  height: 110,
                  width: 110,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppConstants().PrimaryColor,
                      width: 2,
                    ),
                  ),
                  child: ClipOval(child: _buildProfileImage()),
                ),
                CircleAvatar(
                  radius: 16,
                  backgroundColor: AppConstants().PrimaryColor,
                  child: const Icon(
                    Icons.camera_alt,
                    size: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ProfileTextField(controller: nameController, label: 'Name', hint: ''),
          const SizedBox(height: 15),
          ProfileTextField(
            controller: emailController,
            label: 'Email',
            hint: '',
          ),
          const SizedBox(height: 15),
          ProfileTextField(
            controller: addressController,
            label: 'Address',
            hint: '',
          ),
          const SizedBox(height: 15),
          ProfileTextField(
            controller: visaController,
            label: 'Card Number',
            hint: '',
          ),
          const SizedBox(height: 25),

          CustomAuthButton(
            buttonText: "Save Changes",
            widget: isLoadingUpdate
                ? CupertinoActivityIndicator(color: AppConstants().PrimaryColor)
                : null,
            onTap: updateUserData,
          ),
        ],
      ),
    );
  }

  Widget _buildProfileImage() {
    if (selectedImagePath != null && selectedImagePath!.isNotEmpty) {
      return Image.file(
        File(selectedImagePath!),
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return const Icon(Icons.error, size: 60, color: Colors.red);
        },
      );
    }

    if (userModel.image != null && userModel.image!.isNotEmpty) {
      return Image.network(
        userModel.image!,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                  : null,
              color: AppConstants().PrimaryColor,
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return const Icon(Icons.error, size: 60, color: Colors.red);
        },
      );
    }
    return Icon(Icons.person, size: 60, color: AppConstants().PrimaryColor);
  }
}
