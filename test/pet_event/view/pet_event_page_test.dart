// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/pet_event/pet_event.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PetEventPage', () {
    group('route', () {
      test('is routable', () {
        expect(PetEventPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders PetEventView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: PetEventPage()));
      expect(find.byType(PetEventView), findsOneWidget);
    });
  });
}
