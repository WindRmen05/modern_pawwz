// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/main_screen/main_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MainScreenBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        Provider(
          create: (context) => ChangeNotifierProvider(create: (_) => MainScreenNotifier()),
          child: MaterialApp(home: MainScreenBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
