import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_constants.dart';
import 'package:hungry/core/network/api_error.dart';
import 'package:hungry/core/utils/pref_helper.dart';
import 'package:hungry/features/auth/data/auth_repo.dart';
import 'package:hungry/features/auth/data/user_model.dart';
import 'package:hungry/features/auth/views/login_view.dart';
import 'package:hungry/features/auth/widgets/edit_profile_data.dart';
import 'package:hungry/features/auth/widgets/profile_data_read_only.dart';
import 'package:hungry/shared/custom_button.dart';
import 'package:hungry/shared/custom_snack.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../shared/custom_text.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _visa = TextEditingController();

  bool isGuest = false;
  bool isEditing = false;
  bool isLoadingUpdate = false;
  bool isLoadingLogout = false;

  UserModel? userModel;
  String? selectedImage;

  final AuthRepo authRepo = AuthRepo();

  @override
  void initState() {
    super.initState();
    autoLogin();
    getProfileData();
    PrefHelper.requestGalleryPermission();
  }

  Future<void> autoLogin() async {
    await authRepo.autoLogin();
    setState(() => isGuest = authRepo.isGuest);
  }

  Future<void> getProfileData() async {
    try {
      final user = await authRepo.getProfileData();
      if (!mounted) return;

      setState(() {
        userModel = user;
        _name.text = user?.name ?? '';
        _email.text = user?.email ?? '';
        _address.text = user?.address ?? '';
        _visa.text = user?.visa ?? '';
      });

      if (user != null) {
        log(user.name ?? '');
        log(user.email ?? '');
      }
    } catch (e) {
      String errorMsg = 'Error loading profile';
      if (e is ApiError) errorMsg = e.message;
      ScaffoldMessenger.of(context).showSnackBar(customSnack(errorMsg));
    }
  }

  Future<void> pickImage() async {
    if (!isEditing) return;
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() => selectedImage = picked.path);
    }
  }

  Future<void> updateProfileData() async {
    if (isLoadingUpdate) return ;

    setState(() => isLoadingUpdate = true);
    try {
      final user = await authRepo.updateProfileData(
        name: _name.text.trim(),
        email: _email.text.trim(),
        address: _address.text.trim(),
        visa: _visa.text.trim(),
        imagePath: selectedImage,
      );

      if (!mounted) return;

      setState(() {
        userModel = user;
        isEditing = false;
        isLoadingUpdate = false;
      });

      ScaffoldMessenger.of(context)
          .showSnackBar(customSnack('Profile updated successfully'));
    } catch (e) {
      if (!mounted) return;
      setState(() => isLoadingUpdate = false);

      String errorMsg = 'Failed to update profile';
      if (e is ApiError) errorMsg = e.message;
      ScaffoldMessenger.of(context).showSnackBar(customSnack(errorMsg));
    }
  }

  Future<void> logout() async {
    try {
      setState(() => isLoadingLogout = true);
      await authRepo.logout();
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) =>  LoginView()),
      );
    } finally {
      if (mounted) setState(() => isLoadingLogout = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isGuest) {
      return Scaffold(
        body: Center(
          child: CustomButton(
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) =>  LoginView()),
            ),
            buttonText: 'Go to Login',
            width: 200,
            height: 70,
            size: 15,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: CustomText(
          text: "Profile Details",
          color: AppConstants().PrimaryColor,
          size: 20,
          weight: FontWeight.bold,
        ),
        actions: [
          IconButton(
            icon: Icon(
              isEditing ? Icons.close : Icons.edit,
              color: AppConstants().PrimaryColor,
            ),
            onPressed: () => setState(() => isEditing = !isEditing),
          ),
        ],
      ),
      body: Skeletonizer(
        enabled: userModel == null,
        child: userModel == null
            ? const SizedBox()
            : isEditing
            ? EditProfileData(
          isLoadingUpdate: isLoadingUpdate,
          userModel: userModel!,
          updateUserData: updateProfileData,
          pickImage: pickImage,
          nameController: _name,
          emailController: _email,
          addressController: _address,
          visaController: _visa,
        )
            : ProfileDataReadOnly(
          userModel: userModel!,
          logout: logout,
          onEdit: () => setState(() => isEditing = true),
        ),
      ),
    );
  }
}
