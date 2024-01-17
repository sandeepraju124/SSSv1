// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sssv1/NewdefaultprofilePage/defaultpage&tabview.dart';
import 'package:sssv1/network_calling/http.dart';

import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:sssv1/providers/live_user_location.dart';
import 'package:sssv1/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';

import 'package:provider/provider.dart';

import 'package:lottie/lottie.dart';
import "package:flutter_rating_bar/flutter_rating_bar.dart";

class SearchBarPage extends StatefulWidget {
  const SearchBarPage({super.key});

  @override
  State<SearchBarPage> createState() => _SearchBarPageState();
}

class _SearchBarPageState extends State<SearchBarPage> {
  bool isSearchExpanded = false;
  String query = '';
  Http customhttp = Http();

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
      // print(e);
      return {"distance": "-", "duration": "-"};
    }
  }

  @override
  Widget build(BuildContext context) {
    var livedata = Provider.of<LiveUserLocation>(context);
    String userLat = livedata.latitude.toString();
    String userLang = livedata.longitude.toString();

    return Scaffold(
      backgroundColor: secondaryColor5LightTheme,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // This line hides the back button

        // backgroundColor: Color.fromARGB(255, 78, 155, 151),
        backgroundColor: tgDarkPrimaryColor,
        toolbarHeight: 75.0,
        title: !isSearchExpanded
            ? Text(
                'Search',
                style: TextStyle(fontSize: 17),
              )
            : TextField(
                style: TextStyle(color: Colors.black87),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Ex: Pizza...',
                    hintStyle: TextStyle(
                        color: secondaryColor20LightTheme,
                        fontSize: 14), // Hint text color is grey
                    prefixIcon: Icon(LineAwesomeIcons.search_location,
                        color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black87),
                        borderRadius: BorderRadius.circular(22))),
                onChanged: (value) {
                  setState(() {
                    query = value;
                  });
                },
              ),
        actions: [
          IconButton(
            icon: Icon(LineAwesomeIcons.search),
            onPressed: () {
              setState(() {
                isSearchExpanded = !isSearchExpanded;
              });
            },
          ),
        ],
      ),
      body: query.isEmpty
          ? Center(
              child: Lottie.asset("images/Search.json", height: 127),
            )
          : FutureBuilder<List<dynamic>>(
              future: customhttp.search(query),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  /////////// shimmer loading effect  ////////////////

                  return Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: ListTile(
                      leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Container(
                            width: 70,
                            height: 250,
                            color: Colors.white,
                          )),
                      title: Container(
                        width: double.infinity,
                        height: 10.0,
                        color: Colors.white,
                      ),
                      subtitle: Container(
                        width: double.infinity,
                        height: 10.0,
                        color: Colors.white,
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      var result = snapshot.data![index];
                      return FutureBuilder<Map<String, String>?>(
                        future: fetchDistance(
                          result['latitude'],
                          result['longitude'],
                          userLat,
                          userLang,
                        ),
                        builder: (context, distanceSnapshot) {
                          if (distanceSnapshot.connectionState ==
                              ConnectionState.waiting) {
                            /////////////// shimmer loading effect /////////////////
                            return Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: ListTile(
                                leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Container(
                                      width: 70,
                                      height: 250,
                                      color: Colors.white,
                                    )),
                                title: Container(
                                  width: double.infinity,
                                  height: 10.0,
                                  color: Colors.white,
                                ),
                                subtitle: Container(
                                  width: double.infinity,
                                  height: 10.0,
                                  color: Colors.white,
                                ),
                              ),
                            );
                          } else {
                            final distance =
                                distanceSnapshot.data?['distance'] ?? '...';
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                shadowColor: tgDarkPrimaryColor,
                                color: const Color.fromARGB(255, 193, 228, 225),
                                elevation: 4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0, vertical: 4.0),
                                          child: RatingBarIndicator(
                                            rating: double.parse(
                                                result['average_rating']
                                                    .toString()),
                                            itemBuilder: (context, index) =>
                                                Icon(
                                              Icons.star,
                                              color: Colors.amber.shade700,
                                              // color: tgDarkPrimaryColor,
                                            ),
                                            itemCount: 5,
                                            itemSize: 10.0,
                                            direction: Axis.horizontal,
                                          ),
                                        ),
                                        SizedBox(
                                            width:
                                                2), // Add space between the stars and the rating number
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 7),
                                          child: Text(
                                            result['average_rating'].toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                // fontWeight: FontWeight.bold,
                                                fontSize: 9),
                                          ),
                                        ),
                                      ],
                                    ),

                                    ////////////// listile starts here ////////
                                    Column(
                                      children: [
                                        ListTile(
                                          leading: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              result["profile_image"] == null ||
                                                      result["profile_image"]
                                                          .isEmpty
                                                  ? "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a8/Noto_Emoji_v2.034_1f3e0.svg/800px-Noto_Emoji_v2.034_1f3e0.svg.png"
                                                  : result['profile_image'],
                                              width: 70,
                                              height: 250,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          title: Text(result['business_name'],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color:
                                                      secondaryColor60LightTheme,
                                                  fontSize: 14)),
                                          subtitle: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 7),
                                            child: Text(
                                              result['business_description'],
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color:
                                                      secondaryColor40LightTheme,
                                                  fontSize: 12),
                                            ),
                                          ),
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    DefaultProfilePage(
                                                  uid: result['business_uid'],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0, vertical: 3.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                result["country"],
                                                style: TextStyle(
                                                  color:
                                                      secondaryColor40LightTheme,
                                                  fontSize: 9,
                                                ),
                                              ),
                                              Text(
                                                " $distance Away",
                                                style: TextStyle(
                                                  color:
                                                      secondaryColor40LightTheme,
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                        },
                      );
                    },
                  );
                }
              },
            ),
    );
  }
}
