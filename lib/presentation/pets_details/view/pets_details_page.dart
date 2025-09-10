import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/pets_details/provider/provider.dart';
import 'package:modern_pawwz/presentation/pets_details/widgets/pets_details_body.dart';

class PetsDetailsPage extends StatelessWidget {
  static const String routeName = "PetsDetailsPage";
  const PetsDetailsPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const PetsDetailsPage());
  }
 
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PetsDetailsNotifier(),
      child: const Scaffold(
        body: PetsDetailsView(),
      ),
    );
  }   
}

class PetsDetailsView extends StatelessWidget {
  const PetsDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const PetDetailsBody();
  }
}
