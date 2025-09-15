import 'package:flutter/material.dart';

enum NotificationType { normal, product, announcement }

class AppNotification {
  final String title;
  final String message;
  final NotificationType type;

  AppNotification({
    required this.title,
    required this.message,
    required this.type,
  });
}

class NotificationScreenNotifier with ChangeNotifier {
  final List<AppNotification> _notifications = [
    AppNotification(
      title: "Welcome!",
      message: "Thanks for joining our Pet Care app 🐶",
      type: NotificationType.normal,
    ),
    AppNotification(
      title: "Special Offer",
      message: "Get 20% off on pet food today only! 🐾",
      type: NotificationType.product,
    ),
    AppNotification(
      title: "App Update",
      message: "We’ve added a new Emergency Care section 🚑",
      type: NotificationType.announcement,
    ),
  ];

  List<AppNotification> get notifications => _notifications;
}
