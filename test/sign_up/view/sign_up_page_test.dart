// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/sign_up/sign_up.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SignUpPage', () {
    group('route', () {
      test('is routable', () {
        expect(SignUpPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders SignUpView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: SignUpPage()));
      expect(find.byType(SignUpView), findsOneWidget);
    });
  });
}
