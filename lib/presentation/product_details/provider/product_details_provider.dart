import 'package:flutter/material.dart';

class ProductDetailsNotifier with ChangeNotifier {
  final String title = "DR CRZ Jacket";
  final String subtitle = "Leather Jacket";
  final double price = 69.00;
  final double rating = 4.9;
  final int reviews = 1283;
  final List<String> images = [
    "https://via.placeholder.com/300x300.png?text=Jacket+1",
    "https://via.placeholder.com/300x300.png?text=Jacket+2",
    "https://via.placeholder.com/300x300.png?text=Jacket+3",
    "https://via.placeholder.com/300x300.png?text=Jacket+4",
  ];
  final List<String> sizes = ["S", "M", "L", "XL", "XXL"];

  String _selectedSize = "M";
  String get selectedSize => _selectedSize;

  void selectSize(String size) {
    _selectedSize = size;
    notifyListeners();
  }
}
