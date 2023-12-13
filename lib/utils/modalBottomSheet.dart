import 'package:flutter/material.dart';
import 'package:pisiit/features/auth/screens/signup_widget/widget_interest.dart';
import 'package:pisiit/utils/colors.dart';
import 'package:pisiit/utils/helper_padding.dart';
import 'package:pisiit/utils/helper_textstyle.dart';
import 'package:pisiit/widgets/custom_button.dart';

class ModalBottomSheet extends StatefulWidget {
  List<String> goalRelation = [];
  ModalBottomSheet({super.key});

  @override
  State<ModalBottomSheet> createState() => _ModalBottomSheetState();
}

enum Gender { male, female, other }

class _ModalBottomSheetState extends State<ModalBottomSheet> {
  double _startValue = 18;
  double _endValue = 50;
  Gender? _selectedGender = Gender.male;

  RangeValues values = RangeValues(18, 60);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close),
              ),
              largePaddingHor,
              Text("Filter & Show",
                  style: textStyleTextBold.copyWith(fontSize: 24)),
            ],
          ),
          divider,
          smallPaddingVert,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Age Range',
                style: textStyleTextBold,
              ),
              Text(
                "${_startValue.truncate()} - ${_endValue.truncate()}",
                style: textStyleTextMeduimBold,
              )
            ],
          ),
          mediumPaddingVert,
          RangeSlider(
            values: RangeValues(_startValue, _endValue),
            min: 0,
            max: 100,
            onChanged: (RangeValues values) {
              setState(() {
                _startValue = values.start;
                _endValue = values.end;
              });
            },
          ),
          mediumPaddingVert,
          divider,
          smallPaddingVert,
          Text(
            'Show Me',
            style: textStyleTextBold,
          ),
          mediumPaddingVert,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Radio(
                    value: Gender.male,
                    groupValue: _selectedGender,
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value;
                      });
                    },
                  ),
                  Text(
                    'Men',
                    style: textStyleTextBold,
                  ),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: Gender.female,
                    groupValue: _selectedGender,
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value;
                      });
                    },
                  ),
                  Text(
                    'Women',
                    style: textStyleTextBold,
                  ),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: Gender.other,
                    groupValue: _selectedGender,
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value;
                      });
                    },
                  ),
                  Text(
                    'Other',
                    style: textStyleTextBold,
                  ),
                ],
              ),
            ],
          ),
          mediumPaddingVert,
          divider,
          smallPaddingVert,
          Text(
            'Relationship Goals',
            style: textStyleTextBold,
          ),
          mediumPaddingVert,
          Wrap(
            runAlignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            runSpacing: 10,
            spacing: 5,
            children: [
              CustomTextContainer(
                  listInteresrt: widget.goalRelation, text: 'Dating 👩‍❤️‍👨'),
              CustomTextContainer(
                  listInteresrt: widget.goalRelation, text: 'Friendship 🙌'),
              CustomTextContainer(
                  listInteresrt: widget.goalRelation, text: 'Casual 😀'),
              CustomTextContainer(
                  listInteresrt: widget.goalRelation,
                  text: 'Serious Relationship 💍'),
            ],
          ),
          mediumPaddingVert,
          divider,
          smallPaddingVert,
          Row(
            children: [
              Expanded(
                  child: CustomButton(
                colorText: primaryColor,
                textButton: "Reset",
                color: lightColor,
                onPressed: () {
                  Navigator.pop(context);
                },
              )),
              Expanded(
                  child:
                      CustomButton(colorText: whiteColor, textButton: "Apply")),
            ],
          ),
          mediumPaddingVert,
        ],
      ),
    );
  }
}
