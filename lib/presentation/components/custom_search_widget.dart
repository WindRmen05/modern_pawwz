import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modern_pawwz/presentation/components/CustomTextField.dart';
import 'package:sizable/sizable.dart';

CustomSearchWidget({
  String? label,
  String? hint,
  Function(String)? onChanged,
  Function(String)? onFilter,
}) {
  return Padding(
    padding: spacingSym(v: 0),
    child: Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 70,
          child: CustomTextField(
            isTopPadding: false, label: "", hint: "Search here...",
            // height: 70.sp,
            onChanged: (p0) => onChanged!(p0),
          ),
        ),
        10.sp.sizew,
        Expanded(
          flex: 15,
          child: FloatingActionButton(
              onPressed: () {},
              child: Icon(
                Icons.filter_list,
                size: 22.sp,
              )),
        ),
      ],
    ),
  );
}
