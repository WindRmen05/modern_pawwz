import 'package:flutter/material.dart';

class MainScreenNotifier with ChangeNotifier {
  int selectedIndex = 0;

  final List<String> icons = [
    'assets/icons/home',
    'assets/icons/shop',
    'assets/icons/add',
    'assets/icons/person',
    'assets/icons/more',
  ];

  final List<String> labels = [
    'Home',
    'Shop',
    'Add',
    'Profile',
    'More',
  ];

  refresh() {
    notifyListeners();
  }

}
