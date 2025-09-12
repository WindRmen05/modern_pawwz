import 'package:flutter/material.dart';

class HomeScreenNotifier with ChangeNotifier {
  String petName = "Bella";
  int vaccinesTaken = 5;
  int vaccinesPending = 2;
  double healthScore = 82; // out of 100

  List<String> banners = [
    "assets/images/poster1.png",
    "assets/images/poster2.png",
    "assets/images/poster3.png",
    "assets/images/poster4.png",
  ];

  List<Map<String, dynamic>> services = [
    {"icon": Icons.vaccines, "label": "Vaccination"},
    {"icon": Icons.local_hospital, "label": "Vet Visit"},
    {"icon": Icons.shopping_bag, "label": "Shop"},
    {"icon": Icons.event, "label": "Events"},
    {"icon": Icons.pets, "label": "Adoption"},
    {"icon": Icons.health_and_safety, "label": "Tips"},
  ];

  List<Map<String, dynamic>> services1 = [
    {
      "icon": "assets/images/injection.png",
      "label": "Vaccination",
      "color": Color(0xFFFFD6D6), // pastel pink
    },
    {
      "icon": "assets/images/veterinarian.png",
      "label": "Vet Visit",
      "color": Color(0xFFD6EFFF), // pastel blue
    },
    {
      "icon": "assets/images/shop.png",
      "label": "Shop",
      "color": Color(0xFFFFF5D6), // pastel yellow
    },
    {
      "icon": "assets/images/calendar.png",
      "label": "Events",
      "color": Color(0xFFE8FFD6), // pastel green
    },
    {
      "icon": "assets/images/adoption.png",
      "label": "Adoption",
      "color": Color(0xFFE8D6FF), // pastel purple
    },
    {
      "icon": "assets/images/medical-robot.png",
      "label": "Tips",
      "color": Color(0xFFFFE6D6), // pastel orange
    },
  ];
}
