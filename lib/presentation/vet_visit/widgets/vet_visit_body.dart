import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/vet_visit/provider/provider.dart';

/// {@template vet_visit_body}
/// Body of the VetVisitPage.
///
/// Add what it does
/// {@endtemplate}
class VetVisitBody extends StatelessWidget {
  /// {@macro vet_visit_body}
  const VetVisitBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<VetVisitNotifier>(
      builder: (context, state, child) {
        return Center(child: Text(state.count.toString()));
      },
    );
  }
}
