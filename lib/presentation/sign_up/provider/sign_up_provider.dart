import 'package:flutter/material.dart';
import 'package:modern_pawwz/main.dart';
import 'package:modern_pawwz/presentation/pet_profile/view/pet_profile_page.dart';

class SignUpNotifier with ChangeNotifier {
  String name = "";
  String email = "";
  String password = "";
  bool obscurePassword = true;

  void setName(String value) {
    name = value;
    notifyListeners();
  }

  void setEmail(String value) {
    email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    password = value;
    notifyListeners();
  }

  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  void signup() {
    debugPrint("Signing up with: $name, $email, $password");
    Navigator.pushNamed(
        navigator.currentState!.context, PetProfilePage.routeName);
  }

}
