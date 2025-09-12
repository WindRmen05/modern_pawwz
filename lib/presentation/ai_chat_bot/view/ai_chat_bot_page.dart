import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/ai_chat_bot/provider/provider.dart';
import 'package:modern_pawwz/presentation/ai_chat_bot/widgets/ai_chat_bot_body.dart';

class AiChatBotPage extends StatelessWidget {
  static const String routeName = "AiChatBotPage";
  const AiChatBotPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const AiChatBotPage());
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AiChatBotNotifier(),
      child: const Scaffold(
        body: AiChatBotView(),
      ),
    );
  }
}

class AiChatBotView extends StatelessWidget {
  const AiChatBotView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AiChatBotBody();
  }
}
