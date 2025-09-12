import 'package:flutter/material.dart';
import 'package:modern_pawwz/main.dart';
import 'package:modern_pawwz/presentation/main_screen/main_screen.dart';

class SplashScreenNotifier with ChangeNotifier {
  init() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
        navigator.currentState!.context,
        MainScreenPage.routeName,
        (route) => false,
      );
    });
  }
}
