// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sssv1/network_calling/http.dart';
import 'package:sssv1/providers/live_user_location.dart';
import 'package:sssv1/providers/sub_category_provider.dart';
import 'package:sssv1/providers/service_provider.dart';
import 'package:sssv1/providers/user_provider.dart';
import 'package:sssv1/widgets/restaurent.dart';
import 'package:sssv1/utils/constants.dart';
import 'package:sssv1/widgets/explore.dart';

import '../widgets/searchbar.dart';
import '../widgets/services.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  // List<RestaurantModels> _data = [];

  bool isFirstTime = true;

  @override
  void initState() {
    super.initState();
    // it will get the user location when latitude null
    var liveLoc = Provider.of<LiveUserLocation>(context, listen: false);
    if (liveLoc.latitude == null){
      // print("null");
      liveLoc.getCurrentLocation();
    }

    var userprov = Provider.of<UserProvider>(context, listen: false);
    if(userprov.getUserData== null){
      userprov.userProvider();
    }
    


  }

//   @override
//   void initState() {
//     // print('this is init in homepage');
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       // print("this is after init state ");
//       // var provider = Provider.of<serviceProvider>(context, listen: false);
//       // var searchlist = Provider.of<SearchlistProvider>(context, listen: false);
//       // auth.resProv;
//       // provider.serviceProv();
//       // searchlist.resProv();
//       // GetData().fetchUsersData();

// // ------------------------------
//     });

//     super.initState();
//   }

  // const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print("homepage called");
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // _getCurrentLocation();
    });
    final user = FirebaseAuth.instance.currentUser;
    final userid = user?.uid;
    // var userpro = Provider.of<UserProvider>(context, listen: false);
    // userpro.userProvider();
    if (kDebugMode) {
      print("userid $userid");
    }

    // print(user?.email);
    if (kDebugMode) {
      print(user?.email);
    }

    // var searchlist = Provider.of<SearchlistProvider>(context, listen: false);
    
    // userpro.userProv();

    return Scaffold(
      extendBody: true,
      // appBar: AppBar(
      //   //// this is to diable appbar arrowback functionality //
      //   // automaticallyImplyLeading: false,

      //   centerTitle: true,
      //   title: Padding(
      //     padding: EdgeInsets.symmetric(horizontal: 10),
      //     child: Image.asset(
      //       "images/logo4.png",
      //       width: 120,
      //       height: 110,
      //       color: Colors.black,
      //     ),
      //   ),

      //   // leading: Padding(
      //   //   padding: const EdgeInsets.only(left: 16.5),
      //   //   child: Builder(
      //   //       builder: (context) => InkWell(
      //   //             onTap: () {
      //   //               Scaffold.of(context).openDrawer();
      //   //             },
      //   //             child: CircleAvatar(
      //   //                 child: ClipOval(
      //   //               child: Image.asset(
      //   //                 'images/prof.png',
      //   //               ),
      //   //             )),
      //   //           )),
      //   // ),

      //   // actions: [
      //   //   Padding(
      //   //     padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
      //   //     child: CircleAvatar(
      //   //       radius: 28,
      //   //       child: ClipOval(
      //   //         child: Image.asset(
      //   //           "images/prof.png",
      //   //           fit: BoxFit.cover,
      //   //           width: 48,
      //   //           height: 48,
      //   //         ),
      //   //       ),
      //   //     ),
      //   //   ),
      //   // ],
      //   toolbarHeight: 75.0,
      //   // backgroundColor: Colors.white,
      //   // backgroundColor: tgPrimaryColor,
      //   backgroundColor: Color.fromARGB(255, 78, 155, 151),
      //   elevation: 3.0,
      //   // leading: IconButton(
      //   //   icon: const Icon(Icons.leak_remove, color: Colors.black, size: 35.0),
      //   //   onPressed: () {},
      //   // ),
      // ),
      body: Container(
        color: Colors.white,
        // color: Colors.teal[50],
        child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const ScrollPhysics(),
            children: [
              // SearchBar(),
              SizedBox(height: 15,),

              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(8, 0, 0, 5),
                    child: Text(
                      "Our top pick",
                      style: TextStyle(
                          fontFamily: "RobotoMono",
                          fontSize: 20,
                          color: Colors.grey),
                    ),
                  )),
              Services(),
              SizedBox(
                height: 10,
              ),
              // Restaurant Text
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(8, 0, 0, 5),
                    child: Text(
                      "Restaurant",
                      style: TextStyle(
                          fontFamily: "RobotoMono",
                          fontSize: 20,
                          color: Colors.grey),
                    ),
                  )),
              SizedBox(height: 10),
              Restaurant(),
              SizedBox(height: 20),

              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(8, 0, 0, 5),
                    child: Text(
                      "categories",
                      style: TextStyle(
                          fontFamily: "RobotoMono",
                          fontSize: 20,
                          color: Colors.grey),
                    ),
                  )),
              // Explore(),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: secondaryColor10LightTheme,
                  ),
                  margin: EdgeInsets.all(10),
                  child: Explore()),
            ]),
      ),
    );
  }
}
