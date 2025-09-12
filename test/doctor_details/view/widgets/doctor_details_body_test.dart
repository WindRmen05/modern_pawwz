// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/doctor_details/doctor_details.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DoctorDetailsBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        Provider(
          create: (context) => ChangeNotifierProvider(create: (_) => DoctorDetailsNotifier()),
          child: MaterialApp(home: DoctorDetailsBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
