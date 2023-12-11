import "package:flutter/material.dart";
import "package:pisiit/utils/colors.dart";
import "package:pisiit/utils/helper_textstyle.dart";
import "package:pisiit/widgets/custom_button.dart";
import 'package:pisiit/features/auth/widgets/customtext_field.dart';
class EditProfile extends StatefulWidget {
  static const routeName = '/edit-profile';
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();


}

class _EditProfileState extends State<EditProfile> {

  final NicknameController= TextEditingController();
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
                                hintText: 'Nickname',
                                controller: NicknameController,
                                ),
                      ),
                    ],
                  ),
                ],
              ),
            
              //!gender
              //! job title
              //! living in
              //! about me
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
                          colorText: whiteColor, textButton: "save")),
                ],
              ))
            ]),
          ),
        ));
  }
}
