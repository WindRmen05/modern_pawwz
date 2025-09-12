import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modern_pawwz/presentation/components/custom_schedule_picker/schedule_picker_provider.dart';
import 'package:provider/provider.dart';

class SchedulePicker extends StatelessWidget {
  const SchedulePicker({super.key});

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<ScheduleProvider>(context);

    return ChangeNotifierProvider(
      create: (context) => ScheduleProvider(),
      child: Consumer<ScheduleProvider>(
        builder: (context, value, _) {
          final selectedDate = value.selectedDate;
          final slots = value.getSlots(selectedDate);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Calendar Header (Week View)
              SizedBox(
                height: 80.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(7, (index) {
                    DateTime day = DateTime.now().add(Duration(days: index));
                    bool isSelected = day.day == selectedDate.day &&
                        day.month == selectedDate.month;

                    return GestureDetector(
                      onTap: () => value.setDate(day),
                      child: Container(
                        width: 50.w,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Colors.deepPurple
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              [
                                "SUN",
                                "MON",
                                "TUE",
                                "WED",
                                "THU",
                                "FRI",
                                "SAT"
                              ][day.weekday % 7],
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: isSelected ? Colors.white : Colors.grey,
                              ),
                            ),
                            Text(
                              "${day.day}",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: isSelected ? Colors.white : Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),

              SizedBox(height: 20.h),

              // Time Slots Grid
              Wrap(
                spacing: 12.w,
                runSpacing: 12.h,
                children: slots.map((slot) {
                  bool isSelected = slot.time == value.selectedTime;

                  Color bgColor;
                  Color textColor;
                  if (!slot.isAvailable) {
                    bgColor = Colors.grey[300]!;
                    textColor = Colors.grey;
                  } else if (slot.isBooked) {
                    bgColor = Colors.red[100]!;
                    textColor = Colors.red;
                  } else if (isSelected) {
                    bgColor = Colors.deepPurple;
                    textColor = Colors.white;
                  } else {
                    bgColor = Colors.grey[200]!;
                    textColor = Colors.black;
                  }

                  return GestureDetector(
                    onTap: slot.isAvailable && !slot.isBooked
                        ? () => value.setTime(slot.time)
                        : null,
                    child: Container(
                      width: 90.w,
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.circular(10.r),
                        border: isSelected
                            ? Border.all(color: Colors.deepPurple, width: 2)
                            : null,
                      ),
                      child: Center(
                        child: Text(
                          slot.time,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: textColor,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          );
        },
      ),
    );
  }
}
