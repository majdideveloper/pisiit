import 'package:flutter/material.dart';
import 'package:pisiit/features/auth/screens/signup_screen.dart';

class GoToSignUp extends StatelessWidget {
  const GoToSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an  account?"),
        TextButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                SignUpScreen.routeName,
              );
            },
            child: const Text("Sign up"))
      ],
    );
  }
}
