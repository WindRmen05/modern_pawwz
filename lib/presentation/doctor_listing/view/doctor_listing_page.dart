import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/doctor_listing/provider/provider.dart';
import 'package:modern_pawwz/presentation/doctor_listing/widgets/doctor_listing_body.dart';

class DoctorListingPage extends StatelessWidget {
  static const String routeName = "DoctorListingPage";
  const DoctorListingPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const DoctorListingPage());
  }
 
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DoctorListingNotifier(),
      child: const Scaffold(
        body: DoctorListingView(),
      ),
    );
  }   
}

class DoctorListingView extends StatelessWidget {
  const DoctorListingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const DoctorListingBody();
  }
}
