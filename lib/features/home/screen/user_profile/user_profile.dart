// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pisiit/features/home/controller/home_controller.dart';

import 'package:pisiit/features/home/screen/my_profile/profile_screen.dart';
import 'package:pisiit/features/home/screen/widgets/appbar_profile_user.dart';
import 'package:pisiit/features/home/screen/widgets/image_widget.dart';
import 'package:pisiit/features/home/screen/widgets/info_user_profile.dart';
import 'package:pisiit/models/user_model.dart';
import 'package:pisiit/utils/colors.dart';
import 'package:pisiit/utils/helper_padding.dart';
import 'package:pisiit/utils/signin_showpopup.dart';

class UserProfile extends StatelessWidget {
  static const routeName = '/user-profile-screen';
  final UserModel userModel;
  final UserModel ownUserModel;
  const UserProfile({
    Key? key,
    required this.userModel,
    required this.ownUserModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<bool> listBoolPictures = [
      true,
      false,
      false,
      false,
      false,
      false,
    ];
    for (int index = 1; index <= 5; index++) {
      if (userModel.imageURLs!.length > index) {
        print(userModel.imageURLs!.length);

        listBoolPictures[index] = true;
      } else {
        listBoolPictures[index] = false;
      }
    }

    return Scaffold(
      appBar: AppBarProfileUser(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              smallPaddingVert,
              ImageWidget(
                imageUrl: userModel.imageURLs![0],
              ),
              smallPaddingVert,
              InfoUserWidget(
                name: userModel.name,
                age: userModel.age,
                gender: userModel.gender,
                jobTitle: userModel.jobTitle,
                country: userModel.country
                    .substring(0, userModel.country.length - 5),
              ),
              smallPaddingVert,
              listBoolPictures[1] ? mediumPaddingVert : const SizedBox(),
              listBoolPictures[1]
                  ? ImageWidget(
                      imageUrl: userModel.imageURLs![1],
                    )
                  : const SizedBox(),
              smallPaddingVert,
              divider,
              smallPaddingVert,
              AboutMeWidget(
                aboutMe: userModel.bio.trim() == ""
                    ? "Describe yourself in two sentences to make your profile stand out. What are your key qualities or interests that you want someone to know? "
                    : userModel.bio,
              ),
              mediumPaddingVert,
              listBoolPictures[2] ? mediumPaddingVert : const SizedBox(),
              listBoolPictures[2]
                  ? ImageWidget(
                      imageUrl: userModel.imageURLs![2],
                    )
                  : const SizedBox(),
              smallPaddingVert,
              divider,
              smallPaddingVert,
              SectionWidget(
                nameSection: "Interests",
                interests: userModel.interests as List<String>,
              ),
              mediumPaddingVert,
              listBoolPictures[3] ? mediumPaddingVert : const SizedBox(),
              listBoolPictures[3]
                  ? ImageWidget(
                      imageUrl: userModel.imageURLs![3],
                    )
                  : const SizedBox(),
              smallPaddingVert,
              divider,
              smallPaddingVert,
              RelationshipGoalWidget(
                relationGoals: userModel.relationGoals,
              ),
              listBoolPictures[4] ? mediumPaddingVert : const SizedBox(),
              listBoolPictures[4]
                  ? ImageWidget(
                      imageUrl: userModel.imageURLs![4],
                    )
                  : const SizedBox(),
              smallPaddingVert,
              divider,
              smallPaddingVert,
              listBoolPictures[5] ? mediumPaddingVert : const SizedBox(),
              listBoolPictures[5]
                  ? ImageWidget(
                      imageUrl: userModel.imageURLs![5],
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // You can set your desired color here
                border: Border.all(
                  color: Colors.red,
                  width: 2.0,
                ),
              ),
              child: Center(
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.close,
                    size: 50,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ),
          mediumPaddingHor,
          Consumer(builder: (context, ref, child) {
            return FutureBuilder<bool>(
                future: ref
                    .watch(homeControllerProvider)
                    .canSendRequest(userModel.uid),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const SizedBox(); //CircularProgressIndicator();
                  }

                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  bool isUserInCollection = snapshot.data!;

                  return isUserInCollection
                      ? const SizedBox()
                      : GestureDetector(
                          onTap: () {
                            simplePisitDialog(
                                context: context,
                                sender: ownUserModel,
                                recipient: userModel);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                              width: 80.0,
                              height: 80.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                // You can set your desired color here
                                border: Border.all(
                                  color: purpleColor,
                                  width: 2.0,
                                ),
                              ),
                              child: Center(
                                  child: Image.asset(
                                "assets/images/logo_request_active.png",
                                height: 40,
                              )),
                            ),
                          ),
                        );
                });
          })
        ],
      ),
    );
  }
}
