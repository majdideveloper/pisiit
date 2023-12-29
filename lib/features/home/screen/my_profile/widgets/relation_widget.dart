import 'package:flutter/material.dart';
import 'package:pisiit/features/auth/screens/signup_widget/widget_interest.dart';
import 'package:pisiit/features/auth/screens/signup_widget/widget_relationgoals.dart';
import 'package:pisiit/utils/colors.dart';
import 'package:pisiit/utils/signin_showpopup.dart';
import 'package:pisiit/widgets/custom_button.dart';
class RelationWidgetProfile extends StatelessWidget {
  final List<String> relationGoals;
  const RelationWidgetProfile({super.key, required this.relationGoals});


  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title:  Text("Relation Goals"),
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15),
        child: CustomButton(
          colorText: whiteColor, textButton: "ok",
          onPressed: (){
             
                            Navigator.pop(context);
                   
          },
          ),
      ),
    );
  }
}