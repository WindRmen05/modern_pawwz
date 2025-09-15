import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/notification_screen/provider/provider.dart';
import 'package:modern_pawwz/presentation/notification_screen/widgets/notification_widget.dart';

class NotificationScreenBody extends StatelessWidget {
  const NotificationScreenBody({super.key});

  Widget _buildNotificationWidget(AppNotification notification) {
    switch (notification.type) {
      case NotificationType.normal:
        return NormalNotificationWidget(notification: notification);
      case NotificationType.product:
        return ProductNotificationWidget(notification: notification);
      case NotificationType.announcement:
        return AnnouncementNotificationWidget(notification: notification);
    }
  }

  @override
  Widget build(BuildContext context) {
    final notifications =
        context.watch<NotificationScreenNotifier>().notifications;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (ctx, i) => _buildNotificationWidget(notifications[i]),
      ),
    );
  }
}
