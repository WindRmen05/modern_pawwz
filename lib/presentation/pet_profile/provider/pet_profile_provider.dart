import 'package:flutter/material.dart';

class PetProfileNotifier with ChangeNotifier {
  final PageController pageController = PageController();
  int _currentPage = 0;

  int get currentPage => _currentPage;

  void setPage(int index) {
    _currentPage = index;
    notifyListeners();
  }

  void nextPage() {
    if (_currentPage < 4) {
      pageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    }
  }

  void previousPage() {
    if (_currentPage > 0) {
      pageController.previousPage(duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    }
  }
}
