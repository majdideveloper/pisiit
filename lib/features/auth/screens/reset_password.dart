import 'package:flutter/material.dart';
import 'package:pisiit/features/auth/screens/otp_verification.dart';
import 'package:pisiit/features/auth/widgets/textfield_auth.dart';
import 'package:pisiit/features/auth/widgets/widget_title.dart';
import 'package:pisiit/utils/colors.dart';
import 'package:pisiit/utils/helper_padding.dart';
import 'package:pisiit/widgets/custom_button.dart';
import 'package:otp/otp.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class resetPassword extends StatefulWidget {
   static const routeName = '/resetPassword';
  const resetPassword({super.key});

  @override
  State<resetPassword> createState() => _resetPasswordState();
}

class _resetPasswordState extends State<resetPassword> {

    final emailController = TextEditingController();

  final TextEditingController _otpcontroller = TextEditingController();

//!Function to generate OTP code
String generateOTP() {

  String secretKey = 'KseJboUwSF';
  String otp = OTP.generateTOTPCodeString(secretKey, DateTime.now().millisecondsSinceEpoch);

  return otp;
}
//!Function to send mail
final String username = 'pesstapp@gmail.com';
final String password = '129@pesst';
Future<void> sendEmail({required String to, required String subject, required String body}) async {
 
  final smtpServer = gmail(username, password);
  final message = Message()
    ..from = Address(username, 'Pesst')
    ..recipients.add(to)
    ..subject = subject
    ..text = body;

  try {
    final sendReport = await send(message, smtpServer);
    print('Message sent: ${sendReport.toString()}');
  } catch (e) {
    print('Error sending email: $e');
  }
}

//!Function to send OTP code
Future<void> sendOTPToEmail(String email) async {
  final String otp;

  otp = generateOTP();
  try {
    await sendEmail(
      to: email,
      subject: 'Your Pesst OTP Code',
      body: 'Your OTP code is: $otp',
    );
    
    print('OTP sent to $email successfully');
  } catch (e) {
    print('Error sending OTP to $email: $e');
  }
}

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(20.0),
         child: Column(children: [
            const WidgetTitle(
              title: "Reset your password 🔑", 
              subTitle: "Please ener your email and we will send on OTP code in the next step to reset your password."
              ),
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
                onPressed: ()async{
                  sendOTPToEmail(emailController.text,);
                   Navigator.pushNamed(context,
                    otpVerification.routeName,
                    arguments: emailController,
                    
                    );
                },
              ),
          ],)
          ),
      ),
    );
  }
}