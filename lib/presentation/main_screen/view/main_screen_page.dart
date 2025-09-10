import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/main_screen/provider/provider.dart';
import 'package:modern_pawwz/presentation/main_screen/widgets/main_screen_body.dart';

class MainScreenPage extends StatelessWidget {
  static const String routeName = "MainScreenPage";
  const MainScreenPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const MainScreenPage());
  }
 
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainScreenNotifier(),
      child: MainScreenView(),
    );
  }   
}

class MainScreenView extends StatelessWidget {
  const MainScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainScreenBody();
  }
}
