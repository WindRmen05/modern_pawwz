import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sizable/sizable.dart';

class ContactInfo extends StatelessWidget {
  final String name;
  final String location;
  final String profileImage;
  final VoidCallback? onCall;
  final VoidCallback? onChat;

  const ContactInfo({
    super.key,
    required this.name,
    required this.location,
    required this.profileImage,
    this.onCall,
    this.onChat,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.sp),
        border: Border.all(color: Colors.grey.shade400, width: 0.3.w),
      ),
      child: Padding(
        padding: spacingSym(v:0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 18.sp,
              backgroundImage: AssetImage(profileImage),
            ),
            10.sp.sizew,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      // fontSize: 11.sp,
                    ),
                  ),
                  Text(
                    location,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.call, size: 22.sp),
              onPressed: onCall,
            ),
            IconButton(
              icon: Icon(Icons.chat, size: 22.sp),
              onPressed: onChat,
            ),
          ],
        ),
      ),
    );
  }
}
