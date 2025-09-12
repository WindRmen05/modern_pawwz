// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/doctor_listing/doctor_listing.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DoctorListingBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        Provider(
          create: (context) => ChangeNotifierProvider(create: (_) => DoctorListingNotifier()),
          child: MaterialApp(home: DoctorListingBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
