// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pisiit/features/auth/controller/auth_controller.dart';
import 'package:pisiit/features/home/controller/home_controller.dart';

import 'package:pisiit/models/user_model.dart';
import 'package:pisiit/utils/colors.dart';
import 'package:pisiit/utils/helper_padding.dart';
import 'package:pisiit/utils/helper_textstyle.dart';
import 'package:pisiit/utils/signin_showpopup.dart';

class ChatsScreen extends StatelessWidget {
  final UserModel userModel;
  const ChatsScreen({
    Key? key,
    required this.userModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          "Chats",
          style: textStyleSubtitle,
        ),
        centerTitle: true,
        actions: [],
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "All your Requests",
                    style: textStyleTextBold,
                  ),
                  smallPaddingVert,
                  StreamBuilder(
                      stream: ref.watch(homeControllerProvider).getAllRequest(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return SizedBox(
                            height: 120,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: greyColor.shade300,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(12)),
                                      ),
                                      child: SizedBox(
                                        height: 100,
                                        width: 100,
                                      ),
                                    ),
                                  );
                                }),
                          );
                        }
                        if (!snapshot.hasData || snapshot.data!.isEmpty) {
                          return SizedBox(
                            height: 50,
                            child: Text(
                              'You don\'t have request yett ... try to send',
                              style: textStyleTextMeduimBold,
                            ),
                          );
                        }

                        // list or single element
                        var request = snapshot.data!;
                        return SizedBox(
                          height: 120,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: request.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    popUpRepondRequestDialog(
                                      context: context,
                                      requestModel: request[index],
                                      sender: userModel,
                                      recipient: userModel,
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(12)),
                                      child: CachedNetworkImage(
                                        imageUrl: request[index].imageSender,
                                        fit: BoxFit.cover,
                                        height: 100,
                                        width: 100,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        );
                      }),
                  divider,
                  ElevatedButton(
                    onPressed: () {
                      ref.read(authControllerProvider).signOut(context);
                    },
                    child: Text("out"),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
