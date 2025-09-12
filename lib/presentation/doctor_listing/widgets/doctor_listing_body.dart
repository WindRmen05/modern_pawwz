import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modern_pawwz/presentation/components/CustomTextField.dart';
import 'package:modern_pawwz/presentation/components/custom_search_widget.dart';
import 'package:modern_pawwz/presentation/doctor_listing/provider/provider.dart';
import 'package:modern_pawwz/presentation/doctor_listing/widgets/doctor_card_widget.dart';
import 'package:sizable/sizable.dart';

class DoctorListingBody extends StatelessWidget {
  const DoctorListingBody({super.key});

  @override
  Widget build(BuildContext context) {
    final doctors = Provider.of<DoctorListingNotifier>(context).doctors;

    return Scaffold(
      appBar: AppBar(
        title: Text("Veterinary Doctor",
            style: Theme.of(context).textTheme.titleLarge),
      ),
      body: Column(
        children: [
          10.sp.sizeh,
          CustomSearchWidget(),
          20.sp.sizeh,
          ListView.builder(
            // physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: doctors.length,
            itemBuilder: (context, index) {
              return DoctorCard(doctor: doctors[index]);
            },
          ),
        ],
      ),
    );
  }
}
