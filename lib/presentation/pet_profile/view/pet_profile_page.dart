import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/pet_profile/provider/provider.dart';
import 'package:modern_pawwz/presentation/pet_profile/widgets/pet_profile_body.dart';

class PetProfilePage extends StatelessWidget {
  static const String routeName = "PetProfilePage";
  const PetProfilePage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const PetProfilePage());
  }
 
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PetProfileNotifier(),
      child: const Scaffold(
        body: PetProfileView(),
      ),
    );
  }   
}

class PetProfileView extends StatelessWidget {
  const PetProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const PetProfileBody();
  }
}
