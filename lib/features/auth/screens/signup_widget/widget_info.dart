import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:pisiit/features/auth/widgets/customtext_field.dart';
import 'package:pisiit/features/auth/widgets/widget_title.dart';
import 'package:pisiit/utils/colors.dart';
import 'package:pisiit/utils/helper_padding.dart';
import 'package:pisiit/widgets/custom_button.dart';

class InfoWidget extends StatefulWidget {
  final TabController tabController;
  final List<String> country;
  TextEditingController jobController;

  InfoWidget(
      {super.key,
      required this.tabController,
      required this.jobController,
      required this.country});

  @override
  State<InfoWidget> createState() => _InfoWidgetState();
}

class _InfoWidgetState extends State<InfoWidget> {
  Country? country;
  @override
  void pickCountry() {
    showCountryPicker(
        context: context,
        onSelect: (Country _country) {
          setState(() {
            country = _country;
            widget.country[0] = country!.displayNameNoCountryCode;
          });
          print(country);
        });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const WidgetTitle(
              title: "DConnections 🌐💼",
              subTitle:
                  "Reveal Your Job Status and Country Living for Meaningful Connections! Share your professional journey and explore matches who resonate with your lifestyle"),
          mediumPaddingVert,
          //country

          GestureDetector(
            onTap: pickCountry,
            child: Container(
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                color: greyColor.shade200,
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: Center(
                child: Text(
                  country?.name ?? "Your Country🌐",
                  style: TextStyle(
                      fontSize: 26,
                      color: country != null ? blackColor : Colors.grey[500],
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
          mediumPaddingVert,

          // TextButton(
          //       onPressed: pickCountry,
          //       child: const Text('choose country'),
          //     ),
          //job
          WidgetTitle(
              title: "Discover Your Careers and Connections 🌐💼",
              subTitle:
                  "Reveal Your Job Status and Country Living for Meaningful Connections! Share your professional journey and explore matches who resonate with your lifestyle"),
          mediumPaddingVert,
          CustomTextField(
            hintText: "Software developer",
            controller: widget.jobController,
          ),
        ],
      ),
    );
  }
}
