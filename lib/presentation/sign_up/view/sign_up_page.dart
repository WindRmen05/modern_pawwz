import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/sign_up/provider/provider.dart';
import 'package:modern_pawwz/presentation/sign_up/widgets/sign_up_body.dart';

class SignUpPage extends StatelessWidget {
  static const String routeName = "SignUpPage";
  const SignUpPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const SignUpPage());
  }
 
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignUpNotifier(),
      child: const Scaffold(
        body: SignUpView(),
      ),
    );
  }   
}

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SignUpBody();
  }
}
