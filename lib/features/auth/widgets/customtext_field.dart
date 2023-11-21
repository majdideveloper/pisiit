import 'package:flutter/material.dart';

import 'package:pisiit/utils/helper_textstyle.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  


  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey[300], // Set the background color to grey
      ),
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(16.0),
          labelStyle: textStyleText, // Adjust content padding as needed
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none, // Remove the default border
        ),
      ),
    );
  }
}
