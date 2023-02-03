
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:sssv1/login/google_login_controller.dart';
import 'package:sssv1/providers/restaurent_provider.dart';
import 'package:sssv1/providers/searchlist_provider.dart';
import 'package:sssv1/screens/header_drawer.dart';
import 'package:sssv1/screens/mydrawerlist.dart';
import '../widgets/searchbar.dart';
import '../widgets/services.dart';
import '../widgets/restaurent.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../network_calling/http.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // List<RestaurantModels> _data = [];



  @override
  void initState() {
    print('this is init');
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // print("this is after init state ");
      var provider = Provider.of<restaurentProvider>(context, listen: false);
      // var searchlist = Provider.of<SearchlistProvider>(context, listen: false);
      // auth.resProv;
      provider.resProv();
      // searchlist.resProv();

// ------------------------------

final user = FirebaseAuth.instance.currentUser;
  final userid = user?.uid;
  print(userid);

    });

    super.initState();
  }

  // const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var searchlist = Provider.of<SearchlistProvider>(context, listen: false);

    print('building called');
    // List<RestaurantModels> data =await getData().getRestaurantData();

    return Consumer<restaurentProvider>(
      builder: (BuildContext context, provider, Widget? child) {
        // print('build calling after build');

        // List<RestaurantModels> data =await getData().getRestaurantData();
        // provider.resProv(_data);

        return Scaffold(
          // backgroundColor: Color(0xffCAD3D3),
          // backgroundColor: const Color(0xff49426C),
          appBar: AppBar(
            centerTitle: true,
            title: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Image.asset(
                "images/logo4.png",
                width: 120,
                height: 110,
              ),
            ),

            leading: Padding(
              padding: const EdgeInsets.only(left: 16.5),
              child: Builder(
                  builder: (context) => InkWell(
                        onTap: () {
                          Scaffold.of(context).openDrawer();
                        },
                        child: CircleAvatar(
                            child: ClipOval(
                          child: Image.asset(
                            'images/prof.png',
                          ),
                        )),
                      )),
            ),

            // actions: [
            //   Padding(
            //     padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
            //     child: CircleAvatar(
            //       radius: 28,
            //       child: ClipOval(
            //         child: Image.asset(
            //           "images/prof.png",
            //           fit: BoxFit.cover,
            //           width: 48,
            //           height: 48,
            //         ),
            //       ),
            //     ),
            //   ),
            // ],
            toolbarHeight: 75.0,
            backgroundColor: Colors.white,
            elevation: 3.0,
            // leading: IconButton(
            //   icon: const Icon(Icons.leak_remove, color: Colors.black, size: 35.0),
            //   onPressed: () {},
            // ),
          ),

          drawer: Drawer(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    MyHeaderDrawer(),
                    MyDrawerList(),
                  ],
                ),
              ),
            ),
          ),

          body: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const ScrollPhysics(),
              children: [
                const SearchBar(),
                const Gap(15),
                const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(8, 0, 0, 5),
                      child: Text(
                        "Our Top Pick",
                        style: TextStyle(
                            fontFamily: "RobotoMono",
                            fontSize: 27,
                            color: Colors.black87),
                      ),
                    )),
                const Services(),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(8, 0, 0, 5),
                      child: Text(
                        "restaurant",
                        style: TextStyle(
                            fontFamily: "RobotoMono",
                            fontSize: 27,
                            color: Colors.black87),
                      ),
                    )),
                restaurant(),
                const Gap(10),
                TextButton(
                    onPressed: () async {
                      // GetData().getUserData(1);
                      // GetData().getRestaurantCommentsData("tatva");
                      // provider.resProv();
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => profile(idpasses: "jhgsw")));
                    },
                    child: const Text('get data')),
                TextButton(
                    onPressed: () {
                      final provider = Provider.of<GoogleSignInController>(
                          context,
                          listen: false);
                      provider.logOut();
                    },
                    child: const Text('sign out')),
                SizedBox(
                  height: 400,
                  child: ListView.builder(
                      itemCount: provider.data.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext, int) => ListTile(
                            title: Text(provider.data[int].name),
                          )),
                )
              ]),
        );
      },
    );
  }
}
