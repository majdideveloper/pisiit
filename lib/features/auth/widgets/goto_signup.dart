import 'package:flutter/material.dart';
import 'package:pisiit/features/auth/screens/signup_screen.dart';
import 'package:pisiit/utils/colors.dart';
import 'package:pisiit/utils/helper_textstyle.dart';

class GoToSignUp extends StatelessWidget {
  const GoToSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Text("Don't have an  account?", style: textStyleTextBold),
        TextButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                SignUpScreen.routeName,
              );
            },
            child:  Text("Sign up", style: textStyleTextBold.copyWith(color: primaryColor),))
      ],
    );
  }
}
