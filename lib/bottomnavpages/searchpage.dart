// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sssv1/NewdefaultprofilePage/defaultpage&tabview.dart';
import 'package:sssv1/network_calling/http.dart';

import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:sssv1/utils/constants.dart';

import 'package:lottie/lottie.dart';
import 'package:sssv1/utils/success_lottiejson.dart';

class SearchBarPage extends StatefulWidget {
  const SearchBarPage({Key? key}) : super(key: key);

  @override
  State<SearchBarPage> createState() => _SearchBarPageState();
}

class _SearchBarPageState extends State<SearchBarPage> {
  bool isSearchExpanded = false;
  String query = '';
  Http http = Http();

  @override
  Widget build(BuildContext context) {
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
              future: http.search(query),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child: CircularProgressIndicator(
                    color: tgPrimaryColor,
                  ));
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      var result = snapshot.data![index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          shadowColor: tgDarkPrimaryColor,
                          color: const Color.fromARGB(255, 193, 228, 225),
                          // color: tgLightPrimaryColor,
                          elevation: 4,
                          child: SizedBox(
                            height: 100,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 13, bottom: 13),
                              child: ListTile(
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    result["profile_image"] == null ||
                                            result["profile_image"].isEmpty
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
                                        color: secondaryColor60LightTheme,
                                        fontSize: 14)),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 7),
                                  child: Text(
                                    result['business_description'],
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: secondaryColor40LightTheme,
                                        fontSize: 12),
                                  ),
                                ),
                                trailing: Icon(
                                  LineAwesomeIcons.angle_right,
                                  size: 16,
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DefaultProfilePage(
                                        uid: result['business_uid'],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
    );
  }
}
