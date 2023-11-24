import 'package:flutter/material.dart';
import 'package:pisiit/utils/colors.dart';
import 'package:pisiit/utils/helper_textstyle.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "assets/images/logo_request_active.png",
            height: 30,
            width: 30,
          ),
        ),
        title: Text(
          "Pissit",
          style: textStyleSubtitle,
        ),
        centerTitle: true,
        actions: [
          CircleAvatar(
            backgroundColor: purpleColor,
            child: Text(
              "10",
              style: textStyleTextBold,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: Column(),
    );
  }
}
