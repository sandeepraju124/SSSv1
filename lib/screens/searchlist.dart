// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sssv1/screens/realestateProfile.dart';

class SearchList extends StatefulWidget {
  const SearchList({Key? key}) : super(key: key);

  @override
  _SearchListState createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  Future<List<dynamic>> getData() async {
    String url = 'https://von1.azurewebsites.net/services/realestate';
    http.Response response = await http.get(Uri.parse(url));
    List<dynamic> data = jsonDecode(response.body);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasData) {
            List<dynamic> data = snapshot.data!;
            return Material(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RealEstateProfile(
                              id: snapshot.data![index]['_id'])));
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
                                            snapshot.data![index]['image'],
                                            // "images/restaurant/restaurant2.jpg",

                                            fit: BoxFit.fill,
                                          )),
                                      Expanded(
                                        child: Container(
                                          // width: double.infinity,
                                          // color: Colors.tealAccent,
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
                                                        // widget.data["name"],
                                                        //  "Kritunga Restaurant",
                                                        snapshot.data![index]
                                                                ['name'] ??
                                                            'No name',
                                                        overflow: TextOverflow
                                                            .ellipsis,
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
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              // 2nd half of the container
                              Expanded(
                                flex: 30,
                                child: Container(
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
                                        color:
                                            Color(0xFF0073FF).withOpacity(0.10),
                                      ),
                                    ],
                                  ),
                                  // margin: EdgeInsets.all(10),
                                  // height: 100,
                                  // color: Colors.greenAccent,
                                  child: Column(children: [
                                    Expanded(
                                        flex: 65,
                                        child: Container(
                                          margin: EdgeInsets.only(top: 12),
                                          // color: Colors.grey,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text("3",
                                                  // provider.data[int].rating.toString(),
                                                  style:
                                                      TextStyle(fontSize: 20)),
                                              const SizedBox(
                                                width: 3,
                                              ),
                                              Text(
                                                "⭐",
                                                style: TextStyle(fontSize: 10),
                                              ),
                                              // Text("398",textAlign:TextAlign.start ,style: TextStyle(fontSize: 10),)
                                            ],
                                          ),
                                        )),
                                    Expanded(
                                      flex: 35,
                                      child: Container(
                                        child: Row(children: [
                                          Expanded(
                                            child: Container(
                                                margin:
                                                    EdgeInsets.only(left: 14),
                                                // color: Colors.redAccent,
                                                child: const Text(
                                                  "342",
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                )),
                                          ),
                                          Expanded(
                                            child: Container(
                                                // color: Colors.deepPurple,
                                                child: const Text(
                                              '30 KM Away',
                                              style: TextStyle(
                                                  fontSize: 8,
                                                  color: Colors.grey),
                                            )),
                                          )
                                        ]),
                                      ),
                                    )
                                  ]),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                  // ListTile(
                  //   title: Text(data[index]['name']),
                  //   subtitle: Text(data[index]['description']),
                  // );
                },
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
