// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sssv1/User_Activity%20Section/display_user_activities.dart';

import 'package:sssv1/bottomnavpages/searchpage.dart';
import 'package:sssv1/screens/NewUserProfile.dart';
import 'package:sssv1/screens/homepage.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:sssv1/utils/constants.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({super.key});

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  final accentColor = const Color(0xffffffff);
  final backgroundColor = Colors.black12.withOpacity(.2);

  // final user = FirebaseAuth.instance.currentUser;

  // String? userid;

  final pages = [
    MyHomePage(),
    SearchBarPage(),
    UserActivityScreen(),
    NewUserProfilePage(),
  ];

  final primaryColor = Colors.black;
  final secondaryColor = Colors.black54;

  int _currentIndex = 0;

  // Color getDecorationColor(int index) {
  //   if (index == 0) {
  //     // If the input integer is equal to 0, then the function returns the color
  //     // white70 which is a semi-transparent white color.
  //     return Colors.white;
  //   } else {
  //     // If the input integer is not equal to 0, then the function returns the color
  //     // transparent which has no opacity, i.e. fully transparent.

  //     return Colors.transparent;
  //   }
  // }
  @override
  void initState() {
    super.initState();
    MyHomePage();
    // userid = user?.uid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.deepOrange,

      appBar: _currentIndex == 0
          ? AppBar(
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Image.asset(
                  "images/logo4.png",
                  width: 120,
                  height: 110,
                  color: Colors.black,
                ),
              ),
              toolbarHeight: 75.0,
              // backgroundColor: Colors.white,
              // backgroundColor: tgPrimaryColor,
              backgroundColor: Color.fromARGB(255, 78, 155, 151),
              elevation: 3.0,
            )
          : null,
      body: pages[_currentIndex],
      extendBody: true,
      bottomNavigationBar: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SafeArea(
              child: Container(
                padding: EdgeInsets.all(4),
                margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                decoration: BoxDecoration(
                  // color: Colors.transparent,
                  // color: getDecorationColor(_currentIndex),
                  color: secondaryColor10LightTheme,
                  // border: Border.all(color: Colors.black, width: 0.06),

                  border: Border.all(
                    color: Colors.black,
                    width: 0.28,
                  ),

                  borderRadius: BorderRadius.all(Radius.circular(28)),
                ),
                child: SizedBox(
                  // height: 50,
                  // width: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      NavBarIcon(
                        text: "Home",
                        icon: LineAwesomeIcons.home,

                        selected: _currentIndex == 0,
                        onPressed: () {
                          setState(() {
                            _currentIndex = 0;
                          });
                        },
                        // defaultColor: secondaryColor,
                        // selectedColor: primaryColor,
                      ),
                      NavBarIcon(
                        text: "Search",
                        icon: LineAwesomeIcons.search,
                        selected: _currentIndex == 1,
                        onPressed: () {
                          setState(() {
                            _currentIndex = 1;
                          });
                        },
                        defaultColor: secondaryColor,
                        selectedColor: primaryColor,
                      ),
                      NavBarIcon(
                        text: "Your Activity",
                        icon: Icons.rate_review_outlined,
                        selected: _currentIndex == 2,
                        onPressed: () {
                          setState(() {
                            _currentIndex = 2;
                          });
                        },
                        defaultColor: secondaryColor,
                        selectedColor: primaryColor,
                      ),
                      NavBarIcon(
                        text: "MyProfile",
                        icon: LineAwesomeIcons.user_secret,
                        selected: _currentIndex == 3,
                        onPressed: () {
                          setState(() {
                            _currentIndex = 3;
                          });
                        },
                        selectedColor: primaryColor,
                        defaultColor: secondaryColor,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(12))),
            ),
          ],
        ),
      ),
    );
  }
}

class NavBarIcon extends StatelessWidget {
  const NavBarIcon({
    Key? key,
    required this.text,
    required this.icon,
    required this.selected,
    required this.onPressed,
    this.selectedColor = Colors.black,
    this.defaultColor = Colors.grey,
  }) : super(key: key);

  final Color defaultColor;
  final IconData icon;
  final Function() onPressed;
  final bool selected;
  final Color selectedColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: 27,
            color: selected ? selectedColor : defaultColor,
          ),
        ),
      ],
    );
  }
}
