import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/ai_chat_bot/view/ai_chat_bot_page.dart';
import 'package:modern_pawwz/presentation/doctor_details/view/doctor_details_page.dart';
import 'package:modern_pawwz/presentation/doctor_listing/view/doctor_listing_page.dart';
import 'package:modern_pawwz/presentation/home_screen/widgets/home_screen_body.dart';
import 'package:modern_pawwz/presentation/main_screen/main_screen.dart';
import 'package:modern_pawwz/presentation/notification_screen/view/notification_screen_page.dart';
import 'package:modern_pawwz/presentation/pet_adoption/view/pet_adoption_page.dart';
import 'package:modern_pawwz/presentation/pet_event/view/pet_event_page.dart';
import 'package:modern_pawwz/presentation/pets_details/pets_details.dart';
import 'package:modern_pawwz/presentation/pets_details/pets_details.dart';
import 'package:modern_pawwz/presentation/petshop/view/petshop_page.dart';
import 'package:modern_pawwz/presentation/product_details/view/product_details_page.dart';
import 'package:modern_pawwz/presentation/splash_screen/view/splash_screen_page.dart';
import 'package:modern_pawwz/presentation/vaccination_timeline/view/vaccination_timeline_page.dart';
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
      case ProductDetailsPage.routeName:
        {
          return _slideRoute(ProductDetailsPage(), routeSettings);
        }
      case PetshopPage.routeName:
        {
          return _slideRoute(PetshopPage(), routeSettings);
        }
      case DoctorListingPage.routeName:
        {
          return _slideRoute(DoctorListingPage(), routeSettings);
        }
      case DoctorDetailsPage.routeName:
        {
          return _slideRoute(DoctorDetailsPage(), routeSettings);
        }
      case PetEventPage.routeName:
        {
          return _slideRoute(PetEventPage(), routeSettings);
        }
      case SplashScreenPage.routeName:
        {
          return _slideRoute(SplashScreenPage(), routeSettings);
        }
      case AiChatBotPage.routeName:
        {
          return _slideRoute(AiChatBotPage(), routeSettings);
        }
      case NotificationScreenPage.routeName:
        {
          return _slideRoute(NotificationScreenPage(), routeSettings);
        }
      case HomeScreenBody.routeName:
        {
          return _slideRoute(HomeScreenBody(), routeSettings);
        }
      case PetAdoptionPage.routeName:
        {
          return _slideRoute(PetAdoptionPage(), routeSettings);
        }
      case VaccinationTimelinePage.routeName:
        {
          return _slideRoute(VaccinationTimelinePage(), routeSettings);
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
