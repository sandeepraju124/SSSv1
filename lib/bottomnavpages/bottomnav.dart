// ignore_for_file: prefer_const_constructors, use_super_parameters, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/User_Activity%20Section/display_user_activities.dart';

import 'package:sssv1/bottomnavpages/searchpage.dart';
import 'package:sssv1/providers/live_user_location.dart';
import 'package:sssv1/providers/user_provider.dart';
import 'package:sssv1/screens/NewUserProfile.dart';
import 'package:sssv1/screens/homepage.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:sssv1/screens/userprofile_test.dart';
import 'package:sssv1/utils/constants.dart';
import 'package:sssv1/utils/navigator.dart';

import '../favorite_test.dart';
import '../homepage_new.dart';
import '../nearby_comments.dart';
import '../providers/comments_provider_new.dart';
import '../providers/favourite_provider.dart';
import '../providers/nearby_comments_provider.dart';
import '../providers/user_review_provider.dart';
import '../test.dart';

// class BottomNavPage extends StatefulWidget {
//   const BottomNavPage({super.key});

//   @override
//   State<BottomNavPage> createState() => _BottomNavPageState();
// }

// class _BottomNavPageState extends State<BottomNavPage> {
//   final accentColor = const Color(0xffffffff);
//   final backgroundColor = Colors.black12.withOpacity(.2);

//   // final user = FirebaseAuth.instance.currentUser;

//   // String? userid;

//   final pages = [
//     MyHomePage(),
//     SearchBarPage(),
//     UserActivityScreen(),
//     // NewUserProfilePage(),
//     ProfilePage(),
//   ];

//   final primaryColor = Colors.black;
//   final secondaryColor = Colors.black54;

//   int _currentIndex = 0;

//   // Color getDecorationColor(int index) {
//   //   if (index == 0) {
//   //     // If the input integer is equal to 0, then the function returns the color
//   //     // white70 which is a semi-transparent white color.
//   //     return Colors.white;
//   //   } else {
//   //     // If the input integer is not equal to 0, then the function returns the color
//   //     // transparent which has no opacity, i.e. fully transparent.

//   //     return Colors.transparent;
//   //   }
//   // }
//   @override
//   void initState() {
//     super.initState();
//     MyHomePage();
//     var liveLoc = Provider.of<LiveUserLocation>(context, listen: false);
//     if (liveLoc.latitude == null) {
//       print("called if in bottonnavbar init");
//       // print("null");
//       liveLoc.getCurrentLocation();
//     }

//     // userid = user?.uid;
//   }

//   @override
//   Widget build(BuildContext context) {
//     var data = Provider.of<LiveUserLocation>(context);
//     return Scaffold(
//       // backgroundColor: Colors.deepOrange,

//       appBar: _currentIndex == 0
//           ? AppBar(
//               // padding: EdgeInsets.only(left: 5, bottom: 5, top: 5),
//               leading: Container(
//                   margin: EdgeInsets.all(5),
//                   // color: Colors.indigo,
//                   decoration: BoxDecoration(
//                     // color: Colors.redAccent,
//                     // shape: BoxShape.circle,
//                     borderRadius: BorderRadius.circular(10.0),
//                     image: DecorationImage(
//                       fit: BoxFit.cover,
//                       image: AssetImage('images/stevejobs.jpg'),
//                     ),
//                   )),

//               title: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text("Change Address ⤵",
//                         style: TextStyle(fontSize: 15, color: Colors.white)),
//                     SizedBox(
//                       height: 2,
//                     ),
//                     Text(
//                         data.locationName.toString()
//                         // "Shamshiguda"
//                         ,
//                         style: TextStyle(fontSize: 12, color: Colors.white))
//                   ]),
//               // automaticallyImplyLeading: false,
//               // centerTitle: true,
//               // ),
//               toolbarHeight: 63.0,
//               // backgroundColor: Colors.white,
//               // backgroundColor: tgPrimaryColor,
//               backgroundColor: Color.fromARGB(255, 78, 155, 151),
//               elevation: 5.0,
//             )
//           : null,
//       body: pages[_currentIndex],
//       extendBody: true,
//       bottomNavigationBar: SingleChildScrollView(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             SafeArea(
//               child: Container(
//                 padding: EdgeInsets.all(4),
//                 margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//                 decoration: BoxDecoration(
//                   // color: Colors.transparent,
//                   // color: getDecorationColor(_currentIndex),
//                   color: secondaryColor10LightTheme,
//                   // border: Border.all(color: Colors.black, width: 0.06),

