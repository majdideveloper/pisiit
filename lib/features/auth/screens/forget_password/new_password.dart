import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pisiit/features/auth/controller/auth_controller.dart';
import 'package:pisiit/features/auth/screens/home_auth_screen.dart';
import 'package:pisiit/features/auth/screens/login_screen.dart';
import 'package:pisiit/features/auth/widgets/textfield_auth.dart';
import 'package:pisiit/features/auth/widgets/widget_title.dart';
import 'package:pisiit/utils/colors.dart';
import 'package:pisiit/utils/helper_padding.dart';
import 'package:pisiit/widgets/custom_button.dart';

class NewPasswordSceen extends ConsumerStatefulWidget {
  static const routeName = '/NewPasswordSceen';
  final TextEditingController emailController;
  

  NewPasswordSceen(
      {Key? key, required this.emailController})
      : super(key: key);



  @override
  ConsumerState<NewPasswordSceen> createState() => _NewPasswordSceenState();
}

class _NewPasswordSceenState extends ConsumerState<NewPasswordSceen> {

  forgetPassword(String password) async {
    ref.read(authControllerProvider).
    //updatePassword(widget.emailController.text.trim(), password.trim());
    resetPasswordWithOTP(
     email:widget.emailController.text.trim(), 
      newPassword: password.trim());
      
  }

final passwordController = TextEditingController();
 bool showPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              WidgetTitle(
                title: "Create new password 🔒",
                subTitle:
                    "Create your new password if you forget it, the you have to do forget password",
              ),
              mediumPaddingVert,
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
              largePaddingVert,
              CustomButton(
                colorText: purpleColor,
                textButton: "Continue",
                onPressed: ()async {
                forgetPassword(passwordController.text);

                Navigator.pushNamedAndRemoveUntil(
                      context,
                      LoginScreen.routeName,
                       (route) => false,
                      );     
                },
              )
                
            ],
          ),
        ),
      ),
    );
  }
}
