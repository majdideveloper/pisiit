import 'package:flutter/material.dart';
import 'package:pisiit/features/auth/screens/signup_widget/widget_birthday.dart';
import 'package:pisiit/features/auth/screens/signup_widget/widget_email.dart';
import 'package:pisiit/features/auth/screens/signup_widget/widget_gender.dart';
import 'package:pisiit/features/auth/screens/signup_widget/widget_images.dart';
import 'package:pisiit/features/auth/screens/signup_widget/widget_nickname.dart';

import 'package:pisiit/features/auth/screens/signup_widget/widget_relationgoals.dart';
import 'package:pisiit/features/auth/widgets/textfield_auth.dart';
import 'package:pisiit/utils/colors.dart';
import 'package:pisiit/widgets/custom_button.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/signup-screen';
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Builder(
        builder: (BuildContext context) {
          final TabController tabController = DefaultTabController.of(context);
          return Scaffold(
            appBar: AppBar(
                centerTitle: true,
                title: SizedBox(
                  width: 220,
                  child: LinearProgressIndicator(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    minHeight: 10,
                    backgroundColor: greyColor,
                    color: purpleColor,
                    value: 0.2,
                  ),
                )),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TabBarView(
                // physics: const NeverScrollableScrollPhysics(),
                children: [
                  WidgetEmail(tabController: tabController),
                  WidgetNickName(
                      tabController: tabController,
                      nameController: _nameController),
                  WidgetBirthday(
                    tabController: tabController,
                  ),
                  GenderWidget(
                    tabController: tabController,
                  ),
                  RelationGoalsWidget(tabController: tabController),
                  WidgetImages(
                    tabController: tabController,
                    listImages: [],
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child:
                  CustomButton(colorText: purpleColor, textButton: "Sign up"),
            ),
          );
        },
      ),
    );
  }
}
