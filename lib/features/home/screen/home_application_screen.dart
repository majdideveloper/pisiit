// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pisiit/features/auth/controller/auth_controller.dart';
import 'package:badges/badges.dart' as badges;
import 'package:pisiit/features/chat/screens/chats_screen.dart';
import 'package:pisiit/features/home/controller/home_controller.dart';
import 'package:pisiit/features/home/screen/home/home_screen.dart';
import 'package:pisiit/features/home/screen/my_profile/profile_screen.dart';
import 'package:pisiit/models/user_model.dart';
import 'package:pisiit/utils/colors.dart';
import 'package:pisiit/utils/helper_textstyle.dart';

class HomeApplicationScreen extends StatefulWidget {
  UserModel? userModel;
  HomeApplicationScreen({
    Key? key,
    this.userModel,
  }) : super(key: key);

  @override
  State<HomeApplicationScreen> createState() => _HomeApplicationScreenState();
}

class _HomeApplicationScreenState extends State<HomeApplicationScreen> {
  PageController _pageController = PageController();
  int _currentIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.animateToPage(
      selectedIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.userModel!.uid),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: [
          HomeScreen(
            userModel: widget.userModel!,
          ),
          ChatsScreen(
            userModel: widget.userModel!,
          ),
          ProfileScreen(
            userModel: widget.userModel!,
          ),
        ],
      ),
      bottomNavigationBar: Consumer(builder: (context, ref, child) {
        return StreamBuilder<int>(
            stream: ref.watch(homeControllerProvider).numberRequest(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  currentIndex: _currentIndex,
                  onTap: _onItemTapped,
                  backgroundColor: whiteColor,
                  elevation: 0,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: "Home",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.message),
                      label: "Chats",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: "Profile",
                    )
                  ],
                );
              }
              int numberOfRequests = snapshot.data!;
              return BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: _currentIndex,
                onTap: _onItemTapped,
                backgroundColor: whiteColor,
                elevation: 0,
                items: [
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: numberOfRequests == 0
                        ? const Icon(Icons.message)
                        : badges.Badge(
                            badgeContent: Text(numberOfRequests.toString()),
                            child: const Icon(Icons.message),
                          ),
                    label: "Chats",
                  ),
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: "Profile",
                  )
                ],
              );
            });
      }),
    );
  }
}
