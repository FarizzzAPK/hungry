import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hungry/core/constants/app_constants.dart';

class LogoAndProfileImg extends StatelessWidget {
  const LogoAndProfileImg({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
            SvgPicture.asset(AppConstants().logoPath, height: 40,color: AppConstants().PrimaryColor),
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/images/WhatsApp Image 2026-01-18 at 8.40.57 PM.jpeg'),),
                    ],
            );
  }
}