import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_constants.dart';
import 'package:hungry/features/auth/data/user_model.dart';
import 'package:hungry/features/auth/widgets/custom_data_container.dart';
import 'package:hungry/features/auth/widgets/glass_visa_card.dart';
import 'package:hungry/shared/custom_glassy_button.dart';

class ProfileDataReadOnly extends StatelessWidget {
  const ProfileDataReadOnly({
    super.key,
    required this.userModel,
    required this.logout,
    required this.onEdit,
  });

  final UserModel userModel;
  final VoidCallback logout;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    final app = AppConstants();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          ClipOval(
            child: Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                shape: BoxShape.circle,
              ),
              child: userModel.image != null &&
                  userModel.image!.isNotEmpty
                  ? Image.network(
                userModel.image!,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) =>
                const Icon(Icons.person, size: 60),
              )
                  : const Icon(Icons.person, size: 60),
            ),
          ),
          const SizedBox(height: 20),
          CustomDataContainer(
          textColor: Colors.black, iconColor: Colors.black,
            text: userModel.email ?? '',
            icon: Icons.email_outlined,
          ),
          const SizedBox(height: 15),
          CustomDataContainer(
            text: userModel.name ?? '',
            icon: Icons.person_outline,
            textColor: Colors.black, iconColor: Colors.black,
          ),
          const SizedBox(height: 15),
          CustomDataContainer(
            text: userModel.address?.isNotEmpty == true
                ? userModel.address!
                : "—",
            icon: Icons.location_on_outlined, textColor: Colors.black, iconColor: Colors.black,
          ),
          const SizedBox(height: 15),
          GlassVisaCard(
            cardNumber: userModel.visa?.isNotEmpty == true
                ? userModel.visa!
                : "**** **** **** ****",
            cardHolder: userModel.name ?? '',
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: CustomGlassyButton(
                  onTap: onEdit,
                  text: "Edit Profile",
                  icon: Icons.edit,
                  textColor: app.PrimaryColor,
                  iconColor: app.PrimaryColor,
                  height: 60, textSize: 18, textWeight: FontWeight.bold, width: 140,
                ),
              ),
              const SizedBox(width: 15),
              CustomGlassyButton(
                onTap: logout,
                text: "Log out",
                icon: Icons.logout,
                textColor: Colors.red,
                iconColor: Colors.red,
                height: 60,
                width: 150, textSize: 18, textWeight: FontWeight.bold,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
