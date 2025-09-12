import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/vet_visit/provider/provider.dart';
import 'package:modern_pawwz/presentation/vet_visit/widgets/vet_visit_body.dart';

class VetVisitPage extends StatelessWidget {
  const VetVisitPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const VetVisitPage());
  }
 
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => VetVisitNotifier(),
      child: const Scaffold(
        body: VetVisitView(),
      ),
    );
  }   
}

class VetVisitView extends StatelessWidget {
  const VetVisitView({super.key});

  @override
  Widget build(BuildContext context) {
    return const VetVisitBody();
  }
}
