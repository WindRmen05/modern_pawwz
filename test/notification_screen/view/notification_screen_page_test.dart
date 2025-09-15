// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/notification_screen/notification_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NotificationScreenPage', () {
    group('route', () {
      test('is routable', () {
        expect(NotificationScreenPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders NotificationScreenView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: NotificationScreenPage()));
      expect(find.byType(NotificationScreenView), findsOneWidget);
    });
  });
}
