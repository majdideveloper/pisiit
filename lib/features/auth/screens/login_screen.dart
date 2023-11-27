import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pisiit/features/auth/controller/auth_controller.dart';
import 'package:pisiit/features/auth/screens/reset_password.dart';
import 'package:pisiit/features/auth/screens/signup_widget/widget_birthday.dart';
import 'package:pisiit/features/auth/screens/signup_widget/widget_images.dart';
import 'package:pisiit/features/auth/widgets/goto_signup.dart';
import 'package:pisiit/features/auth/widgets/textfield_auth.dart';
import 'package:pisiit/utils/colors.dart';
import 'package:pisiit/utils/helper_padding.dart';
import 'package:pisiit/utils/helper_textstyle.dart';
import 'package:pisiit/widgets/custom_button.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const routeName = '/login-screen';
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool showPassword = true;

  logInWithEmailAndPassword() {
    ref.read(authControllerProvider).signInWithEmailAndPassword(
        context, emailController.text.trim(), passwordController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome back 👋",
                style: textStyleSubtitle,
              ),
              smallPaddingVert,
              Text(
                "Please enter your email & password to sign in.",
                style: textStyleText,
              ),
              smallPaddingVert,
              TextFieldAuth(
                controller: emailController,
                nameTextField: "Email",
              ),
              smallPaddingVert,
              TextFieldAuth(
                nameTextField: "Password",
                controller: passwordController,
                obscureText: showPassword,
                prefixIcon: const Icon(
                  Icons.lock,
                  color: blackColor,
                ),
                suffixIcon: IconButton(
                  icon: showPassword
                      ? const Icon(Icons.remove_red_eye)
                      : const Icon(Icons.event_busy),
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  color: blackColor,
                ),
              ),
              mediumPaddingVert,
              // ! Custom this in widget to Log In
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (value) {}),
                      Text(
                        'Remember me',
                        style: textStyleText.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                      onPressed:(){
                        Navigator.pushNamed(context, resetPassword.routeName);
                      } ,
                      child: Text(
                        "Forget Password?",
                        style: textStyleTextBold,
                      ))
                ],
              ),
              mediumPaddingVert,
              const Divider(
                height: 1,
              ),
              mediumPaddingVert,
              const GoToSignUp(),
              largePaddingVert,

              CustomButton(
                colorText: purpleColor,
                textButton: "log in",
                onPressed: logInWithEmailAndPassword,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
