// // // ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors

// // import 'package:flutter/material.dart';
// // import 'package:sssv1/login/google_login_controller.dart';
// // import 'package:provider/provider.dart';

// // class MyDrawerList extends StatefulWidget {
// //   const MyDrawerList({super.key});

// //   @override
// //   State<MyDrawerList> createState() => _MyDrawerListState();
// // }

// // class _MyDrawerListState extends State<MyDrawerList> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       child: Column(children: [
// //         SizedBox(height: 460),
// //         Padding(
// //           padding: const EdgeInsets.all(20.0),
// //           child: ElevatedButton(
// //               style: ElevatedButton.styleFrom(
// //                 backgroundColor: Colors.white,
// //                 minimumSize: Size(double.infinity, 50),
// //                 shape: RoundedRectangleBorder(
// //                   borderRadius: BorderRadius.circular(11),
// //                 ),
// //                 side: BorderSide(color: Colors.black26, width: 0.7),
// //               ),
// //               onPressed: () {
// //                 final provider =
// //                     Provider.of<GoogleSignInController>(context, listen: false);
// //                 provider.logOut();
// //               },
// //               child: Text(
// //                 'Logout',
// //                 style: TextStyle(fontSize: 18, color: Colors.black87),
// //               )),
// //         )
// //       ]),
// //     );
// //   }
// // }

// /////////////////////// bottom navigation Bar ////////////////////////////////

// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import "package:flutter/material.dart";
// import "package:sssv1/bottomnavpages/communitypage.dart";
// import "package:sssv1/bottomnavpages/profile.dart";
// import "package:sssv1/bottomnavpages/search.dart";
// import "package:sssv1/screens/homepage.dart";

// class BottomNavPage extends StatefulWidget {
//   const BottomNavPage({super.key});

//   @override
//   State<BottomNavPage> createState() => _BottomNavPageState();
// }

// class _BottomNavPageState extends State<BottomNavPage> {
//   int _currentindex = 0;

//   final pages = [
//     MyHomePage(),
//     Communitypage(),
//     Searchpage(),
//     MyProfilepage(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//         selectedItemColor: Colors.black,
//         unselectedItemColor: Colors.black45,
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         currentIndex: _currentindex,
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.apps_sharp), label: 'Home'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.person_pin_rounded), label: 'Community'),
//           BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.person), label: ' My Profile'),
//         ],
//         onTap: (index) {
//           setState(() {
//             _currentindex = index;
//           });
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/Material.dart';

class BottomNavBarTransparentFb1 extends StatefulWidget {
  const BottomNavBarTransparentFb1({Key? key}) : super(key: key);

  @override
  _BottomNavBarTransparentFb1State createState() =>
      _BottomNavBarTransparentFb1State();
}

class _BottomNavBarTransparentFb1State
    extends State<BottomNavBarTransparentFb1> {
  //- - - - - - - - - instructions - - - - - - - - - - - - - - - - - -
  // WARNING! MUST ADD extendBody: true; TO CONTAINING SCAFFOLD
  //
  // Instructions:
  //
  // add this widget to the bottomNavigationBar property of a Scaffold, along with
  // setting the extendBody parameter to true i.e:
  //
  // Scaffold(
  //  extendBody: true,
  //  bottomNavigationBar: BottomNavBarTransparentFb1()
  // )
  //
  // Properties such as color and height can be set by changing the properties at the top of the build method
  //
  // For help implementing this in a real app, watch https://www.youtube.com/watch?v=C0_3w0kd0nc. The style is different, but connecting it to navigation is the same.
  //
  //- - - - - - - - - - - - - - -  - - - - - - - - - - - - - - - - - -

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = 56;

    final primaryColor = Colors.orange;
    final secondaryColor = Colors.black54;
    final accentColor = const Color(0xffffffff);
    final backgroundColor = Colors.black12.withOpacity(.2);

    return BottomAppBar(
      color: backgroundColor,
      elevation: 0,
      child: Stack(
        children: [
          Container(
            height: height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NavBarIcon(
                  text: "Home",
                  icon: Icons.home_outlined,
                  selected: true,
                  onPressed: () {},
                  defaultColor: secondaryColor,
                  selectedColor: primaryColor,
                ),
                NavBarIcon(
                  text: "Search",
                  icon: Icons.search_outlined,
                  selected: false,
                  onPressed: () {},
                  defaultColor: secondaryColor,
                  selectedColor: primaryColor,
                ),
                NavBarIcon(
                    text: "Cart",
                    icon: Icons.local_grocery_store_outlined,
                    selected: false,
                    onPressed: () {},
                    defaultColor: secondaryColor,
                    selectedColor: primaryColor),
                NavBarIcon(
                  text: "Calendar",
                  icon: Icons.date_range_outlined,
                  selected: false,
                  onPressed: () {},
                  selectedColor: primaryColor,
                  defaultColor: secondaryColor,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NavBarIcon extends StatelessWidget {
  const NavBarIcon(
      {Key? key,
      required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed,
      this.selectedColor = const Color(0xffFF8527),
      this.defaultColor = Colors.black54})
      : super(key: key);
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
            size: 25,
            color: selected ? selectedColor : defaultColor,
          ),
        ),
      ],
    );
  }
}
