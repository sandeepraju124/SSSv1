// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:sssv1/NewdefaultprofilePage/defaultpage&tabview.dart';
import 'package:sssv1/providers/restaurent_provider.dart';

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
    var data = Provider.of<RestaurantListProvider>(context, listen: false);
    // print("fgh");
    // print(data);
    if (data.subcategoryListData!.isEmpty) {
      data.subCategoryListProvider("Restaurant");
      // print("empty");
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<RestaurantListProvider>(context);
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
                itemCount: data.subcategoryListData!.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () async {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DefaultProfilePage(
                                uid: data
                                    .subcategoryListData![index].businessUid,
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
                                data.subcategoryListData![index].profileImage,
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
                                          data.subcategoryListData![index]
                                              .businessName,
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
                                  data.subcategoryListData![index]
                                      .businessDescription,
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
                              data.subcategoryListData![index].overallRating
                                  .toString(),
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
