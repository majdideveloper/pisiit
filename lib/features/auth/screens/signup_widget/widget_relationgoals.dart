import 'package:flutter/material.dart';
import 'package:pisiit/features/auth/widgets/widget_title.dart';
import 'package:pisiit/utils/colors.dart';
import 'package:pisiit/utils/helper_padding.dart';
import 'package:pisiit/utils/helper_textstyle.dart';

class RelationGoalsWidget extends StatelessWidget {
  final TabController tabController;
  const RelationGoalsWidget({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        children: [
        const WidgetTitle(
            title: "Your relationship goals 💘", 
            subTitle: "Choose the type of relationship you're seeking on Pesst. Love, friendship or something in between -- it's your choice."
            ),
            mediumPaddingVert,
            //! widget choose relation goals
          RealtionSelectionScreen(),
        ],
      ),
    );
  }
}
class RealtionSelectionScreen extends StatefulWidget {
  @override
  _RealtionSelectionScreenState createState() => _RealtionSelectionScreenState();
}

class _RealtionSelectionScreenState extends State<RealtionSelectionScreen> {
  String selectedValue = '';

  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          buildSelectableContainer('Dating 👩‍❤️‍👨', 'seeking love and meaningful connection?\nChoose dating for genune relationship'),
          buildSelectableContainer('Friendship 🙌','Expand your social circle and make new friends Opt for freindship today'),
          buildSelectableContainer('Casual 😀','Looking for fun and relaxed oncounters? Select casual for carefree connections.'),
          buildSelectableContainer('Serious Relationship 💍','Ready for commitment and a lasting partnership? Pick serious relationship'),
          mediumPaddingVert,
          Text('Selected Value: $selectedValue'),
        ],
     
    );
  }

  Widget buildSelectableContainer(String value, String subtitle) {
    bool isSelected = selectedValue == value;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedValue = value;
        });
      },
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? purpleColor : greyColor.shade300,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: textStyleTextBold
            ),
            smallPaddingVert,
            Text(
              subtitle,
              style: textStyleText,
            ),
          ],
        ),
      ),
    );
  }
}