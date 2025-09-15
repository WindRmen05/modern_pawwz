import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/pet_adoption/provider/provider.dart';
import 'package:modern_pawwz/presentation/pet_adoption/widgets/pet_adoption_body.dart';

class PetAdoptionPage extends StatelessWidget {
  static const String routeName = "PetAdoptionPage";
  const PetAdoptionPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const PetAdoptionPage());
  }
 
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PetAdoptionNotifier(),
      child: const Scaffold(
        body: PetAdoptionView(),
      ),
    );
  }   
}

class PetAdoptionView extends StatelessWidget {
  const PetAdoptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return const PetAdoptionBody();
  }
}
