import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/notification_screen/provider/provider.dart';
import 'package:modern_pawwz/presentation/notification_screen/widgets/notification_screen_body.dart';

class NotificationScreenPage extends StatelessWidget {
  static const String routeName = "NotificationScreenPage";
  const NotificationScreenPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const NotificationScreenPage());
  }
 
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NotificationScreenNotifier(),
      child: const Scaffold(
        body: NotificationScreenView(),
      ),
    );
  }   
}

class NotificationScreenView extends StatelessWidget {
  const NotificationScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return const NotificationScreenBody();
  }
}
