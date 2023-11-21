// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pisiit/features/auth/widgets/textfield_auth.dart';
import 'package:pisiit/utils/colors.dart';
import 'package:pisiit/utils/helper_padding.dart';
import 'package:pisiit/utils/helper_textstyle.dart';
import 'package:pisiit/widgets/custom_button.dart';

class WidgetEmail extends StatelessWidget {
  final TabController tabController;
  const WidgetEmail({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            nameTextField: "Email",
          ),
          smallPaddingVert,
          TextFieldAuth(
            nameTextField: "Password",
            prefixIcon: const Icon(
              Icons.lock,
              color: blackColor,
            ),
            suffixIcon: const Icon(
              Icons.remove_red_eye,
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
    );
  }
}
