import 'package:flutter/material.dart';
import 'package:mvvm_learn/presentation/forgotten_password/forgottenpassword.dart';
import 'package:mvvm_learn/presentation/login/login.dart';
import 'package:mvvm_learn/presentation/main/main_view.dart';
import 'package:mvvm_learn/presentation/onboarding/onboarding.dart';
import 'package:mvvm_learn/presentation/register/register.dart';
import 'package:mvvm_learn/presentation/resources/strings_manager.dart';
import 'package:mvvm_learn/presentation/splash/splash.dart';
import 'package:mvvm_learn/presentation/store_details/store_details.dart';

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
      case Routes.forgottenPasswordRoute:
        return MaterialPageRoute(builder: (_) => ForgottenPasswordView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => RegisterView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => MainView());
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_) => StoreDetailsView());
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.generalErrorString),
              ),
              body: const Center(
                child: Text(AppStrings.generalErrorString),
              ),
            ));
  }
}
