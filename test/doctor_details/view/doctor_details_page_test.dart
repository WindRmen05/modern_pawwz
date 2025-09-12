// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/doctor_details/doctor_details.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DoctorDetailsPage', () {
    group('route', () {
      test('is routable', () {
        expect(DoctorDetailsPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders DoctorDetailsView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: DoctorDetailsPage()));
      expect(find.byType(DoctorDetailsView), findsOneWidget);
    });
  });
}
