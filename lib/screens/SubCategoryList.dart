// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sssv1/providers/sub_category_list.dart';
import 'package:sssv1/providers/sub_category_provider.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:sssv1/screens/realestateProfile.dart';
import 'package:sssv1/utils/constants.dart';
import 'package:sssv1/utils/navigator.dart';
import 'package:sssv1/widgets/test2.dart';

class SubCategoryList extends StatefulWidget {
  String subCat;
  SubCategoryList({Key? key, required this.subCat}) : super(key: key);

  @override
  _SubCategoryListState createState() => _SubCategoryListState();
}

class _SubCategoryListState extends State<SubCategoryList> {

  @override
  void initState() {
    super.initState();
    var data = Provider.of<SubcategoryListProvider>(context, listen: false);
    data.subCategoryListProvider(widget.subCat);
    // print("suncat");
    // print(widget.subCat);


  }


  @override
  Widget build(BuildContext context) {
    var data = Provider.of<SubcategoryListProvider>(context);
 
    return Scaffold(
      appBar: AppBar(title: Text(widget.subCat)),
      body: data.isLoading  ? Center(child: CircularProgressIndicator()) :
      Material(
              child: ListView.builder(
                itemCount: data.subcategoryListData?.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigators().navigatorPush(context, testing2(uid:data.subcategoryListData![index].businessUid ));
                    },
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 100,
                          margin: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 70,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    // color: Colors.blueAccent,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(0, 10),
                                        blurRadius: 40,
                                        spreadRadius: 0,
                                        color: Color.fromARGB(255, 35, 35, 37)
                                            .withOpacity(0.30),
                                        // color: tgPrimaryColor.withOpacity(0.30),
                                      ),
                                    ],
                                  ),
                                  // margin: EdgeInsets.all(10),
                                  // height: 100,
                                  // color: Color.fromRGBO(68, 138, 255, 1),
                                  child: Row(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.all(13),
                                          // color: Colors.indigoAccent,
                                          width: 80,
                                          height: 80,
                                          child: Image.network(
                                            // snapshot.data![index]['image'],
                                            "https://plus.unsplash.com/premium_photo-1682800179834-c05e7c7d0a09?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80",

                                            fit: BoxFit.fill,
                                          )),
                                      Expanded(
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            // mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  // height: 40,
                                                  margin: EdgeInsets.only(
                                                      left: 10, top: 20),
                                                  // height: 10,
                                                  // color: Color.fromRGBO(255, 152, 0, 1),
                                                  child: Text(
                                                    data.subcategoryListData![index].businessName,
                                                      // widget.data["name"],
                                                      //  "Kritunga Restaurant",
                                                      
                                                             
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                      left: 10, top: 3),
                                                  // color: Colors.pinkAccent,
                                                  child: Text(
                                                      "5/f 18 on lane ST, central hong kong",
                                                      // provider.data[int].address,maxLines: 2,
                                                      style: TextStyle(
                                                        color: Colors.grey,
                                                      )),
                                                ),
                                              )
                                            ]),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),

                              /////// 2nd half of the container ///////////////

                              Expanded(
                                flex: 30,
                                child: Stack(
                                  children: [
                                    Container(
                                    decoration: BoxDecoration(
                                      // color: Color(0xfffffafa),
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(0, -22),
                                          blurRadius: 40,
                                          spreadRadius: 0,
                                          // color:
                                          //     Color(0xFF0073FF).withOpacity(0.10),
                                          color: tgPrimaryColor.withOpacity(0.30),
                                        ),
                                      ],
                                    ),
                                    // margin: EdgeInsets.all(10),
                                    // height: 100,
                                    // color: Colors.greenAccent,
                                    
                                  ),
                                  
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text("4.5⭐",style: TextStyle(fontSize: 16))),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text("344",style: TextStyle( color: Colors.grey))),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Align(
                                      alignment: Alignment.bottomRight,
                                      child: Text("30Km away", style: TextStyle(fontSize: 10, color: Colors.grey),)),
                                    ),

                                    ]
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
    );
  }
}
