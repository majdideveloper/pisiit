// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pisiit/features/auth/widgets/textfield_auth.dart';
import 'package:pisiit/utils/colors.dart';
import 'package:pisiit/utils/helper_padding.dart';
import 'package:pisiit/utils/helper_textstyle.dart';
import 'package:pisiit/widgets/custom_button.dart';

class WidgetEmail extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TabController tabController;
  const WidgetEmail({
    Key? key,
    required this.emailController,
    required this.passwordController,
    required this.tabController,
  }) : super(key: key);

  @override
  State<WidgetEmail> createState() => _WidgetEmailState();
}

class _WidgetEmailState extends State<WidgetEmail> {
  bool showPassword = true;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Create an account 👩‍💻",
              style: textStyleSubtitle,
            ),
            smallPaddingVert,
            Text(
              "Create your account in Seconds. We'll help you find your perfect match",
              style: textStyleText,
            ),
            smallPaddingVert,
            TextFieldAuth(
              controller: widget.emailController,
              nameTextField: "Email",
            ),
            smallPaddingVert,
            TextFieldAuth(
              nameTextField: "Password",
              controller: widget.passwordController,
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
            // ! Custom this in widget
            Row(
              children: [
                Checkbox(value: false, onChanged: (value) {}),
                Text(
                  'I agree to Pisit',
                  style: textStyleText.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Privacy Policy',
                    style: textStyleTextBold,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
