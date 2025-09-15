import 'package:flutter/material.dart';

class Pet {
  final String name;
  final String imageUrl;
  final String distance;
  final bool isFree;
  final bool hasCertificate;

  Pet({
    required this.name,
    required this.imageUrl,
    required this.distance,
    required this.isFree,
    required this.hasCertificate,
  });
}

class PetAdoptionNotifier with ChangeNotifier {
  final List<Pet> _pets = [
    Pet(
      name: "Golden Retriever",
      imageUrl: "https://images.unsplash.com/photo-1558788353-f76d92427f16",
      distance: "Near 15km",
      isFree: false,
      hasCertificate: true,
    ),
    Pet(
      name: "German Shepherd",
      imageUrl: "https://images.unsplash.com/photo-1560807707-8cc77767d783",
      distance: "Near 10km",
      isFree: true,
      hasCertificate: false,
    ),
    Pet(
      name: "Persian Cat",
      imageUrl: "https://images.unsplash.com/photo-1592194996308-7b43878e84a6",
      distance: "Near 8km",
      isFree: false,
      hasCertificate: true,
    ),
  ];

  List<Pet> get pets => _pets;
}
