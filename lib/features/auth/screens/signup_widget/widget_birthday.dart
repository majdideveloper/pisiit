// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pisiit/features/auth/widgets/customtext_field.dart';
import 'package:pisiit/features/auth/widgets/widget_title.dart';
import 'package:pisiit/utils/helper_padding.dart';

class WidgetBirthday extends StatelessWidget {
  final TextEditingController dayController;
  final TextEditingController monthController;
  final TextEditingController yearController;
  final FocusNode dayfocusNode;
  final FocusNode monthfocusNode;
  final FocusNode yearfocusNode;
  final TabController tabController;
  const WidgetBirthday({
    Key? key,
    required this.dayController,
    required this.monthController,
    required this.yearController,
    required this.dayfocusNode,
    required this.monthfocusNode,
    required this.yearfocusNode,
    required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
                child: CustomTextField(
                  hintText: "DD",
                  controller: dayController,
                  maxLength: 2,
                  keyboardType: TextInputType.number,
                  focusNode: dayfocusNode,
                ),
              ),
              const VerticalDivider(
                width: 2,
              ),
              Expanded(
                child: CustomTextField(
                  hintText: "MM",
                  controller: monthController,
                  maxLength: 2,
                  keyboardType: TextInputType.number,
                  focusNode: monthfocusNode,
                ),
              ),
              const VerticalDivider(
                width: 2,
              ),
              Expanded(
                flex: 2,
                child: CustomTextField(
                  hintText: "YYYY",
                  controller: yearController,
                  maxLength: 4,
                  keyboardType: TextInputType.number,
                  focusNode: yearfocusNode,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
