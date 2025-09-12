// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/ai_chat_bot/ai_chat_bot.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AiChatBotPage', () {
    group('route', () {
      test('is routable', () {
        expect(AiChatBotPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders AiChatBotView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: AiChatBotPage()));
      expect(find.byType(AiChatBotView), findsOneWidget);
    });
  });
}