//                   border: Border.all(
//                     color: Colors.black,
//                     width: 0.28,
//                   ),

//                   borderRadius: BorderRadius.all(Radius.circular(28)),
//                 ),
//                 child: SizedBox(
//                   // height: 50,
//                   // width: 40,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       NavBarIcon(
//                         text: "Home",
//                         icon: LineAwesomeIcons.home,

//                         selected: _currentIndex == 0,
//                         onPressed: () {
//                           setState(() {
//                             _currentIndex = 0;
//                           });
//                         },
//                         // defaultColor: secondaryColor,
//                         // selectedColor: primaryColor,
//                       ),
//                       NavBarIcon(
//                         text: "Search",
//                         icon: LineAwesomeIcons.search,
//                         selected: _currentIndex == 1,
//                         onPressed: () {
//                           setState(() {
//                             _currentIndex = 1;
//                           });
//                         },
//                         defaultColor: secondaryColor,
//                         selectedColor: primaryColor,
//                       ),
//                       NavBarIcon(
//                         text: "Your Activity",
//                         icon: LineAwesomeIcons.accusoft,
//                         selected: _currentIndex == 2,
//                         onPressed: () {
//                           setState(() {
//                             _currentIndex = 2;
//                           });
//                         },
//                         defaultColor: secondaryColor,
//                         selectedColor: primaryColor,
//                       ),
//                       NavBarIcon(
//                         text: "MyProfile",
//                         icon: LineAwesomeIcons.user_secret,
//                         selected: _currentIndex == 3,
//                         onPressed: () {
//                           setState(() {
//                             _currentIndex = 3;
//                           });
//                         },
//                         selectedColor: primaryColor,
//                         defaultColor: secondaryColor,
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//               decoration: BoxDecoration(
//                   color: Colors.black,
//                   borderRadius: BorderRadius.all(Radius.circular(12))),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class NavBarIcon extends StatelessWidget {
//   const NavBarIcon({
//     Key? key,
//     required this.text,
//     required this.icon,
//     required this.selected,
//     required this.onPressed,
//     this.selectedColor = Colors.black,
//     this.defaultColor = Colors.grey,
//   }) : super(key: key);

//   final Color defaultColor;
//   final IconData icon;
//   final Function() onPressed;
//   final bool selected;
//   final Color selectedColor;
//   final String text;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         IconButton(
//           onPressed: onPressed,
//           icon: Icon(
//             icon,
//             size: 27,
//             color: selected ? selectedColor : defaultColor,
//           ),
//         ),
//       ],
//     );
//   }
// }

// class BottomNavPage extends StatefulWidget {
//   const BottomNavPage({Key? key}) : super(key: key);

//   @override
//   State<BottomNavPage> createState() => _BottomNavPageState();
// }

// class _BottomNavPageState extends State<BottomNavPage> {
//   int _currentIndex = 0;

//   final List<Widget> _pages = [
//     MyHomePage(),
//     SearchBarPage(),
//     UserActivityScreen(),
//     ProfilePage(),
//   ];

//   @override
//   void initState() {
//     super.initState();
//     var liveLoc = Provider.of<LiveUserLocation>(context, listen: false);
//     if (liveLoc.latitude == null) {
//       liveLoc.getCurrentLocation();
//     }

//     var userprov = Provider.of<UserProvider>(context, listen: false);
//     if (userprov.getUserData == null) {
//       userprov.userProvider();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     var data = Provider.of<LiveUserLocation>(context);
//     // var data2 = Provider.of<UserProvider>(context);
//     return Scaffold(
//       appBar: _currentIndex == 0 ? _buildAppBar(data) : null,
//       body: _pages[_currentIndex],
//       bottomNavigationBar: _buildBottomNavigationBar(),
//     );
//   }

// // NetworkImage(data.getUserData!.profile_image_url ?? defaultNetworkImage)
//   PreferredSizeWidget _buildAppBar(LiveUserLocation data) {
//     var userdata = Provider.of<UserProvider>(context);
//     return AppBar(
//       leading: Container(
//         margin: EdgeInsets.all(8),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10.0),
//           image: DecorationImage(
//               fit: BoxFit.cover,
//               image: NetworkImage(userdata.getUserData?.profile_image_url ??
//                   defaultNetworkImage)
//               // AssetImage('images/stevejobs.jpg'),
//               ),
//         ),
//       ),
//       title: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Change Address ⤵",
//             style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 2),
//           Text(
//             data.locationName ?? "Loading...",
//             style: TextStyle(fontSize: 12),
//           ),
//         ],
//       ),
//       // backgroundColor: Theme.of(context).primaryColor,
//       backgroundColor: tgDarkPrimaryColor,
//       elevation: 0,
//     );
//   }

