// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/splash_screen/splash_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SplashScreenBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        Provider(
          create: (context) => ChangeNotifierProvider(create: (_) => SplashScreenNotifier()),
          child: MaterialApp(home: SplashScreenBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
