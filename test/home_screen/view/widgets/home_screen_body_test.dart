// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/home_screen/home_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomeScreenBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        Provider(
          create: (context) => ChangeNotifierProvider(create: (_) => HomeScreenNotifier()),
          child: MaterialApp(home: HomeScreenBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
