import 'package:flutter/material.dart';
import 'package:pisiit/features/auth/widgets/widget_title.dart';
import 'package:pisiit/utils/colors.dart';
import 'package:pisiit/utils/helper_padding.dart';
import 'package:pisiit/widgets/custom_button.dart';

class otpVerification extends StatefulWidget {
  static const routeName = '/otpVerification';
  final TextEditingController emailController;
  const otpVerification({super.key, required this.emailController});
  @override
  State<otpVerification> createState() => _otpVerificationState();
}

class _otpVerificationState extends State<otpVerification> {
  final otpController = TextEditingController();

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
                        "We have sent an OTP code to your email and ${widget.emailController.text}.\n Enter the OTP code below to verify"),
                mediumPaddingVert,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                
                  children: [
                    OtpInputField(
                      controller: otpController,
                    ),
                    OtpInputField(
                      controller: otpController,
                    ),
                    OtpInputField(
                      controller: otpController,
                    ),
                    OtpInputField(
                      controller: otpController,
                    ),
                  ],
                ),
                largePaddingVert,
                CustomButton(
                  colorText: purpleColor,
                  textButton: "continue",
                  onPressed: () {},
                ),
              ],
            )),
      ),
    );
  }
}

class OtpInputField extends StatelessWidget {
  final TextEditingController controller;
  const OtpInputField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 70,
        width: 60,
        decoration: BoxDecoration(
          border: Border.all(width: 1),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: TextField(
          controller: controller,
          maxLength: 1,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          style: const TextStyle(fontSize: 42),
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
