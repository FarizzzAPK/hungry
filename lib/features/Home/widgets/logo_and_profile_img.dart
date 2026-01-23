import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hungry/core/constants/app_constants.dart';
import 'package:hungry/features/auth/data/user_model.dart';
import 'package:hungry/shared/user_image.dart';

class LogoAndProfileImg extends StatelessWidget {
   LogoAndProfileImg({super.key,required this.userModel,});
   final UserModel? userModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(
          AppConstants().logoPath,
          height: 40,
          color: AppConstants().PrimaryColor,
        ),
        UserImage(userModel: userModel!,)
      ],
    );
  }
}
