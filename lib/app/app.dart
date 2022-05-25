import 'package:flutter/material.dart';
import 'package:mvvm_learn/presentation/resources/routes_manager.dart';
import 'package:mvvm_learn/presentation/resources/theme_manager.dart';

class MyApp extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  MyApp._internal(); //private named constructor default yani default constructor yerine kullanılacak.

  static final MyApp instance =
      MyApp._internal(); //single instance yani singleton yapma işlemi

  factory MyApp() =>
      instance; // factory ile default constructor yerine kullanacağımızı söylüyoruz.

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: getApplicationTheme(),
    );
  }
}
