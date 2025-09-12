// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/doctor_listing/doctor_listing.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DoctorListingPage', () {
    group('route', () {
      test('is routable', () {
        expect(DoctorListingPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders DoctorListingView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: DoctorListingPage()));
      expect(find.byType(DoctorListingView), findsOneWidget);
    });
  });
}
