// // //  prefer_const_literals_to_create_immutables
// // // ignore_for_file: prefer_const_constructors, avoid_print, must_be_immutable, body_might_complete_normally_nullable, unused_local_variable

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'dart:convert';

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
  // ignore: library_private_types_in_public_api
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
        print("distance $dist, duration $dura");
        print("distance  duration");
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
    // ignore: prefer_const_declarations
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
      } else {
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
                        // print(displayData[index].businessUid);
                        // print(displayData[index].latitude.toString());
                        // print(displayData[index].longitude.toString());

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
                    // print(displayData[index].businessUid);
                    // print("business uid from subcategory list");
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
                        // Container(
                        //     margin: const EdgeInsets.all(14),
                        //     width: 75,
                        //     height: 75,
                        //     child: (displayData[index]
                        //                       .profileImageUrl !=
                        //                   null &&
                        //               displayData[index]
                        //                   .profileImageUrl.isNotEmpty)? Image.network(
                        //       displayData[index].profileImageUrl,
                        //       fit: BoxFit.fill,
                        //     ):Image.network(
                        //               'https://www.strasys.uk/wp-content/uploads/2022/02/Depositphotos_484354208_S.jpg',
                        //               height: 180,
                        //               width: double.infinity,
                        //               fit: BoxFit.cover,
                        //             ),
                        //     ),
                        Container(
                          margin: const EdgeInsets.all(8),
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: (displayData[index].profileImageUrl !=
                                          null &&
                                      displayData[index]
                                          .profileImageUrl
                                          .isNotEmpty)
                                  ? NetworkImage(
                                      displayData[index].profileImageUrl)
                                  : NetworkImage(
                                      'https://www.strasys.uk/wp-content/uploads/2022/02/Depositphotos_484354208_S.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
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
                    // print("click");
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
                          rating: double.parse(rating),
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
