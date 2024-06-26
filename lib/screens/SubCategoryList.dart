// // //  prefer_const_literals_to_create_immutables
// // // ignore_for_file: prefer_const_constructors, avoid_print, must_be_immutable, body_might_complete_normally_nullable, unused_local_variable

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sssv1/NewdefaultprofilePage/defaultpage&tabview.dart';
import 'package:sssv1/models/business_models.dart';
import 'package:sssv1/providers/live_user_location.dart';
import 'package:sssv1/providers/sub_category_list.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sssv1/providers/sub_category_provider.dart';

import 'package:sssv1/utils/constants.dart';
import 'package:sssv1/utils/navigator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class SubCategoryList extends StatefulWidget {
  final String keyy;
  final String value;
  final List<BusinessModel>? houseSearchResults;
  final bool isHouseSearch;

  SubCategoryList({
    Key? key,
    required this.keyy,
    required this.value,
    this.houseSearchResults,
    this.isHouseSearch = false,
  }) : super(key: key);

  @override
  _SubCategoryListState createState() => _SubCategoryListState();
}

class _SubCategoryListState extends State<SubCategoryList> {
  late double userLatitude;
  late double userLongitude;

  bool _showNearbyBusinesses = false;

  @override
  void initState() {
    super.initState();
    if (!widget.isHouseSearch) {
      var livedata = Provider.of<LiveUserLocation>(context, listen: false);
      userLatitude = livedata.latitude!;
      userLongitude = livedata.longitude!;
      print("userlat $userLatitude");
      print("userlong $userLongitude");
      var data = Provider.of<SubcategoryListProvider>(context, listen: false);
      data.subCategoryListProvider(widget.keyy, widget.value);
    }
  }

