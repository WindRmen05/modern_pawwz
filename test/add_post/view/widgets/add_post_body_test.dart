// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/add_post/add_post.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AddPostBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        Provider(
          create: (context) => ChangeNotifierProvider(create: (_) => AddPostNotifier()),
          child: MaterialApp(home: AddPostBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
