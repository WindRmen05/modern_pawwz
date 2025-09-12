import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modern_pawwz/presentation/profile/provider/provider.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<ProfileNotifier>(context);

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.h),

            // Profile picture and info
            CircleAvatar(
              radius: 40.r,
              backgroundImage: NetworkImage(profile.imageUrl),
            ),
            SizedBox(height: 10.h),
            Text(
              profile.name,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            SizedBox(height: 5.h),
            Text(
              profile.email,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 14.sp,
                    color: Colors.black54,
                  ),
            ),
            SizedBox(height: 20.h),

            // Options List
            Expanded(
              child: ListView(
                children: [
                  _buildTile(
                    context,
                    icon: Icons.alternate_email,
                    title: "UPI ID",
                    subtitle: "Your all UPI ID’s",
                  ),
                  _buildTile(
                    context,
                    icon: Icons.qr_code,
                    title: "QR Code",
                    subtitle: "Your QR code",
                  ),
                  _buildTile(
                    context,
                    icon: Icons.payment,
                    title: "Payment Method",
                    subtitle: "UPI, Bank Accounts, Cards, Wallet",
                  ),
                  _buildTile(
                    context,
                    icon: Icons.card_giftcard,
                    title: "Rewards",
                    subtitle: "Cashback, Offers & Vouchers",
                  ),
                  _buildTile(
                    context,
                    icon: Icons.settings,
                    title: "Settings",
                    subtitle: "Addresses, Security & Privacy, Languages",
                  ),
                  _buildTile(
                    context,
                    icon: Icons.help_outline,
                    title: "Help & Feedback",
                    subtitle: "Customer Support, Queries, Q&A",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTile(BuildContext context,
      {required IconData icon,
      required String title,
      required String subtitle}) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, size: 22.sp, color: Colors.blue),
          title: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
          ),
          subtitle: Text(
            subtitle,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 12.sp,
                  color: Colors.black54,
                ),
          ),
          trailing: Icon(Icons.arrow_forward_ios, size: 16.sp),
        ),
        Divider(height: 1, thickness: 0.5),
      ],
    );
  }
}
