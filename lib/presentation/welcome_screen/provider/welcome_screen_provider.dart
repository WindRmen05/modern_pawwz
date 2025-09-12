import 'package:flutter/material.dart';
import 'package:modern_pawwz/main.dart';
import 'package:modern_pawwz/presentation/main_screen/main_screen.dart';

class WelcomeScreenNotifier extends ChangeNotifier {
  int _currentIndex = 0;

  final List<Map<String, String>> _pages = [
    {
      "image": "assets/images/cat.jpg",
      "title": "Shop the Best for Your Pet",
      "subtitle": "From food to toys, delivered right to your doorstep"
    },
    {
      "image": "assets/images/dog.jpg",
      "title": "Adopt Your New Friend",
      "subtitle": "Find loving companions waiting for a forever home"
    },
    {
      "image": "assets/images/bird.jpg",
      "title": "Care Made Simple",
      "subtitle": "Get expert tips and guides for happy pets"
    },
  ];

  int get currentIndex => _currentIndex;
  Map<String, String> get currentPage => _pages[_currentIndex];
  bool get isLastPage => _currentIndex == _pages.length - 1;

  void nextPage(BuildContext context) {
    if (_currentIndex < _pages.length - 1) {
      _currentIndex++;
      notifyListeners();
    } else {
      // Navigate to home page or dashboard
      Navigator.pushNamedAndRemoveUntil(
        context,
        MainScreenPage.routeName,
        (route) => false,
      );
    }
  }

  init() {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushNamedAndRemoveUntil(
        navigator.currentState!.context,
        MainScreenPage.routeName,
        (route) => false,
      );
    });
  }
}
