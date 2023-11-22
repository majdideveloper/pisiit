import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pisiit/features/auth/controller/auth_controller.dart';
import 'package:pisiit/features/auth/screens/signup_widget/widget_birthday.dart';
import 'package:pisiit/features/auth/screens/signup_widget/widget_email.dart';
import 'package:pisiit/features/auth/screens/signup_widget/widget_gender.dart';
import 'package:pisiit/features/auth/screens/signup_widget/widget_images.dart';
import 'package:pisiit/features/auth/screens/signup_widget/widget_info.dart';
import 'package:pisiit/features/auth/screens/signup_widget/widget_interest.dart';
import 'package:pisiit/features/auth/screens/signup_widget/widget_nickname.dart';

import 'package:pisiit/features/auth/screens/signup_widget/widget_relationgoals.dart';

import 'package:pisiit/utils/colors.dart';
import 'package:pisiit/utils/signin_showpopup.dart';
import 'package:pisiit/widgets/custom_button.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  static const routeName = '/signup-screen';
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  //! controller signup
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();

  final dayController = TextEditingController();
  final monthController = TextEditingController();
  final yearController = TextEditingController();
  FocusNode dayfocusNode = FocusNode();
  FocusNode monthfocusNode = FocusNode();
  FocusNode yearfocusNode = FocusNode();

  List<String> gender = [""];
  List<String> relationGoals = [" "];
  List<File> listImages = [];
  List<String> interests = [];

  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    dayfocusNode.addListener(() {
      if (!dayfocusNode.hasFocus && dayController.text.length == 2) {
        // Move focus to the next field when the user has entered 2 characters
        FocusScope.of(context).requestFocus(monthfocusNode);
      }
    });
    monthfocusNode.addListener(() {
      if (!monthfocusNode.hasFocus && monthController.text.length == 2) {
        // Move focus to the next field when the user has entered 2 characters
        FocusScope.of(context).requestFocus(yearfocusNode);
      }
    });
  }

  @override
  void dispose() {
    dayController.dispose();
    monthController.dispose();
    yearController.dispose();
    dayfocusNode.dispose();
    monthfocusNode.dispose();
    yearfocusNode.dispose();
    super.dispose();
  }

  void registerWithEmailAndPassword(BuildContext context,
      TabController tabController, PageController pageController) {
    String email = emailController.text;
    String password = emailController.text;

    if (email.isNotEmpty && password.isNotEmpty) {
      ref
          .read(authControllerProvider)
          .signUpWithEmailAndPassword(email, password);

      tabController.animateTo(tabController.index + 1);
      pageController.animateToPage(
        tabController.index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      // showSnackBar(context: context, content: 'Fill out all the fields');
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Builder(
        builder: (BuildContext context) {
          final TabController tabController = DefaultTabController.of(context);
          final PageController pageController =
              PageController(initialPage: tabController.index);

          return Scaffold(
            appBar: AppBar(
                centerTitle: true,
                title: SizedBox(
                  width: 220,
                  child: tabController.index != 0
                      ? LinearProgressIndicator(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          minHeight: 10,
                          backgroundColor: greyColor,
                          color: blueColor,
                          valueColor:
                              const AlwaysStoppedAnimation<Color>(blueColor),
                          value: (tabController.index / 6).toDouble(),
                        )
                      : const SizedBox(),
                )),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: PageView(
                controller: pageController,
                onPageChanged: (index) {
                  setState(() {
                    tabController.index = index;
                  });
                },
                // physics: const NeverScrollableScrollPhysics(),
                children: [
                  WidgetEmail(
                    tabController: tabController,
                    emailController: emailController,
                    passwordController: passwordController,
                  ),
                  WidgetNickName(
                      tabController: tabController,
                      nameController: _nameController),
                  WidgetBirthday(
                    tabController: tabController,
                    dayController: dayController,
                    monthController: monthController,
                    yearController: yearController,
                    dayfocusNode: dayfocusNode,
                    monthfocusNode: monthfocusNode,
                    yearfocusNode: yearfocusNode,
                  ),
                  GenderWidget(
                    tabController: tabController,
                    gender: gender,
                  ),
                  RelationGoalsWidget(
                    tabController: tabController,
                    relationGoals: relationGoals,
                  ),
                  InterestWidget(
                    tabController: tabController,
                    interests: interests,
                  ),
                  InfoWidget(
                    tabController: tabController,
                    jobController: _jobController,
                  ),
                  WidgetImages(
                    tabController: tabController,
                    listImages: listImages,
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: kIsWeb
                  ? Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            colorText: purpleColor,
                            textButton:
                                tabController.index == 0 ? "Sign " : "Prev",
                            onPressed: () {
                              setState(() {
                                tabController
                                    .animateTo(tabController.index - 1);
                                pageController.animateToPage(
                                  tabController.index,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                );
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: CustomButton(
                            colorText: purpleColor,
                            textButton: tabController.index == 0
                                ? "Sign Up"
                                : "Continue",
                            onPressed: () {
                              setState(() {
                                tabController
                                    .animateTo(tabController.index + 1);
                                pageController.animateToPage(
                                  tabController.index,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                );
                              });
                            },
                          ),
                        ),
                      ],
                    )
                  : CustomButton(
                      colorText: purpleColor,
                      textButton:
                          tabController.index == 0 ? "Sign up" : "Continue",
                      onPressed: () {
                        print(tabController.index);
                        if (tabController.index == 0) {
                          registerWithEmailAndPassword(
                              context, tabController, pageController);
                        } else {
                          setState(() {
                            tabController.animateTo(tabController.index + 1);
                            pageController.animateToPage(
                              tabController.index,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          });
                        }
                      },
                    ),
            ),
          );
        },
      ),
    );
  }
}
