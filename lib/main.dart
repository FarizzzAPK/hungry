import 'package:flutter/material.dart';
import 'package:hungry/features/Home/views/home_view.dart';
import 'package:hungry/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});                                                             

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
