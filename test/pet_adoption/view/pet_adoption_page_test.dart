// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/pet_adoption/pet_adoption.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PetAdoptionPage', () {
    group('route', () {
      test('is routable', () {
        expect(PetAdoptionPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders PetAdoptionView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: PetAdoptionPage()));
      expect(find.byType(PetAdoptionView), findsOneWidget);
    });
  });
}
