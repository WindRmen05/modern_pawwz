// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/pet_profile/pet_profile.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PetProfileBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        Provider(
          create: (context) => ChangeNotifierProvider(create: (_) => PetProfileNotifier()),
          child: MaterialApp(home: PetProfileBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
