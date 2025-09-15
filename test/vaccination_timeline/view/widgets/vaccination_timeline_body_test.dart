// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/vaccination_timeline/vaccination_timeline.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('VaccinationTimelineBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        Provider(
          create: (context) => ChangeNotifierProvider(create: (_) => VaccinationTimelineNotifier()),
          child: MaterialApp(home: VaccinationTimelineBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
