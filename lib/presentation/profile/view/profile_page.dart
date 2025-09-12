import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/profile/provider/provider.dart';
import 'package:modern_pawwz/presentation/profile/widgets/profile_body.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const ProfilePage());
  }
 
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileNotifier(),
      child: ProfileView(),
    );
  }   
}

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProfileBody();
  }
}
