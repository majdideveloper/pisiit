
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:pisiit/commun/functions/otp_function.dart';
import 'package:pisiit/features/auth/screens/forget_password/otp_verification.dart';
import 'package:pisiit/features/auth/widgets/custom_validat_textfield.dart';
import 'package:pisiit/features/auth/widgets/textfield_auth.dart';
import 'package:pisiit/features/auth/widgets/widget_title.dart';
import 'package:pisiit/utils/colors.dart';
import 'package:pisiit/utils/helper_padding.dart';
import 'package:pisiit/utils/signin_showpopup.dart';
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
                CustomValidateTextField(
                    controller: emailController,
                    nameTextField: "Email",
                    prefixIcon: const Icon(
                      Icons.email,
                      color: blackColor,
                    ),                 
                    ),
                largePaddingVert,
                CustomButton(
                  colorText: whiteColor,
                  textButton: "continue",
                  onPressed: () async {
                    if (emailController.text !='' &&  EmailValidator.validate(emailController.text))
                   { //sendOTP(emailController.text);
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
                    );}else{
                      showSnackBar(context, 'email empty');
                    }
                  },
                ),
              ],
            ),
            ),
      ),
    );
  }
}
