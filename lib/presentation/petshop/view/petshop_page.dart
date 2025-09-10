import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/petshop/provider/provider.dart';
import 'package:modern_pawwz/presentation/petshop/widgets/petshop_body.dart';

class PetshopPage extends StatelessWidget {
  static const String routeName = "PetshopPage";
  const PetshopPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const PetshopPage());
  }
 
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PetShopNotifier(),
      child: const Scaffold(
        body: PetshopView(),
      ),
    );
  }   
}

class PetshopView extends StatelessWidget {
  const PetshopView({super.key});

  @override
  Widget build(BuildContext context) {
    return const PetShopBody();
  }
}
