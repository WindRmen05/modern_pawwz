// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/pet_event/pet_event.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PetEventBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        Provider(
          create: (context) => ChangeNotifierProvider(create: (_) => PetEventNotifier()),
          child: MaterialApp(home: PetEventBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
