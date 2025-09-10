import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/welcome_screen/provider/provider.dart';
import 'package:modern_pawwz/presentation/welcome_screen/widgets/welcome_screen_body.dart';

class WelcomeScreenPage extends StatelessWidget {
  static const String routeName = "WelcomeScreenPage";
  const WelcomeScreenPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const WelcomeScreenPage());
  }
 
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WelcomeScreenNotifier()..init(),
      child: const Scaffold(
        body: WelcomeScreenView(),
      ),
    );
  }   
}

class WelcomeScreenView extends StatelessWidget {
  const WelcomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return const WelcomeScreenBody();
  }
}
