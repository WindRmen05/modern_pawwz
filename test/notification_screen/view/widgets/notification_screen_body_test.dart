// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/notification_screen/notification_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NotificationScreenBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        Provider(
          create: (context) => ChangeNotifierProvider(create: (_) => NotificationScreenNotifier()),
          child: MaterialApp(home: NotificationScreenBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
