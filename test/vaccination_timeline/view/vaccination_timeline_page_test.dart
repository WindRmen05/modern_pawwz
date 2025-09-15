// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/vaccination_timeline/vaccination_timeline.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('VaccinationTimelinePage', () {
    group('route', () {
      test('is routable', () {
        expect(VaccinationTimelinePage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders VaccinationTimelineView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: VaccinationTimelinePage()));
      expect(find.byType(VaccinationTimelineView), findsOneWidget);
    });
  });
}
