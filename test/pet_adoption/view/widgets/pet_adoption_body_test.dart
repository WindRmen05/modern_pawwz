// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/pet_adoption/pet_adoption.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PetAdoptionBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        Provider(
          create: (context) => ChangeNotifierProvider(create: (_) => PetAdoptionNotifier()),
          child: MaterialApp(home: PetAdoptionBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
