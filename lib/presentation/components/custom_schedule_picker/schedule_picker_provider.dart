import 'package:flutter/material.dart';

class TimeSlot {
  final String time;
  final bool isAvailable;
  final bool isBooked;

  TimeSlot({required this.time, this.isAvailable = true, this.isBooked = false});
}

class ScheduleProvider with ChangeNotifier {
  DateTime _selectedDate = DateTime.now();
  String? _selectedTime;

  DateTime get selectedDate => _selectedDate;
  String? get selectedTime => _selectedTime;

  void setDate(DateTime date) {
    _selectedDate = date;
    _selectedTime = null;
    notifyListeners();
  }

  void setTime(String time) {
    _selectedTime = time;
    notifyListeners();
  }

  // Example slots (could be fetched from API)
  List<TimeSlot> getSlots(DateTime date) {
    return [
      TimeSlot(time: "04:00 PM", isAvailable: true),
      TimeSlot(time: "05:00 PM", isAvailable: true),
      TimeSlot(time: "05:30 PM", isAvailable: true, isBooked: true),
      TimeSlot(time: "06:00 PM", isAvailable: false),
      TimeSlot(time: "07:00 PM", isAvailable: true),
      TimeSlot(time: "07:30 PM", isAvailable: false),
      TimeSlot(time: "08:00 PM", isAvailable: true),
      TimeSlot(time: "09:00 PM", isAvailable: true),
      TimeSlot(time: "09:30 PM", isAvailable: true),
      TimeSlot(time: "10:00 PM", isAvailable: true),
    ];
  }
}
