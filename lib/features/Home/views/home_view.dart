import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hungry/core/constants/app_constants.dart';
import 'package:hungry/features/Home/widgets/logo_and_profile_img.dart';
import 'package:hungry/features/Home/widgets/search_field.dart';
import 'package:hungry/shared/custom_text.dart';

class HomeView extends StatelessWidget {
   HomeView({super.key});
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal :16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 75,
            ),
            LogoAndProfileImg(),
            CustomText  (text: "Hello, Salem"),
            SizedBox( 
              height: 10,
            ),
SearchField(),
                    ],
        ),
      ),
    );
  }
}