import 'package:flutter/material.dart';
import 'package:mvvm_learn/presentation/login/login.dart';
import 'package:mvvm_learn/presentation/onboarding/onboarding.dart';
import 'package:mvvm_learn/presentation/splash/splash.dart';

class Routes {
  static const String loginRoute = '/login';
  static const String splashRoute = '/';
  static const String onBoardingRoute = '/onBoarding';
  static const String forgottenPasswordRoute = '/forgottenPassword';
  static const String registerRoute = '/register';
  static const String mainRoute = '/main';
  static const String storeDetailsRoute = '/storeDetails';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => SplashView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => OnBoardingView());
      default:
    }
  }
}
