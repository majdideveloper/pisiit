// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pisiit/features/auth/widgets/customtext_field.dart';

import 'package:pisiit/features/auth/widgets/widget_title.dart';
import 'package:pisiit/utils/helper_padding.dart';

class WidgetBirthday extends StatefulWidget {
  final TabController tabController;
  const WidgetBirthday({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  State<WidgetBirthday> createState() => _WidgetBirthdayState();
}

class _WidgetBirthdayState extends State<WidgetBirthday> {
  final dayController = TextEditingController();
  final monthController = TextEditingController();
  final yearController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const WidgetTitle(
          title: "Let's celebrate you 🎂",
          subTitle:
              "Tell us your birthdate. your profile does not display birthdate only your age",
        ),
        mediumPaddingVert,
        Image.asset(
          "assets/images/birthday.png",
          height: 200,
          width: 200,
        ),
        mediumPaddingVert,
        //!  a complete after ...
        Row(
          children: [
            Expanded(
              child: CustomTextField(hintText: "DD", controller: dayController),
            ),
            const VerticalDivider(
              width: 2,
            ),
            Expanded(
              child:
                  CustomTextField(hintText: "MM", controller: monthController),
            ),
            const VerticalDivider(
              width: 2,
            ),
            Expanded(
              flex: 2,
              child:
                  CustomTextField(hintText: "YYYY", controller: yearController),
            ),
          ],
        )
      ],
    );
  }
}
