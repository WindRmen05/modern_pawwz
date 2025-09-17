import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modern_pawwz/presentation/main_screen/view/main_screen_page.dart';
import 'package:modern_pawwz/presentation/pet_profile/provider/provider.dart';
import 'package:sizable/sizable.dart';

class PetProfileBody extends StatelessWidget {
  const PetProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PetProfileNotifier(),
      child: Consumer<PetProfileNotifier>(
        builder: (context, provider, _) {
          final pages = [
            _PetBasicsStep(),
            _PetImageStep(),
            _VaccinationStep(),
            _HealthReportsStep(),
            _SummaryStep(),
          ];

          return Scaffold(
            appBar: AppBar(
              title: Text("Pet Profile Setup", style: Theme.of(context).textTheme.titleLarge),
              centerTitle: true,
            ),
            body: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: provider.pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    onPageChanged: (index) => provider.setPage(index),
                    itemCount: pages.length,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.all(16.sp),
                      child: pages[index],
                    ),
                  ),
                ),

                // Progress Indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(pages.length, (index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 4.w),
                      width: provider.currentPage == index ? 20.w : 10.w,
                      height: 10.h,
                      decoration: BoxDecoration(
                        color: provider.currentPage == index ? Colors.orange : Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    );
                  }),
                ),
                20.sp.sizeh,

                // Bottom Buttons
                Padding(
                  padding: EdgeInsets.all(16.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (provider.currentPage > 0)
                        ElevatedButton(
                          onPressed: provider.previousPage,
                          child: const Text("Back"),
                        )
                      else
                        const SizedBox.shrink(),
                      ElevatedButton(
                        onPressed: () {
                          if (provider.currentPage < pages.length - 1) {
                            provider.nextPage();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Profile Setup Complete 🎉")),
                            );
                            Navigator.pushNamed(context, MainScreenPage.routeName);
                          }
                        },
                        child: Text(provider.currentPage == pages.length - 1 ? "Submit" : "Next"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// ---------- Steps as separate widgets ----------
class _PetBasicsStep extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Pet Basics", style: Theme.of(context).textTheme.titleMedium),
        20.sp.sizeh,
        Text("Name", style: Theme.of(context).textTheme.bodyMedium),
        10.sp.sizeh,
        TextField(decoration: const InputDecoration(border: OutlineInputBorder(), hintText: "Enter Pet Name")),
        20.sp.sizeh,
        Text("Age", style: Theme.of(context).textTheme.bodyMedium),
        10.sp.sizeh,
        TextField(decoration: const InputDecoration(border: OutlineInputBorder(), hintText: "Enter Pet Age")),
      ],
    );
  }
}

class _PetImageStep extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Profile Image", style: Theme.of(context).textTheme.titleMedium),
        20.sp.sizeh,
        Icon(Icons.pets, size: 100.sp, color: Colors.orange),
        20.sp.sizeh,
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.upload),
          label: const Text("Upload Pet Photo"),
        ),
      ],
    );
  }
}

class _VaccinationStep extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Vaccination", style: Theme.of(context).textTheme.titleMedium),
        20.sp.sizeh,
        Text("Last Vaccination Date", style: Theme.of(context).textTheme.bodyMedium),
        10.sp.sizeh,
        TextField(decoration: const InputDecoration(border: OutlineInputBorder(), hintText: "DD/MM/YYYY")),
        20.sp.sizeh,
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.upload_file),
          label: const Text("Upload Vaccination Document"),
        ),
      ],
    );
  }
}

class _HealthReportsStep extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Health Reports", style: Theme.of(context).textTheme.titleMedium),
        20.sp.sizeh,
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add_photo_alternate),
          label: const Text("Upload Report Images"),
        ),
        20.sp.sizeh,
        TextField(
          maxLines: 3,
          decoration: const InputDecoration(border: OutlineInputBorder(), hintText: "Enter health notes"),
        ),
      ],
    );
  }
}

class _SummaryStep extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Summary", style: Theme.of(context).textTheme.titleMedium),
        20.sp.sizeh,
        Text("Review your pet’s details before submitting.", style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}