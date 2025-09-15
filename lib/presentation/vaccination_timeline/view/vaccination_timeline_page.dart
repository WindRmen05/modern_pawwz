import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/vaccination_timeline/provider/provider.dart';
import 'package:modern_pawwz/presentation/vaccination_timeline/widgets/vaccination_timeline_body.dart';

class VaccinationTimelinePage extends StatelessWidget {
  static const String routeName = "VaccinationTimelinePage";
  const VaccinationTimelinePage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const VaccinationTimelinePage());
  }
 
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => VaccinationTimelineNotifier(),
      child: const Scaffold(
        body: VaccinationTimelineView(),
      ),
    );
  }   
}

class VaccinationTimelineView extends StatelessWidget {
  const VaccinationTimelineView({super.key});

  @override
  Widget build(BuildContext context) {
    return const VaccinationTimelineBody();
  }
}
