// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pisiit/utils/colors.dart';
import 'package:pisiit/utils/helper_padding.dart';
import 'package:pisiit/utils/helper_textstyle.dart';

class ButtonSocialMedia extends StatelessWidget {
  final Color colorText;
  final String textButton;
  final void Function()? onPressed;
  const ButtonSocialMedia({
    Key? key,
    required this.colorText,
    required this.textButton,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          minimumSize:
              MaterialStateProperty.all(const Size(double.infinity, 48.0)),
          backgroundColor: MaterialStateProperty.all(whiteColor),
        ),
        child: Row(
          children: [
            Image.asset(
              "assets/images/logo_request_active.png",
              height: 40,
              width: 40,
            ),
            largePaddingHor,
            Text(
              textButton,
              style: textStyleTextBold.copyWith(color: colorText),
            ),
          ],
        ),
      ),
    );
  }
}