//   Widget _buildBottomNavigationBar() {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 8,
//             offset: Offset(0, -2),
//           ),
//         ],
//       ),
//       child: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               _buildNavBarItem(0, LineAwesomeIcons.home, "Home"),
//               _buildNavBarItem(1, LineAwesomeIcons.search, "Search"),
//               _buildNavBarItem(2, LineAwesomeIcons.accusoft, "Activity"),
//               _buildNavBarItem(3, LineAwesomeIcons.user, "Profile"),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildNavBarItem(int index, IconData icon, String label) {
//     final isSelected = _currentIndex == index;
//     return InkWell(
//       onTap: () => setState(() => _currentIndex = index),
//       child: Container(
//         padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
//         decoration: BoxDecoration(
//           color: isSelected
//               ? Theme.of(context).primaryColor.withOpacity(0.1)
//               : Colors.transparent,
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Icon(
//               icon,
//               // color: isSelected ? Theme.of(context).primaryColor : Colors.grey,
//               color: isSelected ? tgDarkPrimaryColor : Colors.grey,
//               size: 24,
//             ),
//             SizedBox(height: 4),
//             Text(
//               label,
//               style: TextStyle(
//                 color:
//                     // isSelected ? Theme.of(context).primaryColor : Colors.grey,
//                     isSelected ? tgDarkPrimaryColor : Colors.grey,
//                 fontSize: 12,
//                 fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class BottomNavPage extends StatefulWidget {
  // const BottomNavPage({Key? key}) : super(key: key);
  final int initialIndex;
  BottomNavPage({this.initialIndex = 0});

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    // MyHomePage(),
    HomePageNew(),
    SearchBarPage(),
    UserActivityScreen(),
    ProfilePage(),
  ];

  // @override
  // void initState() {
  //   super.initState();
  //   var liveLoc = Provider.of<LiveUserLocation>(context, listen: false);
  //   if (liveLoc.latitude == null) {
  //     liveLoc.getCurrentLocation();
  //   }

  //   var userprov = Provider.of<UserProvider>(context, listen: false);
  //   if (userprov.getUserData == null) {
  //     userprov.userProvider();
  //   }
  // }

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeData();
    });


  }

  // void _initializeData() {
  //   var liveLoc = Provider.of<LiveUserLocation>(context, listen: false);
  //   if (liveLoc.latitude == null) {
  //     liveLoc.getCurrentLocation().then((onValue){
  //       if (onValue){
  //         var nearbycomments = Provider.of<NearbyCommentProvider>(context, listen: false);
  //         if (nearbycomments.comments.isEmpty && !nearbycomments.isLoading) {
  //           nearbycomments.fetchComments(liveLoc.latitude!, liveLoc.longitude!, 10000);
  //         }
  //
  //       }
  //
  //     });
  //   }
  //
  //   var userprov = Provider.of<UserProvider>(context, listen: false);
  //   if (userprov.getUserData == null && !userprov.isLoading) {
  //     userprov.userProvider();
  //   }
  //
  //   // var nearbycomments = Provider.of<NearbyCommentProvider>(context, listen: false);
  //   // if (nearbycomments.comments.isEmpty && !nearbycomments.isLoading) {
  //   //   nearbycomments.fetchComments(liveLoc.latitude!, liveLoc.longitude!, 10000);
  //   // }
  // }

  void _initializeData() async {
    // Capture the provider instances at the start
    final user = await FirebaseAuth.instance.currentUser!;
    print("User id: ${user.uid}");
    var liveLoc = Provider.of<LiveUserLocation>(context, listen: false);
    var userprov = Provider.of<UserProvider>(context, listen: false);
    var nearbycomments = Provider.of<NearbyCommentProvider>(context, listen: false);
    var userComments = Provider.of<UserCommentsProvider>(context, listen: false);
    var userFavourites = Provider.of<FavouriteProvider>(context, listen: false);

    // Fetch the user's location
    if (liveLoc.latitude == null) {
      bool locationFetched = await liveLoc.getCurrentLocation();
      if (locationFetched && mounted) {
        // Fetch comments only if location is successfully fetched
        if (nearbycomments.comments.isEmpty && !nearbycomments.isLoading) {
          await nearbycomments.fetchComments(liveLoc.latitude!, liveLoc.longitude!, 10000);
        }
      }
    }

    // Fetch user data if not already loaded
    if (userprov.getUserData == null && !userprov.isLoading) {
      userprov.userProvider();
    }

    // if (userComments.comments == null && !userComments.isLoading) {
    //   print("Fetching user comments");
    //   userComments.getUserComments(userprov.getUserData!.id);
    // }
    // userComments.getUserComments("Ygk9TDqaLTdqa1IaMvHH3zEX2M93");
    userComments.getUserComments(user.uid);
    userFavourites.getFavourites(user.uid);


  }


  @override
  Widget build(BuildContext context) {
    var data = Provider.of<LiveUserLocation>(context);
    return Scaffold(
      appBar: _currentIndex == 0 ? _buildAppBar(data) : null,
      body: _pages[_currentIndex],
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  // PreferredSizeWidget _buildAppBar(LiveUserLocation data) {
  //   var userdata = Provider.of<UserProvider>(context);
  //   return AppBar(
  //     actions: [
  //
  //       // Icons.abc_outlined
  //       GestureDetector(
  //         onTap: (){
  //           navigatorPush(context, AllReviewsScreen());
  //         },
  //           child: Icon(Icons.add_alarm_rounded, size: 16)),
  //     ],
  //
  //     leading: GestureDetector(
  //       onTap: (){
  //         navigatorPush(context, MyHomePage());
  //       },
  //       child: Container(
  //         margin: EdgeInsets.all(11),
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(10.0),
  //           image: DecorationImage(
  //             fit: BoxFit.cover,
  //             image: NetworkImage(
  //                 userdata.getUserData?.profile_image_url ?? defaultNetworkImage),
  //           ),
  //         ),
  //       ),
  //     ),
  //     title: GestureDetector(
  //       onTap: () {
  //         data.getCurrentLocation();
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(content: Text('Refreshing location...')),
  //         );
  //       },
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Text(
  //             "Current Address",
  //             style: TextStyle(
  //                 fontSize: 10,
  //                 fontWeight: FontWeight.w600,
  //                 color: tgPrimaryText),
  //           ),
  //           SizedBox(height: 2),
  //           Row(
  //             children: [
  //               Expanded(
  //                 child: Text(
  //                   data.locationName ?? "Loading...",
  //                   style: TextStyle(fontSize: 12),
  //                   overflow: TextOverflow.ellipsis,
  //                 ),
  //               ),
  //               Icon(Icons.refresh, size: 16),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ),
  //     // backgroundColor: tgDarkPrimaryColor,
  //     backgroundColor:Colors.grey[200],
  //     elevation: 50,
  //   );
  // }
  PreferredSizeWidget _buildAppBar(LiveUserLocation data) {
    var userdata = Provider.of<UserProvider>(context);
    return AppBar(
      actions: [
        IconButton(
          icon: Icon(Icons.favorite_border, color: Colors.grey),
          onPressed: () {
            navigatorPush(context, FavoritesPage());
          },
        ),
        IconButton(
          icon: Icon(Icons.star, color: Colors.amber),
          onPressed: () {
            navigatorPush(context, AllReviewsScreen());
          },
        ),
        IconButton(
          icon: Icon(Icons.refresh, color: Colors.grey),
          onPressed: () {
            // navigatorPush(context, AllReviewsScreen());
            data.getCurrentLocation();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Refreshing location...'),
                behavior: SnackBarBehavior.floating,
              ),
            );
          },
        ),
      ],
      leading: GestureDetector(
        onTap: () {
          navigatorPush(context, MyHomePage());
        },
        child: Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(color: Colors.white, width: 2),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  userdata.getUserData?.profile_image_url ?? defaultNetworkImage),
            ),
          ),
        ),
      ),
      title: GestureDetector(
        onTap: () {
          data.getCurrentLocation();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Refreshing location...'),
              behavior: SnackBarBehavior.floating,
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Current Address",
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 2),
            Row(
              children: [
                Expanded(
                  child: Text(
                    data.locationName ?? "Loading...",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                // Icon(Icons.refresh, size: 18, color: Colors.blue),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(15),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavBarItem(0, LineAwesomeIcons.home, "Home"),
              _buildNavBarItem(1, LineAwesomeIcons.search, "Search"),
              _buildNavBarItem(2, LineAwesomeIcons.accusoft, "Activity"),
              _buildNavBarItem(3, LineAwesomeIcons.user, "Profile"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavBarItem(int index, IconData icon, String label) {
    final isSelected = _currentIndex == index;
    return InkWell(
      onTap: () => setState(() => _currentIndex = index),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).primaryColor.withOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? tgDarkPrimaryColor : Colors.grey,
              size: 24,
            ),
            SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? tgDarkPrimaryColor : Colors.grey,
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
