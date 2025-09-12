import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modern_pawwz/core/navigator/app_routes.dart';
import 'package:modern_pawwz/core/theme/app_theme.dart';
import 'package:modern_pawwz/core/theme/theme_provider.dart';
import 'package:modern_pawwz/presentation/main_screen/main_screen.dart';
import 'package:modern_pawwz/presentation/splash_screen/splash_screen.dart';
import 'package:modern_pawwz/presentation/welcome_screen/view/welcome_screen_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (_) => ThemeProvider(),
      ),
      // ChangeNotifierProvider(
      //   create: (_) => LocationProvider()..currLoc(),
      // ),
    ], child: MyApp()),
  );
}

final GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(448, 998),

      builder: (context, child) {
        return Consumer<ThemeProvider>(
          builder: (context, value, _) {
            return MaterialApp(
              navigatorKey: navigator,
              debugShowCheckedModeBanner: false,
              theme: value.isDark ? AppTheme.darkTheme : AppTheme.lightTheme,
              onGenerateRoute: AppRoutes.generateRoute,
              // initialRoute: WelcomeScreenPage.routeName,
              initialRoute: SplashScreenPage.routeName,
              builder: (context, child) {
                return GestureDetector(
                    onTap: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    child: child,
                );
              },
            );
          },
        );
      },
    );
  }
}
