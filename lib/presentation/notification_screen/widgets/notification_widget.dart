// ================== NOTIFICATION ITEM WIDGETS ==================
import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/notification_screen/provider/notification_screen_provider.dart';

class NormalNotificationWidget extends StatelessWidget {
  final AppNotification notification;
  const NormalNotificationWidget({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.notifications, color: Colors.blue),
      title: Text(notification.title, style: Theme.of(context).textTheme.titleMedium),
      subtitle: Text(notification.message),
    );
  }
}

class ProductNotificationWidget extends StatelessWidget {
  final AppNotification notification;
  const ProductNotificationWidget({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange.shade50,
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child: ListTile(
        leading: const Icon(Icons.local_offer, color: Colors.orange),
        title: Text(notification.title, style: Theme.of(context).textTheme.titleMedium),
        subtitle: Text(notification.message),
      ),
    );
  }
}

class AnnouncementNotificationWidget extends StatelessWidget {
  final AppNotification notification;
  const AnnouncementNotificationWidget({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green.shade50,
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child: ListTile(
        leading: const Icon(Icons.campaign, color: Colors.green),
        title: Text(notification.title, style: Theme.of(context).textTheme.titleMedium),
        subtitle: Text(notification.message),
      ),
    );
  }
}