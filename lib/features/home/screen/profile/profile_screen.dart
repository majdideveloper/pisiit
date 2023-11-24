// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pisiit/features/auth/controller/auth_controller.dart';
import 'package:pisiit/features/home/screen/profile/widgets/appbar_profile.dart';
import 'package:pisiit/features/home/screen/profile/widgets/complete_profile_widget.dart';
import 'package:pisiit/features/home/screen/profile/widgets/image_widget.dart';
import 'package:pisiit/features/home/screen/profile/widgets/info_user_profile.dart';
import 'package:pisiit/features/home/screen/profile/widgets/show_list_item.dart';
import 'package:pisiit/main.dart';

import 'package:pisiit/utils/helper_padding.dart';
import 'package:pisiit/utils/helper_textstyle.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarProfile(),
      body: Consumer(builder: (context, ref, child) {
        final userAsyncValue = ref.watch(userDataProvider);
        return userAsyncValue.when(
            loading: () => const Loader(),
            error: (error, stack) => Text('Error fetching user data: $error'),
            data: (userModel) {
              if (userModel != null) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CompleteProfileWidget(),
                        mediumPaddingVert,
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
                        ImageWidget(
                          imageUrl: userModel.imageURLs![0],
                        ),
                        smallPaddingVert,
                        divider,
                        smallPaddingVert,
                        AboutMeWidget(
                          aboutMe: userModel.bio.trim() == ""
                              ? "Describe yourself in two sentences to make your profile stand out. What are your key qualities or interests that you want someone to know? "
                              : userModel.bio,
                        ),
                        mediumPaddingVert,
                        ImageWidget(
                          imageUrl: userModel.imageURLs![0],
                        ),
                        smallPaddingVert,
                        divider,
                        smallPaddingVert,
                        SectionWidget(
                          nameSection: "Interests",
                          interests: userModel.interests as List<String>,
                        ),
                        mediumPaddingVert,
                        ImageWidget(
                          imageUrl: userModel.imageURLs![0],
                        ),
                        smallPaddingVert,
                        divider,
                        smallPaddingVert,
                        //! section Relationship goals
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Relationship Goals",
                              style: textStyleTextBold,
                            ),
                            smallPaddingVert,
                            ItemList(
                              text: userModel.relationGoals,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return Text('No user data available');
              }
            });
      }),
    );
  }
}

class AboutMeWidget extends StatelessWidget {
  final String aboutMe;
  const AboutMeWidget({
    Key? key,
    required this.aboutMe,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "About Me",
          style: textStyleTextBold,
        ),
        smallPaddingVert,
        Text(
          aboutMe,
          style: textStyleText,
        )
      ],
    );
  }
}

class SectionWidget extends StatelessWidget {
  final String nameSection;
  final List<String> interests;
  const SectionWidget({
    Key? key,
    required this.nameSection,
    required this.interests,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          nameSection,
          style: textStyleTextBold,
        ),
        smallPaddingVert,
        ShowListItem(
          list: interests,
        ),
      ],
    );
  }
}
