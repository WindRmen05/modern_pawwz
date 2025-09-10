// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/home_screen/home_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomeScreenPage', () {
    group('route', () {
      test('is routable', () {
        expect(HomeScreenPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders HomeScreenView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: HomeScreenPage()));
      expect(find.byType(HomeScreenView), findsOneWidget);
    });
  });
}
