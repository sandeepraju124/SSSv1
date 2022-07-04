import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sssv1/models/restaurant.dart';
import 'package:sssv1/providers/restaurent_provider.dart';
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

  // @override
  // void initState() {
  //
  //   final data = Provider.of<restaurentProvider>(context,listen: false);
  //   data.fetchData(context);
  //   print(data);
  //   super.initState();
  // }
  // const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<restaurentProvider>(context,listen: false);

    return Scaffold(
      backgroundColor: Color(0xffCAD3D3),
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children:  [
          searchbar(),
          SizedBox(
            height: 15,
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.fromLTRB(8, 0, 0, 5),
                child: Text(
                  "Services",
                  style: TextStyle(
                      fontFamily: "RobotoMono",
                      fontSize: 27,
                      color: Colors.black87),
                ),
              )),
          Services(),
          SizedBox(
            height: 10,
          ),
          Align(
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
          SizedBox(
            height: 10,
          ),
          TextButton(
              onPressed: () {
                data.fetchData(context);
                print('Pressed');
              },
              child: Text('get data')),
          // Text(data.dataModel);

        ]),
      ),
    );
  }
}


Future<DataModel?> getData(context)async{
  // late DataModel dataModel;
  DataModel? dataModel;
  try{
    var dio = Dio();
    final response = await dio.get("https://jsonplaceholder.typicode.com/posts");
    print(response.data);
    if(response.statusCode == 200){
      final data = json.decode(response.data);
      dataModel = DataModel.fromJson(data);
    }
  }catch(e){
    print(e.toString());
  }

  return dataModel;
}

