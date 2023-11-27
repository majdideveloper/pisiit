import 'package:flutter/material.dart';
import 'package:pisiit/utils/colors.dart';
import 'package:pisiit/utils/helper_textstyle.dart';

class AppBarProfile extends StatelessWidget implements PreferredSizeWidget {
  const AppBarProfile({super.key});

  @override
  Size get preferredSize => Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.symmetric(
          // horizontal: 16.0,
          vertical: 16.0,
        ),
        child: Image.asset(
          "assets/images/logo_request_active.png",
          height: 30,
          width: 30,
        ),
      ),
      title: Text(
        "Profile",
        style: textStyleSubtitle,
      ),
      centerTitle: true,
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            decoration: const BoxDecoration(
                color: purpleColor,
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(12),
                  right: Radius.circular(12),
                )),
            child: const Text("⭐UPGRADE"),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.settings,
            size: 24,
          ),
        ),
      ],
    );
  }
}