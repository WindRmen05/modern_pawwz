// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/pet_profile/pet_profile.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PetProfilePage', () {
    group('route', () {
      test('is routable', () {
        expect(PetProfilePage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders PetProfileView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: PetProfilePage()));
      expect(find.byType(PetProfileView), findsOneWidget);
    });
  });
}
