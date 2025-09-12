import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sizable/sizable.dart';

class CustomSelectionList extends StatefulWidget {
  final List<String> items;
  final ValueChanged<String> onSelected;
  final String? initialValue;

  const CustomSelectionList({
    super.key,
    required this.items,
    required this.onSelected,
    this.initialValue,
  });

  @override
  State<CustomSelectionList> createState() => _CustomSelectionListState();
}

class _CustomSelectionListState extends State<CustomSelectionList> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue ?? (widget.items.isNotEmpty ? widget.items.first : null);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.sp,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          final item = widget.items[index];
          final isSelected = selectedValue == item;
        return Container(
          margin: spacing(value: 3),
          padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 10.sp),
          decoration: BoxDecoration(
            color: isSelected ? Theme.of(context).colorScheme.primary : Colors.grey[200],
            borderRadius: BorderRadius.circular(12.sp),
            boxShadow: [
              if (isSelected)
                BoxShadow(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
            ],
          ),
          child: Center(
            child: Text(
              item,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        );
      },),
    );
  }
}
// widget.items.map((item) {
// final isSelected = selectedValue == item;
// return GestureDetector(
// onTap: () {
// setState(() {
// selectedValue = item;
// });
// widget.onSelected(item);
// },
// child: Container(
// padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 10.sp),
// decoration: BoxDecoration(
// color: isSelected ? Theme.of(context).colorScheme.primary : Colors.grey[200],
// borderRadius: BorderRadius.circular(12.sp),
// boxShadow: [
// if (isSelected)
// BoxShadow(
// color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
// blurRadius: 6,
// offset: const Offset(0, 3),
// ),
// ],
// ),
// child: Text(
// item,
// style: Theme.of(context).textTheme.bodyMedium?.copyWith(
// color: isSelected ? Colors.white : Colors.black,
// fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
// ),
// ),
// ),
// );
// }).toList(),