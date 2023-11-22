
import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:pisiit/features/auth/widgets/customtext_field.dart';
import 'package:pisiit/features/auth/widgets/widget_title.dart';
import 'package:pisiit/utils/helper_padding.dart';
class InfoWidget extends StatefulWidget {
  final  TabController tabController;
  TextEditingController jobController;
   InfoWidget({
    super.key, 
    required this.tabController,
    required this.jobController
    });

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
          });
          print(country);
        });
  }

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
       const WidgetTitle(
          title: "Discover Your Careers and Connections 🌐💼", 
          subTitle: "Reveal Your Job Status and Country Living for Meaningful Connections! Share your professional journey and explore matches who resonate with your lifestyle"
          ),
          mediumPaddingVert,
          //country
          TextButton(
                onPressed: pickCountry,
                child: const Text('choose country'),
              ),
          //job
          mediumPaddingVert,
          CustomTextField(
            hintText: "Software developer", 
            controller: widget.jobController,
            ),


      ],
    );
  }
}