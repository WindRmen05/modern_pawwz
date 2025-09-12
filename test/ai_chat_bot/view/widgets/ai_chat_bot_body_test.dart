// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/ai_chat_bot/ai_chat_bot.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AiChatBotBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        Provider(
          create: (context) => ChangeNotifierProvider(create: (_) => AiChatBotNotifier()),
          child: MaterialApp(home: AiChatBotBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
