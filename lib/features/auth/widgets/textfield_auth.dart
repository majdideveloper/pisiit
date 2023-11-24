// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pisiit/utils/helper_padding.dart';
import 'package:pisiit/utils/helper_textstyle.dart';

class TextFieldAuth extends StatelessWidget {
  final String nameTextField;
  bool obscureText;
  TextEditingController? controller;
  Widget? suffixIcon;
  Widget? prefixIcon;
  TextFieldAuth({
    Key? key,
    required this.nameTextField,
    this.obscureText = false,
    this.controller,
    this.suffixIcon,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          nameTextField,
          style: textStyleTextBold,
        ),
        smallPaddingVert,
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            filled: true,
            fillColor: Colors.grey[200],
            hintText: nameTextField,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none),
          ),
        ),
      ],
    );
  }
}
