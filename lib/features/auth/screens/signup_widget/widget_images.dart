import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pisiit/features/auth/widgets/custom_image_container.dart';
import 'package:pisiit/utils/helper_padding.dart';

class WidgetImages extends StatelessWidget {
  final TabController tabController;
  final List<File?> listImages;

  const WidgetImages({
    Key? key,
    required this.tabController,
    required this.listImages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                mediumPaddingVert,
                SizedBox(
                  height: 350,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 0.66,
                    ),
                    itemCount: 6,
                    itemBuilder: (BuildContext context, int index) {
                      return (listImages.length > index)
                          ? CustomImageContainer(
                              listImages: listImages,
                              imageUrl: listImages[index])
                          : CustomImageContainer(
                              listImages: listImages,
                            );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
