// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String imageUrl;
  double? height;
  double? width;
  ImageWidget({
    Key? key,
    required this.imageUrl,
    this.height = 400,
    this.width = 400,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      child: CachedNetworkImage(
       imageUrl: imageUrl,
        height: 400,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
