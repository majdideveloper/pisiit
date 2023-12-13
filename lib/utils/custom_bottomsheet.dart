import 'package:flutter/material.dart';
import 'package:pisiit/utils/colors.dart';
import 'package:pisiit/utils/helper_padding.dart';
import 'package:pisiit/widgets/custom_button.dart';

class CustomBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Elogout',
            
          ),
 smallPaddingVert,
          
              (Row(
                children: [
                  Expanded(
                    child: CustomButton(
                    colorText: primaryColor,
                    textButton: "cancel",
                    color: lightColor,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )),
                  Expanded(
                  child: CustomButton(
                  colorText: whiteColor, textButton: "save",
                  onPressed:(){},
                  
                  )),
                ],
              ))
            ],
          ),
      
      
    );
  }
}