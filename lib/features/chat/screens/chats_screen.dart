// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pisiit/features/auth/controller/auth_controller.dart';
import 'package:pisiit/features/chat/controller/chat_controller.dart';
import 'package:pisiit/features/chat/screens/chat_contact_screen.dart';

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
                      stream: ref.watch(chatControllerProvider).getAllRequest(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
// make this widget in class
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
                          height: 150,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: request.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    popUpRepondRequestDialog(
                                      context: context,
                                      requestModel: request[index],
                                      sender: request[index].senderRequest,
                                      recipient: userModel,
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(12)),
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                request[index].imageSender,
                                            fit: BoxFit.cover,
                                            height: 100,
                                            width: 100,
                                          ),
                                        ),
                                        smallPaddingVert,
                                        Text(
                                          request[index].nameSender,
                                          style: textStyleText.copyWith(
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        );
                      }),
                  divider,
                  Expanded(
                      child: StreamBuilder(
                    stream:
                        ref.watch(chatControllerProvider).getAllChatcontact(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return ListView.builder(
                            scrollDirection: Axis.vertical,
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
                            });
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
                      var contacts = snapshot.data!;
                      print(contacts.length);
                      return SizedBox(
                        height: 150,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: contacts.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    ChatContactScreen.routeName,
                                    arguments: {
                                      'nameContact': contacts[index].name,
                                      'idContact': contacts[index].contactId,
                                    },
                                  );
                                  // this code need to change with push>named
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             const ChatContactScreen()));
                                },
                                child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(50)),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    contacts[index].profilePic,
                                                fit: BoxFit.cover,
                                                height: 60,
                                                width: 60,
                                              ),
                                            ),
                                            mediumPaddingHor,
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  contacts[index].name,
                                                  style: textStyleTextBold,
                                                ),
                                                Text(contacts[index]
                                                    .lastMessage),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              DateFormat('HH:mm').format(
                                                  contacts[index].timeSent),
                                              style: textStyleTextBold,
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                    // Container(
                                    //   decoration: BoxDecoration(
                                    //     color: greyColor.shade300,
                                    //     borderRadius: const BorderRadius.all(
                                    //         Radius.circular(12)),
                                    //   ),
                                    //   child: SizedBox(
                                    //     height: 100,
                                    //     width: 100,
                                    //   ),
                                    // ),
                                    ),
                              );
                            }),
                      );
                    },
                  )),
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
