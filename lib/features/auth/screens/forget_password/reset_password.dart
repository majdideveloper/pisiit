
import 'package:flutter/material.dart';
import 'package:pisiit/commun/functions/otp_function.dart';
import 'package:pisiit/features/auth/screens/forget_password/otp_verification.dart';
import 'package:pisiit/features/auth/widgets/textfield_auth.dart';
import 'package:pisiit/features/auth/widgets/widget_title.dart';
import 'package:pisiit/utils/colors.dart';
import 'package:pisiit/utils/helper_padding.dart';
import 'package:pisiit/widgets/custom_button.dart';

class resetPassword extends StatefulWidget {
  static const routeName = '/resetPassword';
  const resetPassword({super.key});

  @override
  State<resetPassword> createState() => _resetPasswordState();
}

class _resetPasswordState extends State<resetPassword> {
  final emailController = TextEditingController();

  final TextEditingController _otpcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<String> otp =[];
    otp = generateOTP();
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                const WidgetTitle(
                    title: "Reset your password 🔑",
                    subTitle:
                        "Please ener your email and we will send on OTP code in the next step to reset your password."),
                mediumPaddingVert,
                TextFieldAuth(
                  prefixIcon: const Icon(
                    Icons.email,
                    color: blackColor,
                  ),
                  controller: emailController,
                  nameTextField: "Email",
                ),
                largePaddingVert,
                CustomButton(
                  colorText: purpleColor,
                  textButton: "continue",
                  onPressed: () async {
                    //sendOTP(emailController.text);
                    sendOTPToEmail(
                      emailController.text, otp
                    );
                    Navigator.pushNamed(
                      context,
                      OtpVerificationScreen.routeName,
                      arguments: {
                        'emailController': emailController.text ,
                        'otp': otp,
                      },
                    );
                  },
                ),
              ],
            )),
      ),
    );
  }
}
