import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modern_pawwz/presentation/components/custom_header_widget.dart';
import 'package:modern_pawwz/presentation/components/custom_search_filter_widget.dart';
import 'package:modern_pawwz/presentation/home_screen/widgets/category_list_widget.dart';
import 'package:modern_pawwz/presentation/pet_adoption/provider/provider.dart';
import 'package:modern_pawwz/presentation/pet_adoption/widgets/pet_card_widget.dart';
import 'package:sizable/sizable.dart';

class PetAdoptionBody extends StatelessWidget {
  const PetAdoptionBody({super.key});

  @override
  Widget build(BuildContext context) {
    final pets = context.watch<PetAdoptionNotifier>().pets;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Adopt a Pet"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            20.sp.sizeh,
            Padding(
              padding: spacingSym(v: 0),
              child: const SearchAndFilterBar(),
            ),
            20.sp.sizeh,

            // Categories
            const CategoryList(),
            20.sp.sizeh,
            CustomHeaderWidget("Adoption List",padding: spacingSym(v:0)),
            10.sp.sizeh,
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: pets.length,
              itemBuilder: (ctx, i) => PetCard(pet: pets[i]),
            ),
          ],
        ),
      ),
    );
  }
}
