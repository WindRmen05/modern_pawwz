import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/splash_screen/provider/provider.dart';
import 'package:modern_pawwz/presentation/splash_screen/widgets/splash_screen_body.dart';

class SplashScreenPage extends StatelessWidget {
  static const String routeName = "SplashScreenPage";
  const SplashScreenPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const SplashScreenPage());
  }
 
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SplashScreenNotifier()..init(),
      child: const Scaffold(
        body: SplashScreenView(),
      ),
    );
  }   
}

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SplashScreenBody();
  }
}
