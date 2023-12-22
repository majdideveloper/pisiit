import "dart:io";

import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:pisiit/features/auth/screens/signup_widget/widget_gender.dart";
import "package:pisiit/features/auth/widgets/custom_image_container.dart";
import "package:pisiit/features/home/controller/home_controller.dart";
import 'package:pisiit/features/auth/widgets/customtext_field.dart';
import "package:pisiit/features/home/screen/my_profile/profile_screen.dart";
import "package:pisiit/features/home/screen/my_profile/widgets/interst_widget.dart";
import "package:pisiit/features/home/screen/my_profile/widgets/relation_widget.dart";
import "package:pisiit/models/user_model.dart";
import "package:pisiit/utils/colors.dart";
import "package:pisiit/utils/helper_padding.dart";
import "package:pisiit/utils/helper_textstyle.dart";

import "package:pisiit/widgets/custom_button.dart";

class EditProfile extends ConsumerStatefulWidget {
  static const routeName = '/edit-profile';
  final String userid;
  final UserModel user;
  const EditProfile({required this.userid, required this.user});

  @override
  ConsumerState<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends ConsumerState<EditProfile> {
  final NicknameController = TextEditingController();
  final birthController = TextEditingController();
  final JobController = TextEditingController();
  final CountryController = TextEditingController();
  final aboutController = TextEditingController();

  List<String> gender = [" "];
  List<File?> listImages = [];
  List<String> Newinterests = [];
  List<String> newRelationGoals = [" "];

  void editInformationProfile() {
    String name = NicknameController.text.trim().isEmpty ?NicknameController.text.trim(): widget.user.name ;
    String birth = birthController.text.trim().isEmpty
        ? widget.user.birthday
        : birthController.text.trim();
    String job = JobController.text.trim().isEmpty
        ? widget.user.jobTitle
        : JobController.text.trim();
    String country = CountryController.text.trim().isEmpty
        ? widget.user.country
        : CountryController.text.trim();
    String about = aboutController.text.trim().isEmpty
        ? widget.user.bio
        : aboutController.text.trim();
    List<dynamic> interst =
        Newinterests.isEmpty ? widget.user.interests : Newinterests;
    String gend = gender.isEmpty ? widget.user.gender : gender[0];
    String relation = newRelationGoals.isEmpty
        ? widget.user.relationGoals
        : newRelationGoals[0];

    ref.read(homeControllerProvider).updateUser(
      widget.user.uid, 
      name, 
      birth,
      job, 
      country, 
      about, 
      interst, 
      gend, 
      relation, 
      context);

    print("update sucess");

  }

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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              //!pic
              Container(
                height: 300,
                child: ImagesEditContainer(
                  listImages: listImages,
                  listUrlsImages: widget.user.imageURLs,
                ),
              ),
              //! nickname + birthday
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "NickName",
                        style: textStyleTextBold,
                      ),
                      SizedBox(
                        width: 150,
                        child: CustomTextField(
                          fSize: 18,
                          hintText: widget.user.name,
                          controller: NicknameController,
                        ),
                      ),
                      Text(NicknameController.text),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Birthday",
                        style: textStyleTextBold,
                      ),
                      SizedBox(
                        width: 150,
                        child: CustomTextField(
                          fSize: 18,
                          hintText: widget.user.birthday,
                          controller: birthController,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              mediumPaddingVert,

              //!gender
              Text(
                "Gender",
                style: textStyleTextBold,
              ),
              smallPaddingVert,
              CustomShapes(
                gender: gender,
                withContainer: 70,
                heightContainer: 80,
              ),
              Text(gender.toString()),
              mediumPaddingVert,
              //! job title
              Text(
                "Job title",
                style: textStyleTextBold,
              ),
              smallPaddingVert,

              CustomTextField(
                fSize: 18,
                hintText: widget.user.jobTitle,
                controller: JobController,
              ),
              //! living in
              mediumPaddingVert,
              Text(
                "Living",
                style: textStyleTextBold,
              ),
              smallPaddingVert,

              CustomTextField(
                fSize: 18,
                hintText: widget.user.country,
                controller: CountryController,
              ),
              mediumPaddingVert,
              //! about me
              mediumPaddingVert,
              Text(
                "about me",
                style: textStyleTextBold,
              ),
              smallPaddingVert,
              CustomTextField(
                fSize: 18,
                hintText: widget.user.bio.isEmpty
                    ? 'Describe yourself in two sentences to make your profile stand out. What are your key qualities or interests that you want someone to know?'
                    : widget.user.bio,
                controller: aboutController,
                maxLength: 200,
                maxline: 3,
              ),
              mediumPaddingVert,
              //! interest
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Interset",
                    style: textStyleTextBold,
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InterstWidgetProfile(
                                      interests: Newinterests,
                                    )));
                      },
                      icon: Icon(Icons.arrow_forward_ios))
                ],
              ),
              Text(Newinterests.toString()),
              SectionWidget(
                nameSection: "",
                interests: Newinterests.length > 4
                    ? Newinterests
                    : widget.user.interests as List<String>,
              ),
              //! relations goals
              smallPaddingVert,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Relation GOALS",
                    style: textStyleTextBold,
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RelationWidgetProfile(
                                      relationGoals: newRelationGoals,
                                    )));
                      },
                      icon: Icon(Icons.arrow_forward_ios))
                ],
              ),
              Text(newRelationGoals.toString()),
              RelationshipGoalWidget(
                relationGoals: widget.user.relationGoals,
              ),
              //! save and cancel button
              mediumPaddingVert,
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
                    colorText: whiteColor,
                    textButton: "save",
                    onPressed: () async {
                     
                      editInformationProfile;
                      //showSignInPopup(context, "UPDATE", "UPDATE SUCCESS", Icons.person);
                      //await Future.delayed(Duration(seconds: 10));
                       CircularProgressIndicator();
                      Navigator.pop(context);
                    },
                  )),
                ],
              ))
            ]),
          ),
        ));
  }
}

class ImagesEditContainer extends StatelessWidget {
  const ImagesEditContainer({
    super.key,
    required this.listImages,
    required this.listUrlsImages,
  });

  final List<File?> listImages;
  final List<dynamic>? listUrlsImages;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 0.2,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.66,
        ),
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return (listImages.length > index)
              ? CustomImageContainer(
                  listImages: listImages,
                  imageUrl: listImages[index],
                )
              : CustomImageContainer(
                  listImages: listImages,
                );
        },
      ),
    );
  }
}
