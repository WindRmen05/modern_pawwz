// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/welcome_screen/welcome_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WelcomeScreenBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        Provider(
          create: (context) => ChangeNotifierProvider(create: (_) => WelcomeScreenNotifier()),
          child: MaterialApp(home: WelcomeScreenBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
