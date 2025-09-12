import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/home_screen/provider/provider.dart';
import 'package:modern_pawwz/presentation/home_screen/widgets/home_screen_body.dart';
import 'package:modern_pawwz/presentation/home_screen/widgets/home_screen_body_2.dart';

class HomeScreenPage extends StatelessWidget {
  static const String routeName = "HomeScreenPage";
  const HomeScreenPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const HomeScreenPage());
  }
 
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeScreenNotifier(),
      child: const Scaffold(
        body: HomeScreenView(),
      ),
    );
  }   
}

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeScreen2();
  }
}
