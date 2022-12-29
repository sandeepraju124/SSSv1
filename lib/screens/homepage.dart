import 'dart:convert';
import 'package:gap/gap.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sssv1/models/restaurant.dart';
import 'package:sssv1/network_calling/http.dart';
import 'package:sssv1/providers/restaurent_provider.dart';
import 'package:sssv1/providers/searchlist_provider.dart';
import 'package:sssv1/screens/profile.dart';
import '../widgets/searchbar.dart';
import '../widgets/services.dart';
import '../widgets/restaurent.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // List<RestaurantModels> _data = [];

  @override
  void initState() {
  // print('this is init');
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // print("this is after init state ");
      var provider = Provider.of<restaurentProvider>(context, listen: false);
      // var searchlist = Provider.of<SearchlistProvider>(context, listen: false);
      // auth.resProv;
      provider.resProv();
      // searchlist.resProv();
      
    });
    
    super.initState();
  }

  // const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var searchlist = Provider.of<SearchlistProvider>(context, listen: false);
    
    // print('building called');
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
            padding: const EdgeInsets.all(72.0),
            child: Image.asset(
              "images/logo4.png",
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
              child: CircleAvatar(
                radius: 28,
                child: ClipOval(
                  child: Image.asset(
                    "images/prof.png",
                    fit: BoxFit.cover,
                    width: 58,
                    height: 58,
                  ),
                ),
              ),
            ),
          ],
          toolbarHeight: 70.0,
          backgroundColor: Colors.white,
          elevation: 3.0,
          // leading: IconButton(
          //   icon: const Icon(Icons.leak_remove, color: Colors.black, size: 35.0),
          //   onPressed: () {},
          // ),
        ),
        body: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const ScrollPhysics(),
          children:  [
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
                  // provider.resProv();
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => profile(idpasses: "jhgsw")));
                },
                child: const Text('get data')),
            SizedBox(height: 400,
              child: ListView.builder(itemCount: provider.data.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext, int) => ListTile(title: Text(provider.data[int].name),)),
            )
    
          ]
        ),
      );
       },
      
    );
  }
}
