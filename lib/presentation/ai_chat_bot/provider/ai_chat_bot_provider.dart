import 'package:flutter/material.dart';

class AiChatBotNotifier with ChangeNotifier {

  final List<Map<String, String>> actions = [
  {"icon": "🐾", "label": "Find Disease"},
  {"icon": "💊", "label": "Emergency Aid"},
  {"icon": "🧑‍⚕️", "label": "Vet Guidance"},
  {"icon": "📋", "label": "Pet Care Tips"},
  ];


}
