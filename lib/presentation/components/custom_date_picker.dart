import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:sizable/sizable.dart';

class CustomDatePicker extends StatefulWidget {
  final Function(DateTime) onDateSelected; // Callback function
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final String? hintText;
  final String? title;
  final String? sDate;

  const CustomDatePicker({
    Key? key,
    required this.onDateSelected,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.hintText,
    this.title,
    this.sDate,
  }) : super(key: key);

  @override
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    DateTime initialDate = widget.initialDate ?? DateTime.now();
    DateTime firstDate = widget.firstDate ?? DateTime(2000);
    DateTime lastDate = widget.lastDate ?? DateTime(2100);

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
      widget.onDateSelected(picked); // Trigger callback function
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: spacingOnly(t:15.sp),
      child: GestureDetector(
        onTap: () => _selectDate(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: spacingOnly(l:10.sp),
              child: Text(
                widget.title ?? '',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            5.sp.sizeh,
            Container(
              // margin: spacingOnly(),
              height: 60.sp,
              padding: spacingSym(),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.sDate ??
                        (selectedDate != null
                            ? "${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}"
                            : widget.hintText ?? "Select Date"),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Icon(
                    Iconsax.calendar_1_outline,
                    size: 18.sp,
                    color: Colors.grey.shade500,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
