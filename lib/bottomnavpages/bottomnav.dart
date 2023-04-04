// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sssv1/bottomnavpages/communitypage.dart';
import 'package:sssv1/bottomnavpages/profilepage/profile.dart';
import 'package:sssv1/bottomnavpages/search.dart';
import 'package:sssv1/screens/homepage.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({super.key});

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  final primaryColor = Colors.black;
  final secondaryColor = Colors.black54;
  final accentColor = const Color(0xffffffff);
  final backgroundColor = Colors.black12.withOpacity(.2);

  int _currentIndex = 0;

  final pages = [
    MyHomePage(),
    Searchpage(),
    Communitypage(),
    MyProfilepage(),
  ];

  Color getDecorationColor(int index) {
    if (index == 0) {
      // If the input integer is equal to 0, then the function returns the color
      // white70 which is a semi-transparent white color.
      return Colors.white70;
    } else {
      // If the input integer is not equal to 0, then the function returns the color
      // transparent which has no opacity, i.e. fully transparent.

      return Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      body: pages[_currentIndex],
      extendBody: true,
      bottomNavigationBar: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SafeArea(
              child: Container(
                padding: EdgeInsets.all(9),
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  // color: Colors.transparent,
                  color: getDecorationColor(_currentIndex),
                  border: Border.all(color: Colors.black, width: 0.06),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: SizedBox(
                  // height: 50,
                  // width: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      NavBarIcon(
                        text: "Home",
                        icon: Icons.apps,
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
                        icon: Icons.search_outlined,
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
                        text: "Community",
                        icon: Icons.comment_rounded,
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
                        icon: Icons.person,
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
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;
  final Color defaultColor;
  final Color selectedColor;

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
