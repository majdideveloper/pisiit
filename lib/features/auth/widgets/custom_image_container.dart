import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pisiit/utils/colors.dart';

class CustomImageContainer extends StatefulWidget {
  File? imageUrl;
  List<File?> listImages;
  CustomImageContainer({
    Key? key,
    this.imageUrl,
    required this.listImages,
  }) : super(key: key);

  @override
  State<CustomImageContainer> createState() => _CustomImageContainerState();
}

class _CustomImageContainerState extends State<CustomImageContainer> {
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        widget.imageUrl = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0, right: 10.0),
      child: Container(
        height: 150,
        width: 100,
        decoration: BoxDecoration(
          color: greyColor.shade200,
          borderRadius: BorderRadius.circular(5.0),

          //  Border.all(
          //   color: Theme.of(context).primaryColor,
          // ),
        ),
        child: (widget.imageUrl == null)
            ? Center(
                child: IconButton(
                  icon: Icon(
                    Icons.add,
                    color: purpleColor,
                  ),
                  onPressed: () async {
                    // ImagePicker _picker = ImagePicker();
                    // final XFile? _image = await _picker.pickImage(
                    //   source: ImageSource.gallery,
                    //   imageQuality: 50,
                    // );
                    await _pickImage();

                    if (widget.imageUrl == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('No image was selected.')));
                    }

                    if (widget.imageUrl != null) {
                      print('Uploading ...');
                      setState(() {
                        widget.listImages.add(widget.imageUrl);
                      });
                      // BlocProvider.of<OnboardingBloc>(context).add(
                      //   UpdateUserImages(image: _image),
                      // );
                    }
                  },
                ),
              )
            : Image.file(
                widget.imageUrl!,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
