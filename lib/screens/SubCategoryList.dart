//  prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors, avoid_print, must_be_immutable, body_might_complete_normally_nullable, unused_local_variable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sssv1/NewdefaultprofilePage/defaultpage&tabview.dart';
import 'package:sssv1/providers/live_user_location.dart';
import 'package:sssv1/providers/sub_category_list.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:sssv1/utils/constants.dart';
import 'package:sssv1/utils/navigator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class SubCategoryList extends StatefulWidget {
  String subCat;
  SubCategoryList({Key? key, required this.subCat}) : super(key: key);

  @override
  _SubCategoryListState createState() => _SubCategoryListState();
}

class _SubCategoryListState extends State<SubCategoryList> {
  // String? dist;
  // String? dura;

  @override
  void initState() {
    super.initState();
    var data = Provider.of<SubcategoryListProvider>(context, listen: false);
    data.subCategoryListProvider(widget.subCat);

    // var livLoc = Provider.of<LiveUserLocation>(context, listen: false);

    // if (livLoc.latitude == null) {
    //    livLoc.getCurrentLocation();
    // }
  }

  Future<Map<String, String>?> fetchDistance(
      String lat, String lang, String userLat, String userLang) async {
    try {
      Uri url = Uri.parse(
          "https://maps.googleapis.com/maps/api/directions/json?origin=$userLat,$userLang&destination=$lat,$lang&key=AIzaSyBIp8U5x3b2GVj1cjNU3N6funOz_tEUAdk");
      // print(url);
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        String dist = data['routes'][0]["legs"][0]["distance"]["text"];
        String dura = data['routes'][0]["legs"][0]["duration"]["text"];
        return {"distance": dist, "duration": dura};
      } else {
        return {"distance": "-", "duration": "-"};
      }
    } catch (e) {
      print(e);
      return {"distance": "-", "duration": "-"};
    }
  }

  void makePhoneCall(String phoneNumber) async {
    // final String url = 'tel:$number';
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      throw 'Could not launch $launchUri';
    }
  }

  @override
  Widget build(BuildContext context) {
    var livedata = Provider.of<LiveUserLocation>(context);
    // print("wid");
    // print(livedata.latitude);
    // print(livedata.longitude);
    String UserLat = livedata.latitude.toString();
    String UserLang = livedata.longitude.toString();
    var data = Provider.of<SubcategoryListProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(LineAwesomeIcons.angle_left)),
        title: Text(widget.subCat),
        // backgroundColor: Color.fromARGB(255, 78, 155, 151),
        backgroundColor: tgAccentColor,
      ),
      body: data.isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: tgDarkPrimaryColor,
              ),
            )
          : Material(
              child: ListView.builder(
                itemCount: data.subcategoryListData?.length,
                itemBuilder: (BuildContext context, int index) {
                  return FutureBuilder(
                    future: fetchDistance(
                        data.subcategoryListData![index].latitude,
                        data.subcategoryListData![index].longitude,
                        UserLat,
                        UserLang),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return ListSubCatogery(
                          context,
                          data,
                          index,
                          '...',
                        );
                        // Text("");
                        // CircularProgressIndicator();
                      }
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (snapshot.data == null) {
                        return Text('...');
                      } else {
                        final distance = (snapshot.data
                            as Map<String, String>?)?['distance'];
                        final duration = (snapshot.data
                            as Map<String, String>?)?['duration'];
                        return ListSubCatogery(
                          context,
                          data,
                          index,
                          distance ?? '...',
                        );
                      }
                    },
                  );
                },
              ),
            ),
    );
  }

  Column ListSubCatogery(BuildContext context, SubcategoryListProvider data,
      int index, String? distance) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 100,
          margin: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              Expanded(
                flex: 70,
                child: GestureDetector(
                  onTap: () {
                    Navigators().navigatorPush(
                        context,
                        //   DefaultProfile(
                        //       uid: data.subcategoryListData![index].businessUid),
                        DefaultProfilePage(
                          uid: data.subcategoryListData![index].businessUid,
                        ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      // color: tgLightPrimaryColor,
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 10),
                          blurRadius: 40,
                          spreadRadius: 0,
                          color: const Color.fromARGB(255, 35, 35, 37)
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
                            margin: const EdgeInsets.all(14),
                            // color: Colors.indigoAccent,
                            width: 75,
                            height: 75,
                            child: Image.network(
                              data.subcategoryListData![index].profileImage,
                              // snapshot.data![index]['image'],
                              // "https://plus.unsplash.com/premium_photo-1682800179834-c05e7c7d0a09?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80",

                              fit: BoxFit.fill,
                            )),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(top: 8, bottom: 8),
                            // color: Colors.red,
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                      data.subcategoryListData![index]
                                          .businessName,
                                      // style: TextStyle(color: Colors.white),
                                      // widget.data["name"],
                                      //  "Kritunga Restaurant",

                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: Text(
                                      // "5/f 18 on lane ST, central hong kong near hong",
                                      data.subcategoryListData![index]
                                          .businessDescription,

                                      style: TextStyle(
                                          fontSize: 11,
                                          color: Colors.grey,
                                          wordSpacing: 0.5,
                                          letterSpacing: -0.1),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  )
                                ]),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),

              /////// second half of the container ///////////////

              Expanded(
                flex: 30,
                child: GestureDetector(
                  onTap: () {
                    print("click");
                    makePhoneCall(
                        data.subcategoryListData![index].contactInformation);
                  },
                  child: SizedBox(
                    child: Stack(children: [
                      Container(
                        decoration: BoxDecoration(
                          color: tgAccentColor,
                          // color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, -22),
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
                      Positioned(
                        top: 8.0,
                        right: 11.0,
                        child: RatingBarIndicator(
                          rating: double.parse(data
                              .subcategoryListData![index].overallRating
                              .toString()),
                          itemBuilder: (context, index) => Icon(
                            Icons.star,
                            color: Colors.amber,
                            // color: tgDarkPrimaryColor,
                          ),
                          itemCount: 5,
                          itemSize: 11,
                          direction: Axis.horizontal,
                        ),
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Text(
                              // "4.5",
                              data.subcategoryListData![index].overallRating
                                  .toString(),
                              style: TextStyle(
                                  fontSize: 23, color: Colors.white))),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                                data.subcategoryListData![index].reviewsLength
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 11, color: Colors.grey))),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              // "33",
                              // distance.toString() == null
                              //     ? "..."
                              //     : distance.toString(),
                              distance.toString(),
                              style:
                                  TextStyle(fontSize: 11, color: Colors.white),
                            )),
                      ),
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
