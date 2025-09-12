import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/pet_event/provider/provider.dart';
import 'package:modern_pawwz/presentation/pet_event/widgets/pet_event_body.dart';

class PetEventPage extends StatelessWidget {
  static const String routeName = "PetEventPage";
  const PetEventPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const PetEventPage());
  }
 
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PetEventNotifier()..EventNotifier(),
      child: const Scaffold(
        body: PetEventView(),
      ),
    );
  }   
}

class PetEventView extends StatelessWidget {
  const PetEventView({super.key});

  @override
  Widget build(BuildContext context) {
    return const PetEventBody();
  }
}
