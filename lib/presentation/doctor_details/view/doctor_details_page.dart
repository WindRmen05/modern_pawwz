import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/doctor_details/provider/provider.dart';
import 'package:modern_pawwz/presentation/doctor_details/widgets/doctor_details_body.dart';
import 'package:modern_pawwz/presentation/doctor_listing/provider/doctor_listing_provider.dart';

class DoctorDetailsPage extends StatelessWidget {
  static const String routeName = "DoctorDetailsPage";
  const DoctorDetailsPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const DoctorDetailsPage());
  }
 
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Doctor;
    return ChangeNotifierProvider(
      create: (context) => DoctorDetailsNotifier()..init(args),
      child: const Scaffold(
        body: DoctorDetailsView(),
      ),
    );
  }   
}

class DoctorDetailsView extends StatelessWidget {
  const DoctorDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const DoctorDetailsBody();
  }
}
