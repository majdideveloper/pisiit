import 'package:flutter/material.dart';
import 'package:pisiit/features/auth/screens/login_screen.dart';
import 'package:pisiit/features/auth/screens/signup_screen.dart';
import 'package:pisiit/features/home/screen/user_profile/user_profile.dart';
import 'package:pisiit/models/user_model.dart';

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
    case SignUpScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const SignUpScreen(),
      );
    case UserProfile.routeName:
      final arguments = settings.arguments as Map<String, dynamic>;

      return MaterialPageRoute(
        builder: (context) => UserProfile(
          userModel: arguments['userModel'] as UserModel,
          ownUserModel: arguments['ownUserModel'] as UserModel,
        ),
      );

    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
            body: Container() // ErrorScreen(error: 'This page doesn\'t exist'),
            ),
      );
  }
}
