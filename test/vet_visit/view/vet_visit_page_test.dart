// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/vet_visit/vet_visit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('VetVisitPage', () {
    group('route', () {
      test('is routable', () {
        expect(VetVisitPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders VetVisitView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: VetVisitPage()));
      expect(find.byType(VetVisitView), findsOneWidget);
    });
  });
}
