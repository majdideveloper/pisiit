import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pisiit/features/auth/screens/login_screen.dart';
import 'package:pisiit/features/auth/screens/signup_screen.dart';
import 'package:pisiit/features/auth/widgets/button_social_media.dart';
import 'package:pisiit/utils/colors.dart';
import 'package:pisiit/utils/helper_padding.dart';
import 'package:pisiit/utils/helper_textstyle.dart';
import 'package:pisiit/widgets/custom_button.dart';

class HomeAuthScreen extends StatelessWidget {
  const HomeAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            largePaddingVert,
            Center(
              child: Image.asset(
                "assets/images/logo_request_active.png",
                height: 150,
                width: 150,
              ),
            ),
            Text(
              'Pisit',
              style: textStyleTitle,
            ),
            Text(
              "Let's dive in into your account",
              style: textStyleText,
            ),
            largePaddingVert,
            ButtonSocialMedia(
              colorText: blackColor,
              textButton: "Continue with Google",
              onPressed: () {},
            ),
            mediumPaddingVert,
            ButtonSocialMedia(
              colorText: blackColor,
              textButton: "Continue with Google",
              onPressed: () {},
            ),
            mediumPaddingVert,
            ButtonSocialMedia(
              colorText: blackColor,
              textButton: "Continue with Google",
              onPressed: () {},
            ),
            mediumPaddingVert,
            ButtonSocialMedia(
              colorText: blackColor,
              textButton: "Continue with Google",
              onPressed: () {},
            ),

            const Spacer(),
            CustomButton(
              colorText: whiteColor,
              textButton: "Log in",
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  LoginScreen.routeName,
                );
              },
            ),
            mediumPaddingVert,
            //! Custom this widget
            Row(
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
            )
          ],
        ),
      ),
    );
  }
}
