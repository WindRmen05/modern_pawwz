

import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/main_screen/main_screen.dart';
import 'package:modern_pawwz/presentation/pets_details/pets_details.dart';
import 'package:modern_pawwz/presentation/pets_details/pets_details.dart';
import 'package:modern_pawwz/presentation/welcome_screen/view/welcome_screen_page.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case MainScreenPage.routeName:
        {
          return _slideRoute(MainScreenPage(), routeSettings);
        }
        case PetsDetailsPage.routeName:
        {
          return _slideRoute(PetsDetailsPage(), routeSettings);
        }
      default:
        return _slideRoute(WelcomeScreenPage(), routeSettings);
    }
  }

  static Route _route(Widget widget, RouteSettings routeSettings) {
    return MaterialPageRoute(
        builder: (context) => widget, settings: routeSettings);
  }

  static Route _slideRoute(Widget page, RouteSettings routeSettings) {
    return PageRouteBuilder(
      settings: routeSettings,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0); // Slide from right to left
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween =
        Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}
