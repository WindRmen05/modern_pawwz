import 'package:flutter/material.dart';

class ProfileNotifier with ChangeNotifier {
  final String name = "Jane Cooper";
  final String email = "janecooper@example.com";
  final String imageUrl =
      "https://via.placeholder.com/150"; // replace with network image
}
