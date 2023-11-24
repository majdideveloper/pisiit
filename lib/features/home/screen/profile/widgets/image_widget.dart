// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String imageUrl;
  const ImageWidget({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      child: Image.network(
        imageUrl,
        height: 400,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
