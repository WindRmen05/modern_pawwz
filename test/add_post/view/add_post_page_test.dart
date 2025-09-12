// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/add_post/add_post.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AddPostPage', () {
    group('route', () {
      test('is routable', () {
        expect(AddPostPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders AddPostView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: AddPostPage()));
      expect(find.byType(AddPostView), findsOneWidget);
    });
  });
}
