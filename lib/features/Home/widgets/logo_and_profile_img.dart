import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hungry/core/constants/app_constants.dart';
import 'package:hungry/features/auth/data/user_model.dart';
import 'package:hungry/shared/user_image.dart';

class LogoAndProfileImg extends StatelessWidget {

   LogoAndProfileImg({super.key, this.userModel});
  AppConstants appConstants = AppConstants();
  final UserModel? userModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(
          AppConstants().logoPath,
          height: 40,
          color: appConstants.PrimaryColor,
        ),

        userModel == null
            ? const CircleAvatar(
          radius: 20,
          backgroundColor: Colors.grey,
          child: Icon(Icons.person, color: Colors.white),
        )
            : UserImage(userModel: userModel!)
      ],
    );
  }
}

