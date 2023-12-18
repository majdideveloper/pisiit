import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:pisiit/features/auth/screens/signup_widget/widget_gender.dart";
import "package:pisiit/features/home/controller/home_controller.dart";
import 'package:pisiit/features/auth/widgets/customtext_field.dart';
import "package:pisiit/utils/colors.dart";
import "package:pisiit/utils/helper_padding.dart";
import "package:pisiit/utils/helper_textstyle.dart";

import "package:pisiit/widgets/custom_button.dart";


class EditProfile extends ConsumerStatefulWidget {
  static const routeName = '/edit-profile';
  final String userid;
  const EditProfile({super.key, required this.userid});


  @override
  ConsumerState<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends ConsumerState<EditProfile> {

  final NicknameController= TextEditingController();
  final birthController= TextEditingController();

  void editInformationProfile (){
     String name = NicknameController.text.trim();
     ref.read(homeControllerProvider).updateUser(
      widget.userid,
      name,
      context
     );
     print("update username");
     


  }
   List<String> gender =[" "];
  @override
  Widget build(BuildContext context) {

   
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 24,
            ),
          ),
          title: Text(
            "Edit Profile",
            style: textStyleSubtitle,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(children: [
              //!pic
              Text(widget.userid),
              //! nickname + birthday
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("NickName", style:textStyleTextBold,),
                      SizedBox(
                        width: 150,
                        child: CustomTextField(
                                hintText: 'Nickname',
                                controller: NicknameController,
                                ),
                      ),
                    ],
                  ),
                   
                  Column(
                    children: [
                      Text("Birthday", style:textStyleTextBold,),
                      SizedBox(
                        width: 150,
                        child: CustomTextField(
                                hintText: 'birth',
                                controller: birthController,
                                ),
                      ),
                    ],
                  ),
                ],
              ),
            mediumPaddingVert,
             
              //!gender
              Text("Gender", style:textStyleTextBold,),
              smallPaddingVert,
             CustomShapes(
              gender:gender,
              withContainer: 70,
              heightContainer: 80,
              ),
              mediumPaddingVert,
              //! job title
              Text("Job title", style:textStyleTextBold,),
                            smallPaddingVert,

              CustomTextField(
                                hintText: 'job title',
                                controller: birthController,
                                ),
              //! living in
              mediumPaddingVert,
              Text("Living", style:textStyleTextBold,),
                            smallPaddingVert,

              CustomTextField(
                                hintText: 'country',
                                controller: birthController,
                                ),
                                mediumPaddingVert,
              //! about me
 mediumPaddingVert,
              Text("about me", style:textStyleTextBold,),
                            smallPaddingVert,

              CustomTextField(
                                hintText: 'about me',
                                controller: birthController,

                                ),
                                mediumPaddingVert,
              //! interest
              
              //! relations goals
              //! save and cancel button
            
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
                  onPressed:()async {
                    editInformationProfile;
                    //showSignInPopup(context, "UPDATE", "UPDATE SUCCESS", Icons.person);
                    //await Future.delayed(Duration(seconds: 10));
                     CircularProgressIndicator();
                     Navigator.pop(context);

                  } ,
                  
                  )),
                ],
              )
              )
            ]),
          ),
        ));
  }
}
