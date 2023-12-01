import 'package:flutter/material.dart';
import 'package:pisiit/commun/functions/otp_function.dart';
import 'package:pisiit/features/auth/screens/forget_password/new_password.dart';
import 'package:pisiit/features/auth/widgets/widget_title.dart';
import 'package:pisiit/utils/colors.dart';
import 'package:pisiit/utils/helper_padding.dart';
import 'package:pisiit/utils/helper_textstyle.dart';
import 'package:pisiit/widgets/custom_button.dart';

class OtpVerificationScreen extends StatefulWidget {
  static const routeName = '/otpVerificationScreen';
  final TextEditingController emailController;
  List<String> otp;

  OtpVerificationScreen(
      {Key? key, required this.emailController, required this.otp})
      : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final otp1Controller = TextEditingController();
  final otp2Controller = TextEditingController();
  final otp3Controller = TextEditingController();
  final otp4Controller = TextEditingController();
  final otp5Controller = TextEditingController();
  final otp6Controller = TextEditingController();

  bool verifOTP(String otp, String otpWritten) {
    return otp == otpWritten;
  }

  void updateOTP(List<String> newOTP) {
    setState(() {
      widget.otp = newOTP;
    });
  }

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
                title: "OTP code verification 🔐",
                subTitle:
                    "We have sent an OTP code to your email and ${widget.emailController.text}.\n Enter the OTP code below to verify",
              ),
              mediumPaddingVert,
              Text(widget.otp[0]),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OtpInputField(
                    controller: otp1Controller,
                  ),
                  OtpInputField(
                    controller: otp2Controller,
                  ),
                  OtpInputField(
                    controller: otp3Controller,
                  ),
                  OtpInputField(
                    controller: otp4Controller,
                  ),
                  OtpInputField(
                    controller: otp5Controller,
                  ),
                  OtpInputField(
                    controller: otp6Controller,
                  ),
                ],
              ),
              mediumPaddingVert,
              if (!verifOTP(
                  widget.otp[0],
                  otp1Controller.text +
                      otp2Controller.text +
                      otp3Controller.text +
                      otp4Controller.text +
                      otp5Controller.text +
                      otp6Controller.text))
                Center(
                  child: Text(
                    "OTP not Valid Rewrite or click below for resend",
                    style: textStyleTextBold.copyWith(color: Colors.red),
                  ),
                ),
              TextButton(
                onPressed: () {
                  var newotp = generateOTP();
                  updateOTP(newotp);
                  sendOTPToEmail(
                    widget.emailController.text,
                    newotp,
                  );
                },
                child: Text("Resend OTP"),
              ),
              largePaddingVert,
              CustomButton(
                colorText: purpleColor,
                textButton: "Continue",
                onPressed: () {
                  if(verifOTP(
                      widget.otp[0],
                      otp1Controller.text +
                          otp2Controller.text +
                          otp3Controller.text +
                          otp4Controller.text +
                          otp5Controller.text +
                          otp6Controller.text)){
                            print('true');
                             Navigator.pushNamed(
                      context,
                      NewPasswordSceen.routeName,
                      arguments: {
                        'emailController': widget.emailController.text ,

                      },
                    );
                            
                          
                }else {
                    Text("verif ");
                }
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OtpInputField extends StatelessWidget {
  final TextEditingController controller;

  const OtpInputField({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        width: 40,
        decoration: BoxDecoration(
          border: Border.all(width: 1),
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: TextField(
          controller: controller,
          maxLength: 1,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          style: const TextStyle(fontSize: 25),
          decoration: const InputDecoration(
            counterText: '',
          ),
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          },
        ),
      ),
    );
  }
}
