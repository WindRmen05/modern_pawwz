import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/doctor_listing/doctor_listing.dart';

class DoctorDetailsNotifier with ChangeNotifier {

  Doctor? doctor;
  init(Doctor data) {
    doctor = data;
    notifyListeners();
  }
}
