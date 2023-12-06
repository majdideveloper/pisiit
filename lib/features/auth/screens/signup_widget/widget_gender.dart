// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pisiit/features/auth/widgets/widget_title.dart';
import 'package:pisiit/utils/colors.dart';
import 'package:pisiit/utils/helper_padding.dart';
import 'package:pisiit/utils/helper_textstyle.dart';

class GenderWidget extends StatelessWidget {
  final TabController tabController;
  final List<String> gender;
  const GenderWidget({
    Key? key,
    required this.tabController,
    required this.gender,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const WidgetTitle(
            title: "Be true to yourself 🌟",
            subTitle:
                "Choose the gender that best represents you Authenticity is key to meaningful connections."),
        mediumPaddingVert,
        CustomShapes(
          gender: gender,
        ),
      ],
    );
  }
}

class CustomShapes extends StatefulWidget {
  final List<String> gender;
  const CustomShapes({
    Key? key,
    required this.gender,
  }) : super(key: key);

  @override
  _CustomShapesState createState() => _CustomShapesState();
}

class _CustomShapesState extends State<CustomShapes> {
  int selectedShapeIndex = -1; // -1 represents no selection

  List<ShapeItemData> shapes = [
    ShapeItemData(0, 'Male', 'assets/images/male_gender.png'),
    ShapeItemData(1, 'Female', 'assets/images/femal_gender.png'),
    ShapeItemData(2, 'Non Binary', 'assets/images/bi_gender.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: shapes
          .asMap()
          .entries
          .map((entry) => ShapeItem(
                shapeData: entry.value,
                color: selectedShapeIndex == entry.key ||
                        widget.gender[0] == shapes[entry.key].text
                    ? primaryColor
                    : greyColor.shade300,
                onShapeSelected: () {
                  _handleShapeSelected(
                    entry.key,
                  );
                },
              ))
          .toList(),
    );
  }

  void _handleShapeSelected(int index) {
    setState(() {
      // Toggle the selection
      selectedShapeIndex = selectedShapeIndex == index ? -1 : index;
      if (selectedShapeIndex != -1) {
        //value = shapes[selectedShapeIndex].text;
        print('Selected shape text: ${shapes[selectedShapeIndex].text}');
        widget.gender[0] = shapes[selectedShapeIndex].text;
      }
    });
  }
}

class ShapeItem extends StatelessWidget {
  final ShapeItemData shapeData;
  final Color color;
  final VoidCallback onShapeSelected;

  const ShapeItem({
    required this.shapeData,
    required this.color,
    required this.onShapeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onShapeSelected,
      child: Container(
        width: 100,
        height: 150,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              shapeData.imagePath,
              width: 70,
              height: 70,
            ),
            smallPaddingVert,
            Text(
              shapeData.text,
              style: textStyleTextBold,
            ),
          ],
        ),
      ),
    );
  }
}

class ShapeItemData {
  final int shapeIndex;
  final String text;
  final String imagePath;

  ShapeItemData(this.shapeIndex, this.text, this.imagePath);
}
