import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pisiit/features/auth/controller/auth_controller.dart';
import 'package:pisiit/features/auth/screens/forget_password/reset_password.dart';
import 'package:pisiit/features/auth/widgets/goto_signup.dart';
import 'package:pisiit/features/auth/widgets/textfield_auth.dart';
import 'package:pisiit/utils/colors.dart';
import 'package:pisiit/utils/helper_padding.dart';
import 'package:pisiit/utils/helper_textstyle.dart';
import 'package:pisiit/utils/signin_showpopup.dart';
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
                prefixIcon: const Icon(
                  Icons.email,
                  color: blackColor,
                ),
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
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  color: blackColor,
                ),
              ),
              // ! Custom this in widget to Log In
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, resetPassword.routeName);
                    },
                    child: Text(
                      "Forget Password?",
                      style: textStyleTextBold.copyWith(color: primaryColor),
                    )),
              ),
              smallPaddingVert,
              const Divider(
                height: 1,
              ),
              mediumPaddingVert,
              const GoToSignUp(),
              largePaddingVert, 
              mediumPaddingVert,
              CustomButton(
                colorText: whiteColor,
                textButton: "Log in",
                onPressed: logInWithEmailAndPassword,
              ),
            ],
          ),
        ),
        
      ),
      
    );
    
  }
}
