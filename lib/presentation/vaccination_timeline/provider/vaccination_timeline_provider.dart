import 'package:flutter/material.dart';

/// Model for Vaccination Data
class Vaccination {
  final String title;
  final DateTime date;
  final String status;
  final List<String> extraDetails;

  Vaccination({
    required this.title,
    required this.date,
    required this.status,
    this.extraDetails = const [],
  });
}

/// Provider for managing vaccination data and selected date
class VaccinationTimelineNotifier with ChangeNotifier {
  DateTime _selectedDate = DateTime.now();
  DateTime get selectedDate => _selectedDate;

  final List<Vaccination> _vaccinations = [
    Vaccination(
      title: "Rabies Vaccine",
      date: DateTime(2025, 9, 20),
      status: "Completed",
      extraDetails: ["Tooth Checkup"],
    ),
    Vaccination(
      title: "Deworming",
      date: DateTime(2025, 9, 21),
      status: "Upcoming",
    ),
    Vaccination(
      title: "Parvo Vaccine",
      date: DateTime(2025, 9, 23),
      status: "Overdue",
      extraDetails: ["General Health Check"],
    ),
  ];

  List<Vaccination> get vaccinationsForSelectedDate {
    return _vaccinations
        .where((v) =>
            v.date.year == _selectedDate.year &&
            v.date.month == _selectedDate.month &&
            v.date.day == _selectedDate.day)
        .toList();
  }

  void changeDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }
}
