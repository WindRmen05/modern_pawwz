// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/welcome_screen/welcome_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WelcomeScreenPage', () {
    group('route', () {
      test('is routable', () {
        expect(WelcomeScreenPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders WelcomeScreenView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: WelcomeScreenPage()));
      expect(find.byType(WelcomeScreenView), findsOneWidget);
    });
  });
}
