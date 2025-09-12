import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class Doctor {
  final String name;
  final String specialty;
  final double rating;
  final int reviews;
  final double distance;
  final bool availableRemotely;
  final bool remoteOnly;
  final List<Map<String, dynamic>> availability;

  Doctor({
    required this.name,
    required this.specialty,
    required this.rating,
    required this.reviews,
    required this.distance,
    required this.availableRemotely,
    required this.remoteOnly,
    required this.availability,
  });
}

class DoctorListingNotifier with ChangeNotifier {
  final List<Doctor> _doctors = [
    Doctor(
      name: "Dr. Azunyan U. Wu",
      specialty: "Cardiologist",
      rating: 4.5,
      reviews: 23,
      distance: 0.5,
      availableRemotely: true,
      remoteOnly: false,
      availability: [
        {"date": "Mar 11", "status": true},
        {"date": "Mar 12", "status": false},
        {"date": "Mar 13", "status": true},
      ],
    ),
    Doctor(
      name: "Dr. Taylor Green",
      specialty: "Cardiologist",
      rating: 4.5,
      reviews: 1258,
      distance: 22,
      availableRemotely: true,
      remoteOnly: false,
      availability: [
        {"date": "Mar 11", "status": true},
        {"date": "Mar 12", "status": true},
        {"date": "Mar 13", "status": false},
      ],
    ),
    Doctor(
      name: "Dr. Kenzo Tenma",
      specialty: "Cardiologist",
      rating: 1.5,
      reviews: 500,
      distance: 0.5,
      availableRemotely: false,
      remoteOnly: true,
      availability: [
        {"date": "Mar 11", "status": false},
        {"date": "Mar 12", "status": true},
        {"date": "Mar 13", "status": true},
      ],
    ),
  ];

  List<Doctor> get doctors => _doctors;
}

