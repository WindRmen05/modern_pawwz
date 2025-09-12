import 'dart:async';
import 'package:flutter/material.dart';

class PetEvent {
  final String title;
  final String subtitle;
  final String price;
  final String date;
  final String location;
  final String description;
  final String image;

  PetEvent({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.date,
    required this.location,
    required this.description,
    required this.image,
  });
}

class PetEventNotifier with ChangeNotifier {
  final List<PetEvent> _events = [
    PetEvent(
      title: "Pet Adoption Fair",
      subtitle: "Adopt a Friend",
      price: "Free Entry",
      date: "SEP 20",
      location: "Central Park",
      description:
      "Join us at the Pet Adoption Fair where dozens of adorable pets are waiting to find their forever homes.",
      image: "assets/images/dog.jpg",
    ),
    PetEvent(
      title: "Dog Show 2024",
      subtitle: "Best Breeds Contest",
      price: "₹499",
      date: "OCT 10",
      location: "City Arena",
      description:
      "Witness the most exciting dog show with trained pets, breed competitions, and fun family activities.",
      image: "assets/images/dog.jpg",
    ),
    PetEvent(
      title: "Pet Care Workshop",
      subtitle: "Learn from Experts",
      price: "₹299",
      date: "NOV 5",
      location: "Pet World Center",
      description:
      "Attend our Pet Care Workshop where vets and trainers will guide you on health, diet, and grooming of pets.",
      image: "assets/images/dog.jpg",
    ),
  ];

  List<PetEvent> get events => _events;

  late PageController pageController;
  Timer? _timer;
  int _currentPage = 0;

  int get currentPage => _currentPage;

  EventNotifier() {
    pageController = PageController();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentPage < _events.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      notifyListeners();
    });
  }

  void setPage(int index) {
    _currentPage = index;
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    pageController.dispose();
    super.dispose();
  }
}
