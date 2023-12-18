import 'package:flutter/material.dart';
import 'package:pisiit/features/auth/screens/signup_widget/widget_interest.dart';
import 'package:pisiit/utils/colors.dart';
import 'package:pisiit/widgets/custom_button.dart';
class InterstWidgetProfile extends StatelessWidget {
  const InterstWidgetProfile({super.key});


  @override
  Widget build(BuildContext context) {
    List<String> interests = [];
    return Scaffold(
      appBar: AppBar(
        title:  Text("Intersets"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child:
        Padding(
          padding: const EdgeInsets.all(20),
          child: InterstList(interests: interests,),
        )
      ),
      floatingActionButton: CustomButton(colorText: whiteColor, textButton: "ok(${interests.length} / 5 )",),
    );
  }
}