import 'package:flutter/material.dart';
import 'package:pisiit/features/auth/widgets/widget_title.dart';
import 'package:pisiit/utils/colors.dart';
import 'package:pisiit/utils/helper_padding.dart';

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

            WidgetTitle(
              title: "welcome", subTitle: "please wait"
              ),
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
