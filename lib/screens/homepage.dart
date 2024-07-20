// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sssv1/network_calling/http.dart';
import 'package:sssv1/restaurent_center.dart';
import 'package:sssv1/providers/live_user_location.dart';
import 'package:sssv1/providers/sub_category_provider.dart';
import 'package:sssv1/providers/BusinessCategoriesProvider.dart';
import 'package:sssv1/providers/user_provider.dart';
import 'package:sssv1/screens/testing.dart';
import 'package:sssv1/utils/navigator.dart';
import 'package:sssv1/widgets/restaurent.dart';
import 'package:sssv1/utils/constants.dart';
import 'package:sssv1/widgets/explore.dart';
import 'package:http/http.dart' as http;
import '../Services (top) of homepage section/ourtoppick.dart';
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
  // bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // it will get the user location when latitude null
    // var liveLoc = Provider.of<LiveUserLocation>(context, listen: false);
    // if (liveLoc.latitude == null) {
    //   print("called if in homepage init");
    //   // print("null");
    //   liveLoc.getCurrentLocation();
    // }

    var userprov = Provider.of<UserProvider>(context, listen: false);
    // print("init in homepage init");
    // print(userprov.getUserData);
    if (userprov.getUserData == null) {
      userprov.userProvider();
    }

    // loadData();

    // _isLoading = false;
  }

  // Future<void> loadData() async {
  //   try {
  //     // Simulate a network call
  //     await Future.delayed(Duration(seconds: 2));
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   } catch (e) {
  //     // Handle error here
  //     print("my lean cost $e");
  //   }
  // }

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
    // print("homepage called");
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // _getCurrentLocation();
    });
    final user = FirebaseAuth.instance.currentUser;
    final userid = user?.uid;
    // var userpro = Provider.of<UserProvider>(context, listen: false);
    // userpro.userProvider();
    // if (kDebugMode) {
    //   print("userid $userid");
    // }

    // // print(user?.email);
    // if (kDebugMode) {
    //   print(user?.email);
    // }

    // var searchlist = Provider.of<SearchlistProvider>(context, listen: false);

    // userpro.userProv();

    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      /////////////////// Appbar for homepage is in BottomNav /////////////////////////

      body:
          //  _isLoading
          //     ? Shimmer.fromColors(
          //         baseColor: Colors.grey[300]!,
          //         highlightColor: Colors.grey[100]!,
          //         child: Container(
          //           width: double.infinity,
          //           height: double.infinity,
          //           color: Colors.white,
          //         ),
          //       )
          //     :
          ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const ScrollPhysics(),
              children: [
            // SearchBar(),
            SizedBox(
              height: 15,
            ),

            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(8, 0, 0, 5),
                  child: Text(
                    "Our top picks",
                    style: TextStyle(
                        fontFamily: "RobotoMono",
                        fontSize: 17,
                        color: Colors.grey),
                  ),
                )),
            OurtoppickPage(),
            SizedBox(
              height: 10,
            ),
            // Restaurant Text
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(13, 0, 0, 5),
                  child: Text(
                    "Restaurants",
                    style: TextStyle(
                        fontFamily: "RobotoMono",
                        fontSize: 17,
                        color: Colors.grey),
                  ),
                )),
            // SizedBox(height: 10),
            // Restaurant(),
            SizedBox(height: 10),

            RestaurantTest(),
            SizedBox(height: 30),

            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(12, 0, 0, 5),
                  child: Text(
                    "Explore All ",
                    style: TextStyle(
                        fontFamily: "RobotoMono",
                        fontSize: 17,
                        color: Colors.grey),
                  ),
                )),

            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: secondaryColor10LightTheme,
                  // color: Colors.black54,
                ),
                margin: EdgeInsets.all(10),
                child: Explore()),
            // GestureDetector(
            //     onTap: (() {
            //       // Future<List<dynamic>> _getSuggestions(String query) async {
            //       //   // final response = await http.get(Uri.parse('your_search_api_url?query=$query'));
            //       //   final response = await http
            //       //       .get(Uri.parse('$baseUrl/pg/search?query=$query'));
            //       //   print(response.body);
            //       //   if (response.statusCode == 200) {
            //       //     return List<dynamic>.from(json.decode(response.body));
            //       //   } else {
            //       //     throw Exception('Failed to load suggestions');
            //       //   }
            //       // }
            //       // _getSuggestions("Tea");
            //       navigatorPush(context, BusinessSearchScreen());
            //       // Http().overall_rating("NEX1O16051534921137");
            //     }),
            //     child: Text("click"))
          ]),
    );
  }
}
