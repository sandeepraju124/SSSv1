// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lottie/lottie.dart';
import 'package:sssv1/NewdefaultprofilePage/defaultpage&tabview.dart';
import 'package:sssv1/network_calling/http.dart';

import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:sssv1/providers/live_user_location.dart';
import 'package:sssv1/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';

import 'package:provider/provider.dart';

class SearchBarPage extends StatefulWidget {
  const SearchBarPage({Key? key}) : super(key: key);

  @override
  State<SearchBarPage> createState() => _SearchBarPageState();
}

class _SearchBarPageState extends State<SearchBarPage> {
  List<dynamic> data = [];
  bool isLoading = false;
  Timer? _debounce;
  bool isSearchExpanded = false;
  String query = '';
  Http customhttp = Http();
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  Future<Map<String, String>?> fetchDistance(
      String lat, String lang, String userLat, String userLang) async {
    try {
      Uri url = Uri.parse(
          "https://maps.googleapis.com/maps/api/directions/json?origin=$userLat,$userLang&destination=$lat,$lang&key=AIzaSyBIp8U5x3b2GVj1cjNU3N6funOz_tEUAdk");
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['routes'] != null &&
            data['routes'].isNotEmpty &&
            data['routes'][0]["legs"] != null &&
            data['routes'][0]["legs"].isNotEmpty) {
          String dist = data['routes'][0]["legs"][0]["distance"]["text"];
          String dura = data['routes'][0]["legs"][0]["duration"]["text"];
          return {"distance": dist, "duration": dura};
        } else {
          print("No distance data found in API response");
          return {"distance": "-", "duration": "-"};
        }
      } else {
        print("API request failed with status code: ${response.statusCode}");
        return {"distance": "-", "duration": "-"};
      }
    } catch (e) {
      print("Exception occurred while fetching distance: $e");
      return {"distance": "-", "duration": "-"};
    }
  }

  Future<void> _getSuggestions(String query) async {
    setState(() {
      isLoading = true;
      data = [];
    });
    final response = await http
        .get(Uri.parse('$baseUrl/pg/fulltext_search?query=$query&count=10'));
    if (response.statusCode == 200) {
      setState(() {
        data = json.decode(response.body);
        isLoading = false;
      });
      if (data.isEmpty) {
        // Show message when no matching results found
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('No Results'),
            content: Text('No matching results found for your search.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'OK',
                  style: TextStyle(color: tgDarkPrimaryColor),
                ),
              ),
            ],
          ),
        );
      }
    } else {
      setState(() {
        isLoading = false;
      });
      throw Exception('Failed to load suggestions');
    }
  }

  void _onSearchTextChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    setState(() {
      _searchController.text = query;
    });
    if (query.isEmpty) {
      setState(() {
        data.clear();
      });
    } else {
      _debounce = Timer(Duration(milliseconds: 500), () {
        setState(() {
          _isSearching = true;
        });
        _getSuggestions(query).then((_) {
          setState(() {
            _isSearching = false;
          });
        });
      });
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
                    hintText: '    Ex: Pizza...',
                    hintStyle: TextStyle(
                        color: secondaryColor20LightTheme, fontSize: 14),
                    prefixIcon:
                        Icon(LineAwesomeIcons.search, color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black87),
                        borderRadius: BorderRadius.circular(22))),
                controller: _searchController,
                onChanged: _onSearchTextChanged,
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
      body: Stack(
        children: [
          isLoading
              ? Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) => ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Container(
                          width: 70,
                          height: 250,
                          color: Colors.white,
                        ),
                      ),
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
                  ),
                )
              : Visibility(
                  visible: !isLoading && data.isNotEmpty,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return FutureBuilder<Map<String, String>?>(
                        future: fetchDistance(
                            data[index]['latitude'].toString(),
                            data[index]['longitude'].toString(),
                            userLat,
                            userLang),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
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
                            return Text('Error: ${snapshot.error}');
                          } else {
                            String distance =
                                snapshot.data?['distance'] ?? '...';
                            // print(distance);
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                shadowColor: tgDarkPrimaryColor,
                                color: const Color.fromARGB(255, 193, 228, 225),
                                elevation: 4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    // RatingBarIndicator at the top right corner
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 8.0, top: 3),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            RatingBarIndicator(
                                              rating: data[index]
                                                      ['average_rating']
                                                  .toDouble(),
                                              itemBuilder: (context, index) =>
                                                  Icon(
                                                Icons.star,
                                                color: Colors.amber.shade700,
                                              ),
                                              itemCount: 5,
                                              itemSize: 12.0,
                                              direction: Axis.horizontal,
                                            ),
                                            SizedBox(width: 4),
                                            Text(
                                              data[index]["average_rating"]
                                                  .toString(),
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 11.3,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    ListTile(
                                      leading: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          data[index]["profile_image_url"] ==
                                                      null ||
                                                  data[index]
                                                          ["profile_image_url"]
                                                      .isEmpty
                                              ? "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a8/Noto_Emoji_v2.034_1f3e0.svg/800px-Noto_Emoji_v2.034_1f3e0.svg.png"
                                              : data[index]
                                                  ['profile_image_url'],
                                          width: 70,
                                          height: 250,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      title: Text(data[index]['business_name'],
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: secondaryColor60LightTheme,
                                              fontSize: 14)),
                                      subtitle: Padding(
                                        padding: const EdgeInsets.only(top: 7),
                                        child: Text(
                                          data[index]['business_description'],
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: secondaryColor40LightTheme,
                                              fontSize: 12),
                                        ),
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DefaultProfilePage(
                                              uid: data[index]['business_uid'],
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
                                            data[index]["country"],
                                            style: TextStyle(
                                              color: secondaryColor40LightTheme,
                                              fontSize: 9,
                                            ),
                                          ),
                                          Text(
                                            "$distance Away",
                                            style: TextStyle(
                                              color: secondaryColor40LightTheme,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                        },
                      );
                    },
                  ),
                ),
          if (!isLoading && data.isEmpty)
            Align(
              alignment: Alignment.center,
              child: Lottie.asset("images/Search.json", height: 127),
            ),
        ],
      ),
    );
  }
}
