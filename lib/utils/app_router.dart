import 'package:flutter/material.dart';
import 'package:untitled/ui/home.dart';
import 'package:untitled/ui/login.dart';

import '../app_screens/app_screens.dart';
import '../ui/splash_screen.dart';


class AppRouter {
  final RouteObserver<PageRoute> routeObserver;

  AppRouter() : routeObserver = RouteObserver<PageRoute>();

  Route<dynamic> getRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) {
      switch (settings.name) {
        case AppScreens.splash:
          return const SplashScreen();
        case AppScreens.login:
          return const LoginPage();
        case AppScreens.home:
          return const HomePageScreen();

        default:
          return Container();
      }
    });
  }
}

