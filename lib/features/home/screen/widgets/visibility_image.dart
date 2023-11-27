// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:pisiit/features/home/screen/widgets/image_widget.dart';
import 'package:pisiit/utils/helper_padding.dart';

class VisibilityImage extends StatelessWidget {
  final bool visibility;
  final String image;
  const VisibilityImage({
    Key? key,
    required this.visibility,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        visibility ? mediumPaddingVert : const SizedBox(),
        visibility
            ? ImageWidget(
                imageUrl: image,
              )
            : const SizedBox()
      ],
    );
  }
}
