// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:sssv1/NewdefaultprofilePage/defaultpage&tabview.dart';
import 'package:sssv1/network_calling/http.dart';
import 'package:sssv1/providers/home_restaurent_provider.dart';

import 'package:provider/provider.dart';
import 'package:sssv1/utils/constants.dart';

class Restaurant extends StatefulWidget {
  const Restaurant({
    super.key,
  });

  @override
  State<Restaurant> createState() => _RestaurantState();
}

class _RestaurantState extends State<Restaurant> {
  @override
  void initState() {
    var data = Provider.of<HomeRestaurantListProvider>(context, listen: false);
    // print("fgh");
    // print(data);
    if (data.getHomeBusinessData.isEmpty) {
      data.getHomeBusinessProvider(key: "is_premium", value: "true");
      // print("empty");
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<HomeRestaurantListProvider>(context);
    return data.isLoading
        ? Center(
            child: CircularProgressIndicator(color: tgPrimaryColor),
          )
        : SizedBox(
            height: 270,
            width: double.infinity,
            // color: Colors.yellow,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                // shrinkWrap: true,
                itemCount: data.getHomeBusinessData.length,
                itemBuilder: (BuildContext context, int index) {
                  final overall = Http().overall_rating(data.getHomeBusinessData[index]!.businessUid);
                  print(overall);
                  return GestureDetector(
                    onTap: () async {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DefaultProfilePage(
                                uid: data
                                    .getHomeBusinessData[index]!.businessUid,
                              )));
                    },
                    child: Stack(
                      children: [
                        Container(
                          width: 150,
                          // ignore: prefer_const_constructors
                          margin: EdgeInsets.only(left: 14),
                          // height: 20,
                          // color: Colors.green,
                          child: Column(children: [
                            // Column1 RestaurentImage
                            SizedBox(
                              // color: Colors.amber,
                              height: 200,
                              child: Image.network(
                                data.getHomeBusinessData[index]!.profileImageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                            // Column2 RestaurentName and Rating
                            SizedBox(
                                height: 30,
                                // color: Colors.pink,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                          data.getHomeBusinessData[index]
                                              !.businessName,
                                          // "something",
                                          // provider.data[index].name,
                                          // maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              color: Colors.black)),
                                    ),
                                  ],
                                )),
                            // Column3 Description
                            Expanded(
                                child: Container(
                              // color: Colors.teal,
                              child: Text(
                                  data.getHomeBusinessData[index]
                                      !.businessDescription,
                                  // provider.data[index].despription,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.grey)),
                            ))
                          ]),
                        ),
                        Positioned(
                          top: 5,
                          right: 10,
                          child: Container(
                            width: 40,
                            height: 17,
                            decoration: BoxDecoration(
                              color: Colors.yellow,
                              // borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.yellow.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Center(
                                child: Text(
                                  overall.toString(),
                                  // "5",
                              // data.getHomeBusinessData[index]!.overallRating
                              //     .toString(),
                              style: TextStyle(
                                wordSpacing: 0.5,
                                letterSpacing: -0.1,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                          ),
                        )
                      ],
                    ),
                  );
                }),
          );
  }
}