  Future<Map<String, String>> fetchDistance(
      String lat, String lang, String userLat, String userLang) async {
    try {
      Uri url = Uri.parse(
          "https://maps.googleapis.com/maps/api/directions/json?origin=$userLat,$userLang&destination=$lat,$lang&key=AIzaSyBIp8U5x3b2GVj1cjNU3N6funOz_tEUAdk");
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

  // void makePhoneCall(String phoneNumber) async {
  //   final Uri launchUri = Uri(
  //     scheme: 'tel',
  //     path: phoneNumber,
  //   );
  //   if (await canLaunchUrl(launchUri)) {
  //     await launchUrl(launchUri);
  //   } else {
  //     throw 'Could not launch $launchUri';
  //   }
  // }



  Future<void> fetchNearbyBusinesses(
      double userLat, double userLong, String key, String value) async {
    final String apiUrl =
        'https://supernova1137.azurewebsites.net/pg/business/latlong';

    final double distance = 20000; // Define your desired distance

    final Uri uri = Uri.parse(
        '$apiUrl?latitude=$userLat&longitude=$userLong&distance=$distance&key=$key&value=$value');

    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        final List<BusinessModel> businessList =
            data.map((item) => BusinessModel.fromJson(item)).toList();

        Provider.of<SubcategoryListProvider>(context, listen: false)
            .updateBusinessList(businessList);

        setState(() {
          _showNearbyBusinesses = true;
        });
      } else if (response.statusCode == 404) {
        // Handle error
        print('No businesses found within the specified distance');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('No businesses found within the specified distance'),
          ),
        );
      }
      else {
        print('Failed to fetch nearby businesses: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching nearby businesses: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    var livedata = Provider.of<LiveUserLocation>(context);
    userLatitude = livedata.latitude!;
    userLongitude = livedata.longitude!;
    var data = Provider.of<SubcategoryListProvider>(context);

    final displayData = widget.isHouseSearch
        ? widget.houseSearchResults
        : data.subcategoryListData;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            LineAwesomeIcons.angle_left,
            size: 19,
          ),
        ),
        title: Text(
          widget.value,
          style: TextStyle(fontSize: 16.2),
        ),
        backgroundColor: tgAccentColor,
        actions: [
          if (!widget.isHouseSearch) // Only show if not house search
            IconButton(
              icon: Padding(
                padding: const EdgeInsets.only(right: 10, top: 1),
                child: Column(
                  children: [
                    Icon(
                      Icons.location_on_sharp,
                      size: 20,
                    ),
                    Text(
                      "Near me",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              onPressed: () async {
                await fetchNearbyBusinesses(
                    userLatitude, userLongitude, widget.keyy, widget.value);
                setState(() {});
              },
            ),
        ],
      ),
      body: data.isLoading && !widget.isHouseSearch
          ? Center(
              child: CircularProgressIndicator(
                color: tgDarkPrimaryColor,
              ),
            )
          : Material(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.isHouseSearch
                          ? "Handpicked results based on your criteria"
                          : _showNearbyBusinesses
                              ? ' " Near your current location "'
                              : ' " All available businesses "',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: displayData!.length,
                      itemBuilder: (BuildContext context, int index) {
                        print(displayData[index].businessUid);
                        print(displayData[index].latitude.toString());
                        print(displayData[index].longitude.toString());

                        return FutureBuilder<Map<String, String>>(
                          future: fetchDistance(
                              displayData[index].latitude.toString(),
                              displayData[index].longitude.toString(),
                              userLatitude.toString(),
                              userLongitude.toString()),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return ListSubCategory(
                                  context, displayData, index, '...', data);
                            }
                            if (snapshot.hasError) {
                              return ListSubCategory(
                                  context, displayData, index, '...', data);
                            } else {
                              final distance =
                                  snapshot.data?['distance'] ?? '...';
                              return ListSubCategory(
                                  context, displayData, index, distance, data);
                            }
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Column ListSubCategory(BuildContext context, List<BusinessModel> displayData,
      int index, String? distance, SubcategoryListProvider data) {
    final businessRating = data.businessRating[displayData[index].businessUid];
    final rating = businessRating?['rating']?.toString() ?? '0';
    final reviewsCount = businessRating?['reviewsCount']?.toString() ?? '0';

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
                    print(displayData[index].businessUid);
                    print("business uid from subcategory list");
                    navigatorPush(
                        context,
                        DefaultProfilePage(
                          uid: displayData[index].businessUid,
                        ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 10),
                          blurRadius: 40,
                          spreadRadius: 0,
                          color: const Color.fromARGB(255, 35, 35, 37)
                              .withOpacity(0.30),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                            margin: const EdgeInsets.all(14),
                            width: 75,
                            height: 75,
                            child: Image.network(
                              displayData[index].profileImageUrl,
                              fit: BoxFit.fill,
                            )),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(top: 8, bottom: 8),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(displayData[index].businessName,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: Text(
                                      displayData[index].businessDescription,
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
              Expanded(
                flex: 30,
                child: GestureDetector(
                  onTap: () {
                    print("click");
                    print(displayData[index].contactInformation);
                    makePhoneCall(displayData[index].contactInformation);
                  },
                  child: SizedBox(
                    child: Stack(children: [
                      Container(
                        decoration: BoxDecoration(
                          color: tgAccentColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, -22),
                              blurRadius: 40,
                              spreadRadius: 0,
                              color: tgPrimaryColor.withOpacity(0.30),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 8.0,
                        right: 11.0,
                        child: RatingBarIndicator(
                          rating: 4.0,
                          itemBuilder: (context, index) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemCount: 5,
                          itemSize: 11,
                          direction: Axis.horizontal,
                        ),
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Text(rating,
                              style: TextStyle(
                                  fontSize: 23, color: Colors.white))),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(reviewsCount,
                                style: TextStyle(
                                    fontSize: 11, color: Colors.grey))),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              distance ?? '...',
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


// // class SubCategoryList extends StatefulWidget {
// //   String keyy;
// //   String value;
// //   SubCategoryList({Key? key, required this.keyy, required this.value}) : super(key: key);

// //   @override
// //   _SubCategoryListState createState() => _SubCategoryListState();
// // }

// // class _SubCategoryListState extends State<SubCategoryList> {
// //   // String? dist;
// //   // String? dura;

// //   @override
// //   void initState() {
// //     super.initState();
// //     // var data = Provider.of<businessProvider>(context, listen: false);
// //     // data.getBusinessProvider(widget.keyy, widget.value);
// //     var data = Provider.of<SubcategoryListProvider>(context, listen: false);
// //     data.subCategoryListProvider(widget.keyy, widget.value);

// //     // var livLoc = Provider.of<LiveUserLocation>(context, listen: false);

// //     // if (livLoc.latitude == null) {
// //     //    livLoc.getCurrentLocation();
// //     // }
// //   }

// //   Future<Map<String, String>?> fetchDistance(
// //       String lat, String lang, String userLat, String userLang) async {
// //     try {
// //       Uri url = Uri.parse(
// //           "https://maps.googleapis.com/maps/api/directions/json?origin=$userLat,$userLang&destination=$lat,$lang&key=AIzaSyBIp8U5x3b2GVj1cjNU3N6funOz_tEUAdk");
// //       // print(url);
// //       final response = await http.get(url);
// //       if (response.statusCode == 200) {
// //         final data = jsonDecode(response.body);
// //         String dist = data['routes'][0]["legs"][0]["distance"]["text"];
// //         String dura = data['routes'][0]["legs"][0]["duration"]["text"];
// //         return {"distance": dist, "duration": dura};
// //       } else {
// //         return {"distance": "-", "duration": "-"};
// //       }
// //     } catch (e) {
// //       print(e);
// //       return {"distance": "-", "duration": "-"};
// //     }
// //   }

// //   void makePhoneCall(String phoneNumber) async {
// //     // final String url = 'tel:$number';
// //     final Uri launchUri = Uri(
// //       scheme: 'tel',
// //       path: phoneNumber,
// //     );
// //     if (await canLaunchUrl(launchUri)) {
// //       await launchUrl(launchUri);
// //     } else {
// //       throw 'Could not launch $launchUri';
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     var livedata = Provider.of<LiveUserLocation>(context);
// //     // print("wid");
// //     // print(livedata.latitude);
// //     // print(livedata.longitude);
// //     String UserLat = livedata.latitude.toString();
// //     String UserLang = livedata.longitude.toString();
// //     // var data = Provider.of<businessProvider>(context);
// //     var data = Provider.of<SubcategoryListProvider>(context);

// // ignore_for_file: prefer_const_declarations, prefer_const_constructors, avoid_print

// //     return Scaffold(
// //       appBar: AppBar(
// //         leading: IconButton(
// //             onPressed: () {
// //               Navigator.of(context).pop();
// //             },
// //             icon: Icon(
// //               LineAwesomeIcons.angle_left,
// //               size: 19,
// //             )),
// //         title: Text(
// //           widget.value,
// //           style: TextStyle(fontSize: 16.2),
// //         ),
// //         // backgroundColor: Color.fromARGB(255, 78, 155, 151),
// //         backgroundColor: tgAccentColor,
// //       ),
// //       body: data.isLoading
// //           ? Center(
// //               child: CircularProgressIndicator(
// //                 color: tgDarkPrimaryColor,
// //               ),
// //             )
// //           : Material(
// //               child: ListView.builder(
// //                 itemCount: data.subcategoryListData!.length,
// //                 itemBuilder: (BuildContext context, int index) {
// //                   return FutureBuilder(
// //                     future: fetchDistance(
// //                         // data.subcategoryListData![index].latitude,
// //                         // data.subcategoryListData![index].longitude,
// //                         data.subcategoryListData![index].latitude.toString(),
// //                         data.subcategoryListData![index].longitude.toString(),
// //                         UserLat,
// //                         UserLang),
// //                     builder: (context, snapshot) {
// //                       if (snapshot.connectionState == ConnectionState.waiting) {
// //                         return ListSubCatogery(
// //                           context,
// //                           data,
// //                           index,
// //                           '...',
// //                         );
// //                         // Text("");
// //                         // CircularProgressIndicator();
// //                       }
// //                       if (snapshot.hasError) {
// //                         return Text('Error: ${snapshot.error}');
// //                       } else if (snapshot.data == null) {
// //                         return Text('...');
// //                       } else {
// //                         final distance = (snapshot.data
// //                             as Map<String, String>?)?['distance'];
// //                         final duration = (snapshot.data
// //                             as Map<String, String>?)?['duration'];
// //                         return ListSubCatogery(
// //                           context,
// //                           data,
// //                           index,
// //                           distance ?? '...',
// //                         );
// //                       }
// //                     },
// //                   );
// //                 },
// //               ),
// //             ),
// //     );
// //   }

// import 'dart:convert';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:sssv1/NewdefaultprofilePage/defaultpage&tabview.dart';
// import 'package:sssv1/models/business_models.dart';
// import 'package:sssv1/providers/live_user_location.dart';
// import 'package:sssv1/providers/sub_category_list.dart';
// import 'package:provider/provider.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:sssv1/providers/sub_category_provider.dart';

// import 'package:sssv1/utils/constants.dart';
// import 'package:sssv1/utils/navigator.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';

// // class SubCategoryList extends StatefulWidget {
// //   String keyy;
// //   String value;
// //   SubCategoryList({Key? key, required this.keyy, required this.value})
// //       : super(key: key);

// //   @override
// //   _SubCategoryListState createState() => _SubCategoryListState();
// // }

// class SubCategoryList extends StatefulWidget {
//   final String keyy;
//   final String value;
//   final List<BusinessModel>? houseSearchResults; // Add this line
//   final bool isHouseSearch; // Add this line

//   SubCategoryList(
//       {Key? key,
//       required this.keyy,
//       required this.value,
//       this.houseSearchResults,
//       this.isHouseSearch = false})
//       : super(key: key);

//   @override
//   _SubCategoryListState createState() => _SubCategoryListState();
// }

// class _SubCategoryListState extends State<SubCategoryList> {
//   late double userLatitude;
//   late double userLongitude;

//   bool _showNearbyBusinesses = false;

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   var livedata = Provider.of<LiveUserLocation>(context, listen: false);
//   //   userLatitude = livedata.latitude!;
//   //   userLongitude = livedata.longitude!;
//   //   var data = Provider.of<SubcategoryListProvider>(context, listen: false);
//   //   data.subCategoryListProvider(widget.keyy, widget.value);
//   // }
//   @override
//   void initState() {
//     super.initState();
//     if (!widget.isHouseSearch) {
//       var livedata = Provider.of<LiveUserLocation>(context, listen: false);
//       userLatitude = livedata.latitude!;
//       userLongitude = livedata.longitude!;
//       var data = Provider.of<SubcategoryListProvider>(context, listen: false);
//       data.subCategoryListProvider(widget.keyy, widget.value);
//     }
//   }

//   // Future<Map<String, String>?> fetchDistance(
//   //     String lat, String lang, String userLat, String userLang) async {
//   //   try {
//   //     Uri url = Uri.parse(
//   //         "https://maps.googleapis.com/maps/api/directions/json?origin=$userLat,$userLang&destination=$lat,$lang&key=AIzaSyBIp8U5x3b2GVj1cjNU3N6funOz_tEUAdk");
//   //     final response = await http.get(url);
//   //     if (response.statusCode == 200) {
//   //       final data = jsonDecode(response.body);
//   //       String dist = data['routes'][0]["legs"][0]["distance"]["text"];
//   //       String dura = data['routes'][0]["legs"][0]["duration"]["text"];
//   //       return {"distance": dist, "duration": dura};
//   //     } else {
//   //       return {"distance": "-", "duration": "-"};
//   //     }
//   //   } catch (e) {
//   //     print(e);
//   //     return {"distance": "-", "duration": "-"};
//   //   }
//   // }

//   Future<Map<String, String>> fetchDistance(
//       String lat, String lang, String userLat, String userLang) async {
//     try {
//       Uri url = Uri.parse(
//           "https://maps.googleapis.com/maps/api/directions/json?origin=$userLat,$userLang&destination=$lat,$lang&key=AIzaSyBIp8U5x3b2GVj1cjNU3N6funOz_tEUAdk");
//       final response = await http.get(url);
//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         String dist = data['routes'][0]["legs"][0]["distance"]["text"];
//         String dura = data['routes'][0]["legs"][0]["duration"]["text"];
//         return {"distance": dist, "duration": dura};
//       } else {
//         return {"distance": "-", "duration": "-"};
//       }
//     } catch (e) {
//       print(e);
//       return {"distance": "-", "duration": "-"};
//     }
//   }

// // Inside _SubCategoryListState
//   Future<void> fetchNearbyBusinesses(
//       double userLat, double userLong, String key, String value) async {
//     final String apiUrl =
//         'https://supernova1137.azurewebsites.net/pg/business/latlong';

//     final double distance = 20000; // Define your desired distance

//     final Uri uri = Uri.parse(
//         '$apiUrl?latitude=$userLat&longitude=$userLong&distance=$distance&key=$key&value=$value');

//     try {
//       final response = await http.get(uri);
//       if (response.statusCode == 200) {
//         // Parse the response
//         final List<dynamic> data = jsonDecode(response.body);
//         // print('Response: $data');

//         // Convert the list of dynamic objects to a list of BusinessModel objects
//         final List<BusinessModel> businessList =
//             data.map((item) => BusinessModel.fromJson(item)).toList();

//         // Update your UI with the fetched data
//         Provider.of<SubcategoryListProvider>(context, listen: false)
//             .updateBusinessList(businessList);

//         // Set the flag to true when the "Near Me" button is pressed
//         setState(() {
//           _showNearbyBusinesses = true;
//         });
//         // notifyListeners(); // Notify listeners to rebuild the UI
//       } else {
//         // Handle error
//         print('Failed to fetch nearby businesses: ${response.statusCode}');
//       }
//     } catch (e) {
//       // Handle error
//       print('Error fetching nearby businesses: $e');
//     }
//   }

// //   @override
// //   Widget build(BuildContext context) {
// //     var livedata = Provider.of<LiveUserLocation>(context);
// //     userLatitude = livedata.latitude!;
// //     userLongitude = livedata.longitude!;
// //     var data = Provider.of<SubcategoryListProvider>(context);

// //     return Scaffold(
// //       appBar: AppBar(
// //         leading: IconButton(
// //           onPressed: () {
// //             Navigator.of(context).pop();
// //           },
// //           icon: Icon(
// //             LineAwesomeIcons.angle_left,
// //             size: 19,
// //           ),
// //         ),
// //         title: Text(
// //           widget.value,
// //           style: TextStyle(fontSize: 16.2),
// //         ),
// //         backgroundColor: tgAccentColor,
// //         actions: [
// //           IconButton(
// //             icon: Padding(
// //               padding: const EdgeInsets.only(right: 10, top: 1),
// //               child: Column(
// //                 // ignore: prefer_const_literals_to_create_immutables
// //                 children: [
// //                   Icon(
// //                     Icons.location_on_sharp,
// //                     size: 20,
// //                   ),
// //                   Text(
// //                     "Near me",
// //                     style: TextStyle(
// //                       fontSize: 12,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             onPressed: () async {
// //               // print("pressed");
// //               // print(userLatitude);
// //               // print(userLongitude);

// //               // Call the method to fetch nearby businesses
// //               await fetchNearbyBusinesses(
// //                   userLatitude, userLongitude, widget.keyy, widget.value);

// //               // await Provider.of<SubcategoryListProvider>(context, listen: false)
// //               //     .fetchNearbyBusinesses(
// //               //         userLatitude, userLongitude, widget.keyy, widget.value);

// //               setState(() {});
// //             },
// //           ),
// //         ],
// //       ),
// //       body: data.isLoading
// //           ? Center(
// //               child: CircularProgressIndicator(
// //                 color: tgDarkPrimaryColor,
// //               ),
// //             )
// //           : Material(
// //               child: Column(
// //                 children: [
// //                   Padding(
// //                     padding: const EdgeInsets.all(8.0),
// //                     child: Text(
// //                       _showNearbyBusinesses
// //                           ? ' " Near your current location "'
// //                           : ' " All available businesses "',
// //                       style: TextStyle(
// //                         fontSize: 12,
// //                         fontWeight: FontWeight.w300,
// //                       ),
// //                     ),
// //                   ),
// //                   Expanded(
// //                     child: ListView.builder(
// //                       itemCount: data.subcategoryListData!.length,
// //                       itemBuilder: (BuildContext context, int index) {
// //                         return FutureBuilder(
// //                           future: fetchDistance(
// //                               data.subcategoryListData![index].latitude
// //                                   .toString(),
// //                               data.subcategoryListData![index].longitude
// //                                   .toString(),
// //                               userLatitude.toString(),
// //                               userLongitude.toString()),
// //                           builder: (context, snapshot) {
// //                             if (snapshot.connectionState ==
// //                                 ConnectionState.waiting) {
// //                               return ListSubCategory(
// //                                 context,
// //                                 data,
// //                                 index,
// //                                 '...',
// //                               );
// //                             }
// //                             if (snapshot.hasError) {
// //                               return Text('Error: ${snapshot.error}');
// //                             } else if (snapshot.data == null) {
// //                               return Text('...');
// //                             } else {
// //                               final distance = (snapshot.data
// //                                   as Map<String, String>?)?['distance'];
// //                               return ListSubCategory(
// //                                 context,
// //                                 data,
// //                                 index,
// //                                 distance ?? '...',
// //                               );
// //                             }
// //                           },
// //                         );
// //                       },
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //     );
// //   }

// //   Column ListSubCategory(BuildContext context, SubcategoryListProvider data,
// //       int index, String? distance) {
// //     return Column(
// //       children: [
// //         const SizedBox(
// //           height: 10,
// //         ),
// //         Container(
// //           height: 100,
// //           margin: const EdgeInsets.symmetric(horizontal: 12),
// //           child: Row(
// //             children: [
// //               Expanded(
// //                 flex: 70,
// //                 child: GestureDetector(
// //                   onTap: () {
// //                     print(
// //                       data.subcategoryListData![index].businessUid,
// //                     );
// //                     print("business uid from subcategory list");
// //                     navigatorPush(
// //                         context,
// //                         //   DefaultProfile(
// //                         //       uid: data.subcategoryListData![index].businessUid),
// //                         DefaultProfilePage(
// //                           // uid: data.subcategoryListData![index].businessUid,
// //                           uid: data.subcategoryListData![index].businessUid,
// //                         ));
// //                   },
// //                   child: Container(
// //                     decoration: BoxDecoration(
// //                       color: Colors.white,
// //                       // color: tgLightPrimaryColor,
// //                       borderRadius: const BorderRadius.all(Radius.circular(12)),
// //                       boxShadow: [
// //                         BoxShadow(
// //                           offset: const Offset(0, 10),
// //                           blurRadius: 40,
// //                           spreadRadius: 0,
// //                           color: const Color.fromARGB(255, 35, 35, 37)
// //                               .withOpacity(0.30),
// //                           // color: tgPrimaryColor.withOpacity(0.30),
// //                         ),
// //                       ],
// //                     ),
// //                     // margin: EdgeInsets.all(10),
// //                     // height: 100,
// //                     // color: Color.fromRGBO(68, 138, 255, 1),
// //                     child: Row(
// //                       children: [
// //                         Container(
// //                             margin: const EdgeInsets.all(14),
// //                             // color: Colors.indigoAccent,
// //                             width: 75,
// //                             height: 75,
// //                             child: Image.network(
// //                               // data.subcategoryListData![index].profileImage,
// //                               data.subcategoryListData![index].profileImageUrl,
// //                               // snapshot.data![index]['image'],
// //                               // "https://plus.unsplash.com/premium_photo-1682800179834-c05e7c7d0a09?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80",

// //                               fit: BoxFit.fill,
// //                             )),
// //                         Expanded(
// //                           child: Container(
// //                             margin: const EdgeInsets.only(top: 8, bottom: 8),
// //                             // color: Colors.red,
// //                             child: Column(
// //                                 mainAxisAlignment:
// //                                     MainAxisAlignment.spaceEvenly,
// //                                 crossAxisAlignment: CrossAxisAlignment.start,
// //                                 // mainAxisAlignment: MainAxisAlignment.start,
// //                                 children: [
// //                                   Text(
// //                                       // data.subcategoryListData![index].businessName,
// //                                       data.subcategoryListData![index]
// //                                           .businessName,
// //                                       // style: TextStyle(color: Colors.white),
// //                                       // widget.data["name"],
// //                                       //  "Kritunga Restaurant",

// //                                       overflow: TextOverflow.ellipsis,
// //                                       maxLines: 1),
// //                                   Padding(
// //                                     padding: const EdgeInsets.only(right: 5),
// //                                     child: Text(
// //                                       // "5/f 18 on lane ST, central hong kong near hong",
// //                                       // data.subcategoryListData![index].businessDescription,
// //                                       data.subcategoryListData![index]
// //                                           .businessDescription,

// //                                       style: TextStyle(
// //                                           fontSize: 11,
// //                                           color: Colors.grey,
// //                                           wordSpacing: 0.5,
// //                                           letterSpacing: -0.1),
// //                                       overflow: TextOverflow.ellipsis,
// //                                       maxLines: 2,
// //                                     ),
// //                                   )
// //                                 ]),
// //                           ),
// //                         )
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //               const SizedBox(
// //                 width: 10,
// //               ),

// //               /////// second half of the container ///////////////

// //               Expanded(
// //                 flex: 30,
// //                 child: GestureDetector(
// //                   onTap: () {
// //                     print("click");
// //                     makePhoneCall(
// //                         // data.subcategoryListData![index].contactInformation);
// //                         data.subcategoryListData![index].contactInformation);
// //                   },
// //                   child: SizedBox(
// //                     child: Stack(children: [
// //                       Container(
// //                         decoration: BoxDecoration(
// //                           color: tgAccentColor,
// //                           // color: Colors.white,
// //                           borderRadius:
// //                               const BorderRadius.all(Radius.circular(12)),
// //                           boxShadow: [
// //                             BoxShadow(
// //                               offset: const Offset(0, -22),
// //                               blurRadius: 40,
// //                               spreadRadius: 0,
// //                               // color:
// //                               //     Color(0xFF0073FF).withOpacity(0.10),
// //                               color: tgPrimaryColor.withOpacity(0.30),
// //                             ),
// //                           ],
// //                         ),
// //                         // margin: EdgeInsets.all(10),
// //                         // height: 100,
// //                         // color: Colors.greenAccent,
// //                       ),
// //                       Positioned(
// //                         top: 8.0,
// //                         right: 11.0,
// //                         child: RatingBarIndicator(
// //                           rating: 4.0,
// //                           // double.parse(data.subcategoryListData![index].overallRating.toString()),
// //                           itemBuilder: (context, index) => Icon(
// //                             Icons.star,
// //                             color: Colors.amber,
// //                             // color: tgDarkPrimaryColor,
// //                           ),
// //                           itemCount: 5,
// //                           itemSize: 11,
// //                           direction: Axis.horizontal,
// //                         ),
// //                       ),
// //                       Align(
// //                           alignment: Alignment.center,
// //                           child: Text(
// //                               data.businessRating[data
// //                                       .subcategoryListData![index]
// //                                       .businessUid]!['rating']
// //                                   .toString(),
// //                               // "4.5",
// //                               // data.subcategoryListData![index].overallRating
// //                               //     .toString(),
// //                               style: TextStyle(
// //                                   fontSize: 23, color: Colors.white))),
// //                       Padding(
// //                         padding: EdgeInsets.all(10.0),
// //                         child: Align(
// //                             alignment: Alignment.bottomLeft,
// //                             child: Text(
// //                                 data.businessRating[data
// //                                         .subcategoryListData![index]
// //                                         .businessUid]!['reviewsCount']
// //                                     .toString(),
// //                                 // "453",
// //                                 // data.subcategoryListData![index].reviewsLength
// //                                 //     .toString(),
// //                                 style: TextStyle(
// //                                     fontSize: 11, color: Colors.grey))),
// //                       ),
// //                       Padding(
// //                         padding: EdgeInsets.all(10.0),
// //                         child: Align(
// //                             alignment: Alignment.bottomRight,
// //                             child: Text(
// //                               // "33",
// //                               // distance.toString() == null
// //                               //     ? "..."
// //                               //     : distance.toString(),
// //                               distance.toString(),
// //                               style:
// //                                   TextStyle(fontSize: 11, color: Colors.white),
// //                             )),
// //                       ),
// //                     ]),
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }

//   @override
//   Widget build(BuildContext context) {
//     var livedata = Provider.of<LiveUserLocation>(context);
//     userLatitude = livedata.latitude!;
//     userLongitude = livedata.longitude!;
//     var data = Provider.of<SubcategoryListProvider>(context);

//     final displayData = widget.isHouseSearch
//         ? widget.houseSearchResults
//         : data.subcategoryListData;

//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//           icon: Icon(
//             LineAwesomeIcons.angle_left,
//             size: 19,
//           ),
//         ),
//         title: Text(
//           widget.value,
//           style: TextStyle(fontSize: 16.2),
//         ),
//         backgroundColor: tgAccentColor,
//         actions: [
//           if (!widget.isHouseSearch) // Only show if not house search
//             IconButton(
//               icon: Padding(
//                 padding: const EdgeInsets.only(right: 10, top: 1),
//                 child: Column(
//                   children: [
//                     Icon(
//                       Icons.location_on_sharp,
//                       size: 20,
//                     ),
//                     Text(
//                       "Near me",
//                       style: TextStyle(
//                         fontSize: 12,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               onPressed: () async {
//                 await fetchNearbyBusinesses(
//                     userLatitude, userLongitude, widget.keyy, widget.value);
//                 setState(() {});
//               },
//             ),
//         ],
//       ),
//       body: data.isLoading && !widget.isHouseSearch
//           ? Center(
//               child: CircularProgressIndicator(
//                 color: tgDarkPrimaryColor,
//               ),
//             )
//           : Material(
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       _showNearbyBusinesses
//                           ? ' " Near your current location "'
//                           : ' " All available businesses "',
//                       style: TextStyle(
//                         fontSize: 12,
//                         fontWeight: FontWeight.w300,
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: ListView.builder(
//                       itemCount: displayData!.length,
//                       itemBuilder: (BuildContext context, int index) {
//                         return FutureBuilder<Map<String, String>>(
//                           future: fetchDistance(
//                               displayData[index].latitude.toString(),
//                               displayData[index].longitude.toString(),
//                               userLatitude.toString(),
//                               userLongitude.toString()),
//                           builder: (context, snapshot) {
//                             if (snapshot.connectionState ==
//                                 ConnectionState.waiting) {
//                               return ListSubCategory(
//                                   context, displayData, index, '...', data);
//                             }
//                             if (snapshot.hasError) {
//                               return ListSubCategory(
//                                   context, displayData, index, '...', data);
//                             } else {
//                               final distance =
//                                   snapshot.data?['distance'] ?? '...';
//                               return ListSubCategory(
//                                   context, displayData, index, distance, data);
//                             }
//                           },
//                         );
//                       },
//                     ),
//                   ),

//                   // Expanded(
//                   //   child: ListView.builder(
//                   //     itemCount: displayData!.length,
//                   //     itemBuilder: (BuildContext context, int index) {
//                   //       return FutureBuilder(
//                   //         future: fetchDistance(
//                   //             displayData[index].latitude.toString(),
//                   //             displayData[index].longitude.toString(),
//                   //             userLatitude.toString(),
//                   //             userLongitude.toString()),
//                   //         builder: (context, snapshot) {
//                   //           if (snapshot.connectionState ==
//                   //               ConnectionState.waiting) {
//                   //             return ListSubCategory(
//                   //                 context, displayData, index, '...', data);
//                   //           }
//                   //           if (snapshot.hasError) {
//                   //             return Text('Error: ${snapshot.error}');
//                   //           } else if (snapshot.data == null) {
//                   //             return Text('...');
//                   //           } else {
//                   //             final distance = (snapshot.data
//                   //                 as Map<String, String>?)?['distance'];
//                   //             return ListSubCategory(context, displayData,
//                   //                 index, distance ?? '...', data);
//                   //           }
//                   //         },
//                   //       );
//                   //     },
//                   //   ),
//                   // ),
//                 ],
//               ),
//             ),
//     );
//   }

//   Column ListSubCategory(BuildContext context, List<BusinessModel> displayData,
//       int index, String? distance, SubcategoryListProvider data) {
//     final businessRating = data.businessRating[displayData[index].businessUid];
//     final rating = businessRating?['rating']?.toString() ?? '0';
//     final reviewsCount = businessRating?['reviewsCount']?.toString() ?? '0';

//     return Column(
//       children: [
//         const SizedBox(
//           height: 10,
//         ),
//         Container(
//           height: 100,
//           margin: const EdgeInsets.symmetric(horizontal: 12),
//           child: Row(
//             children: [
//               Expanded(
//                 flex: 70,
//                 child: GestureDetector(
//                   onTap: () {
//                     print(displayData[index].businessUid);
//                     print("business uid from subcategory list");
//                     navigatorPush(
//                         context,
//                         DefaultProfilePage(
//                           uid: displayData[index].businessUid,
//                         ));
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: const BorderRadius.all(Radius.circular(12)),
//                       boxShadow: [
//                         BoxShadow(
//                           offset: const Offset(0, 10),
//                           blurRadius: 40,
//                           spreadRadius: 0,
//                           color: const Color.fromARGB(255, 35, 35, 37)
//                               .withOpacity(0.30),
//                         ),
//                       ],
//                     ),
//                     child: Row(
//                       children: [
//                         Container(
//                             margin: const EdgeInsets.all(14),
//                             width: 75,
//                             height: 75,
//                             child: Image.network(
//                               displayData[index].profileImageUrl,
//                               fit: BoxFit.fill,
//                             )),
//                         Expanded(
//                           child: Container(
//                             margin: const EdgeInsets.only(top: 8, bottom: 8),
//                             child: Column(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceEvenly,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(displayData[index].businessName,
//                                       overflow: TextOverflow.ellipsis,
//                                       maxLines: 1),
//                                   Padding(
//                                     padding: const EdgeInsets.only(right: 5),
//                                     child: Text(
//                                       displayData[index].businessDescription,
//                                       style: TextStyle(
//                                           fontSize: 11,
//                                           color: Colors.grey,
//                                           wordSpacing: 0.5,
//                                           letterSpacing: -0.1),
//                                       overflow: TextOverflow.ellipsis,
//                                       maxLines: 2,
//                                     ),
//                                   )
//                                 ]),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 width: 10,
//               ),
//               Expanded(
//                 flex: 30,
//                 child: GestureDetector(
//                   onTap: () {
//                     print("click");
//                     makePhoneCall(displayData[index].contactInformation);
//                   },
//                   child: SizedBox(
//                     child: Stack(children: [
//                       Container(
//                         decoration: BoxDecoration(
//                           color: tgAccentColor,
//                           borderRadius:
//                               const BorderRadius.all(Radius.circular(12)),
//                           boxShadow: [
//                             BoxShadow(
//                               offset: const Offset(0, -22),
//                               blurRadius: 40,
//                               spreadRadius: 0,
//                               color: tgPrimaryColor.withOpacity(0.30),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Positioned(
//                         top: 8.0,
//                         right: 11.0,
//                         child: RatingBarIndicator(
//                           rating: 4.0,
//                           itemBuilder: (context, index) => Icon(
//                             Icons.star,
//                             color: Colors.amber,
//                           ),
//                           itemCount: 5,
//                           itemSize: 11,
//                           direction: Axis.horizontal,
//                         ),
//                       ),
//                       Align(
//                           alignment: Alignment.center,
//                           child: Text(rating,
//                               style: TextStyle(
//                                   fontSize: 23, color: Colors.white))),
//                       Padding(
//                         padding: EdgeInsets.all(10.0),
//                         child: Align(
//                             alignment: Alignment.bottomLeft,
//                             child: Text(reviewsCount,
//                                 style: TextStyle(
//                                     fontSize: 11, color: Colors.grey))),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.all(10.0),
//                         child: Align(
//                             alignment: Alignment.bottomRight,
//                             child: Text(
//                               distance ?? '...',
//                               style:
//                                   TextStyle(fontSize: 11, color: Colors.white),
//                             )),
//                       ),
//                     ]),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
