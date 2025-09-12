// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/vet_visit/vet_visit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('VetVisitBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        Provider(
          create: (context) => ChangeNotifierProvider(create: (_) => VetVisitNotifier()),
          child: MaterialApp(home: VetVisitBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
