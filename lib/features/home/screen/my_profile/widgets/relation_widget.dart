import 'package:flutter/material.dart';
import 'package:pisiit/features/auth/screens/signup_widget/widget_interest.dart';
import 'package:pisiit/features/auth/screens/signup_widget/widget_relationgoals.dart';
import 'package:pisiit/utils/colors.dart';
import 'package:pisiit/widgets/custom_button.dart';
class RelationWidgetProfile extends StatelessWidget {
  const RelationWidgetProfile({super.key});


  @override
  Widget build(BuildContext context) {
    List<String> relationGoals = [" "];
    return Scaffold(
      appBar: AppBar(
        title:  Text("Intersets"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child:
        Padding(
          padding: const EdgeInsets.all(20),
          child: 
          RealtionSelectionScreen(
            relationGoals: relationGoals,
          ),
        )
      ),
      floatingActionButton: CustomButton(colorText: whiteColor, textButton: "ok",),
    );
  }
}