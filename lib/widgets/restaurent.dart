// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sssv1/models/category_models.dart';
import 'package:sssv1/models/subcatrgorylist_model.dart';
import 'package:sssv1/network_calling/http.dart';
import 'package:sssv1/providers/restaurent_provider.dart';
import 'package:sssv1/providers/sub_category_list.dart';
import 'package:sssv1/providers/sub_category_provider.dart';
import 'package:sssv1/screens/RealEstateProfile.dart';
import 'package:sssv1/utils/constants.dart';
import 'package:provider/provider.dart';

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
    if(data.subcategoryListData!.isEmpty){
      data.subCategoryListProvider("restaurant");
      // print("empty");
      
    }

    
    // data.subCategoryProvider("restaurant");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<RestaurantListProvider>(context);
    return data.isLoading
        ? Center(
            child: Image.asset("images/loading2.gif"),
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
                          builder: (context) => RealEstateProfile(
                              uid: data
                                  .subcategoryListData![index].businessUid)));
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
                            Container(
                              // color: Colors.amber,
                              height: 200,
                              child: Image.network(
                                data.subcategoryListData![index].profileImage,

                                fit: BoxFit.cover,
                                // "https://assets.vogue.in/photos/61b3753015fc923d29d9b585/2:3/w_2560%2Cc_limit/Silly-Food-Image-4-819x1024.jpeg"
                                // provider.data[index].image
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
