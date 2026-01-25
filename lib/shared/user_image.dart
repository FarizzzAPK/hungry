import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungry/features/auth/data/user_model.dart';

import '../core/constants/app_constants.dart';

class UserImage extends StatelessWidget {
  const UserImage({
    super.key,
    required this.userModel,
    this.size = 55,
  });
  final UserModel? userModel;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppConstants().PrimaryColor,
          width: 2,
        ),
      ),
      child: ClipOval(
        child: userModel?.image != null && userModel!.image!.isNotEmpty
            ? Image.network(
          userModel!.image!,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CupertinoActivityIndicator(
                color: AppConstants().PrimaryColor,
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return Icon(
              Icons.person,
              size: size * 0.6,
              color: AppConstants().PrimaryColor,
            );
          },
        )
            : Icon(
          Icons.person,
          size: size * 0.6,
          color: AppConstants().PrimaryColor,
        ),
      ),
    );
  }
}
