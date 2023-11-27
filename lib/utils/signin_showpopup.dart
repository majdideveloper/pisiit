import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pisiit/features/auth/widgets/widget_title.dart';
import 'package:pisiit/features/home/controller/home_controller.dart';
import 'package:pisiit/features/home/screen/widgets/image_widget.dart';
import 'package:pisiit/models/request_model.dart';
import 'package:pisiit/models/user_model.dart';
import 'package:pisiit/utils/colors.dart';

import 'package:pisiit/utils/helper_padding.dart';
import 'package:pisiit/utils/helper_textstyle.dart';
import 'package:pisiit/widgets/custom_button.dart';

Future<void> showSignInPopup(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        content: Container(
          height: 400,
          child: Column(children: [
            Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/bgicon.png"),
                ),
              ),
              child: const Center(
                child: Icon(
                  Icons.person,
                  size: 60,
                  color: Colors.white,
                ),
              ),
            ),
            WidgetTitle(title: "welcome", subTitle: "please wait"),
            mediumPaddingVert,
            CircularProgressIndicator(
              strokeWidth: 4,
            )
          ]),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('close'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

//! pop up send request
void simplePisitDialog(
    {required BuildContext context,
    required UserModel sender,
    required UserModel recipient}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // final DatabaseService databaseService = DatabaseService();
      TextEditingController controller = TextEditingController();
      return AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: Image.network(
                    sender.imageURLs![0],
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                smallPaddingVert,
                Text(
                  sender.name,
                  style: Theme.of(context).textTheme.bodyLarge,
                )
              ],
            ),
            mediumPaddingHor,
            Image.asset(
              'assets/images/logo_request_active.png',
              height: 40,
            ),
            mediumPaddingHor,
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: Image.network(
                    recipient.imageURLs![0],
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                smallPaddingVert,
                Text(
                  recipient.name,
                  style: Theme.of(context).textTheme.bodyLarge,
                )
              ],
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextField(
              hintText: "your Opener ..... be Creative.......",
              obscureText: false,
              controller: controller,
              maxLines: 5,
              style: textStyleTextBold.copyWith(
                fontSize: 16,
              ),
            )
          ],
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer(builder: (context, ref, child) {
              return CustomButton(
                colorText: purpleColor,
                textButton: "send",
                onPressed: () async {
                  ref.watch(homeControllerProvider).sendRequest(
                      recieverUserId: recipient.uid,
                      message: controller.text,
                      currentUserId: sender.uid);

                  Navigator.pop(context);
                },
              );
            }),
          ),
        ],
      );
    },
  );
}

//! pop up repondre about request
void popUpRepondRequestDialog(
    {required BuildContext context,
    required RequestModel requestModel,
    required UserModel sender,
    required UserModel recipient}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // final DatabaseService databaseService = DatabaseService();
      TextEditingController controller = TextEditingController();
      return AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: Image.network(
                    sender.imageURLs![0],
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                smallPaddingVert,
                Text(
                  sender.name,
                  style: Theme.of(context).textTheme.bodyLarge,
                )
              ],
            ),
            mediumPaddingHor,
            Image.asset(
              'assets/images/logo_request_active.png',
              height: 40,
            ),
            mediumPaddingHor,
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: Image.network(
                    recipient.imageURLs![0],
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                smallPaddingVert,
                Text(
                  recipient.name,
                  style: Theme.of(context).textTheme.bodyLarge,
                )
              ],
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            smallPaddingVert,
            Text(
              requestModel.opener,
              style: textStyleTextBold,
            ),
            smallPaddingVert,
            CustomTextField(
              hintText: "Repond about your Request...",
              obscureText: false,
              controller: controller,
              maxLines: 2,
              style: textStyleTextBold.copyWith(
                fontSize: 16,
              ),
            )
          ],
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
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
              GestureDetector(
                onTap: () {},
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
            ],
          )

          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Consumer(builder: (context, ref, child) {
          //     return CustomButton(
          //       colorText: purpleColor,
          //       textButton: "send",
          //       onPressed: () async {
          //         ref.watch(homeControllerProvider).sendRequest(
          //             recieverUserId: recipient.uid,
          //             message: controller.text,
          //             currentUserId: sender.uid);

          //         Navigator.pop(context);
          //       },
          //     );
          //   }),
          // ),
        ],
      );
    },
  );
}

Future<void> showPopRequest(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        content: SizedBox(
          height: 400,
          width: double.infinity,
          child: Column(children: [
            Row(
              children: [],
            ),
            Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/bgicon.png"),
                ),
              ),
              child: const Center(
                child: Icon(
                  Icons.person,
                  size: 60,
                  color: Colors.white,
                ),
              ),
            ),
            WidgetTitle(title: "welcome", subTitle: "please wait"),
            mediumPaddingVert,
            CircularProgressIndicator(
              strokeWidth: 4,
            )
          ]),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('close'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

int calculateAge(String birthday) {
  // Parse the birthday string into a DateTime object
  List<String> parts = birthday.split('/');
  int day = int.parse(parts[0]);
  int month = int.parse(parts[1]);
  int year = int.parse(parts[2]);
  DateTime birthDate = DateTime(year, month, day);

  // Calculate the difference between the current date and the birthdate
  DateTime currentDate = DateTime.now();
  int age = currentDate.year - birthDate.year;

  // Check if the birthday has occurred this year
  if (currentDate.month < birthDate.month ||
      (currentDate.month == birthDate.month &&
          currentDate.day < birthDate.day)) {
    age--;
  }

  return age;
}

class CustomTextField extends StatelessWidget {
  Function(String)? onEditingComplete;
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  IconData? icon;
  int? maxLines;
  TextStyle? style;

  CustomTextField(
      {this.onEditingComplete,
      required this.hintText,
      required this.obscureText,
      required this.controller,
      this.icon,
      this.maxLines,
      this.style});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onEditingComplete: () => onEditingComplete!(controller.value.text),
      cursorColor: Colors.white,
      maxLines: maxLines,
      style: style ?? TextStyle(color: Colors.white),
      obscureText: obscureText,
      decoration: InputDecoration(
        //fillColor: Color.fromRGBO(30, 29, 37, 1.0),
        fillColor: purpleColor.withOpacity(0.6),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white),
        prefixIcon: Icon(icon, color: Colors.white54),
      ),
    );
  }
}
