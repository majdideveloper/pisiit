import 'package:flutter/material.dart';
import 'package:pisiit/features/auth/screens/signup_widget/widget_interest.dart';
import 'package:pisiit/utils/colors.dart';
import 'package:pisiit/utils/signin_showpopup.dart';
import 'package:pisiit/widgets/custom_button.dart';
class InterstWidgetProfile extends StatefulWidget {
  final  List<String> interests;
  const InterstWidgetProfile({super.key, required this.interests});

  @override
  State<InterstWidgetProfile> createState() => _InterstWidgetProfileState();
}

class _InterstWidgetProfileState extends State<InterstWidgetProfile> {


   List<String> currentInterests = [];

  @override
  void initState() {
    super.initState();
    // Initialize the current interests with the initial interests.
    currentInterests = List.from(widget.interests);
  }
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title:  Text("Intersets"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child:
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: InterstList(interests: widget.interests,),
            ),
            
            Text(widget.interests.length.toString()),
          ],
        )
      ),
      floatingActionButton: CustomButton(
        colorText: whiteColor, 
        textButton: "ok(${widget.interests.length} / 5 )",
        onPressed: () {
          
          
          if( widget.interests.length != 5)
          {
            showSnackBar(context, "select 5 intersts");

          }
          else {

            Future.delayed(Duration(milliseconds: 500), () {
            Navigator.pop(context);
          });
            }
          
          
            
          
          
          
          },
        ),
        
    );
  }
}