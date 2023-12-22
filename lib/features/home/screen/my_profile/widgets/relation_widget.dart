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
      floatingActionButton: CustomButton(
        colorText: whiteColor, textButton: "ok",
        onPressed: (){
            Future.delayed(Duration(milliseconds: 500), () {
              CircularProgressIndicator();
                          Navigator.pop(context);
           });        
        },
        ),
    );
  }
}