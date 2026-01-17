import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hungry/core/constants/app_constants.dart';
import 'package:hungry/features/Auth/views/login_view.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {

    Timer(
            Duration(seconds: 1),
                () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => LoginView())));
    return Container(
      color: Color(0xff08431D),
      child: Column(
        children: [
          SizedBox(
            height: 300,
          ),
          SvgPicture.asset(AppConstants().logoPath,height: 50,),
          Spacer(),
          Image.asset(AppConstants().splashBurger)
        ],
      ),
    );
  }
}