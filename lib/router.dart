import 'package:flutter/material.dart';
import 'package:pisiit/features/auth/screens/login_screen.dart';
import 'package:pisiit/features/auth/screens/signup_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      );
    case SignUpScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const SignUpScreen(),
      );

    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
            body: Container() // ErrorScreen(error: 'This page doesn\'t exist'),
            ),
      );
  }
}
