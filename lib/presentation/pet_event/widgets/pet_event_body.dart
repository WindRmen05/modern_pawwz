import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/components/custom_back_button.dart';
import 'package:modern_pawwz/presentation/pet_event/pet_event.dart';
import 'package:modern_pawwz/presentation/pet_event/widgets/pet_event_card.dart';
import 'package:modern_pawwz/presentation/pet_event/widgets/event_progress_bar.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PetEventBody extends StatelessWidget {
  const PetEventBody({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PetEventNotifier>(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomBackButtonAppBar(),
      body: Stack(
        children: [
          // PageView
          PageView.builder(
            controller: provider.pageController,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index) => provider.setPage(index),
            itemCount: provider.events.length,
            itemBuilder: (context, index) {
              return PetEventCard(event: provider.events[index]);
            },
          ),

          // Progress bar at top
          Positioned(
            top: 5.h,
            left: 120.w,
            right: 120.w,
            child: SafeArea(
              child: EventProgressBar(
                count: provider.events.length,
                currentIndex: provider.currentPage,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
