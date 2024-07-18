import 'package:flutter/material.dart';
import 'package:sssv1/NewdefaultprofilePage/defaultpage&tabview.dart';
import 'package:sssv1/network_calling/http.dart';
import 'package:sssv1/providers/home_restaurent_provider.dart';

import 'package:provider/provider.dart';
import 'package:sssv1/utils/constants.dart';

class RestaurantTest extends StatefulWidget {
  const RestaurantTest({super.key});

  @override
  State<RestaurantTest> createState() => _RestaurantTestState();
}

class _RestaurantTestState extends State<RestaurantTest> {
  @override
  void initState() {
    var data = Provider.of<HomeRestaurantListProvider>(context, listen: false);
    if (data.getHomeBusinessData.isEmpty) {
      data.getHomeBusinessProvider(key: "sub_category", value: "Restaurant");
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
            height: 300,
            width: double.infinity,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: data.getHomeBusinessData.length,
                itemBuilder: (BuildContext context, int index) {
                  final overallRating = data.businessRating[data.getHomeBusinessData[index]!.businessUid]!['rating'];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DefaultProfilePage(
                                uid: data.getHomeBusinessData[index]!.businessUid,
                              )));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 14, right: 10),
                      child: Container(
                        width: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                              child: Image.network(
                                data.getHomeBusinessData[index]!.profileImageUrl,
                                height: 180,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data.getHomeBusinessData[index]!.businessName,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    data.getHomeBusinessData[index]!.businessDescription,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      // Icon(Icons.star, color: Colors.yellow[700], size: 16),
                                      Icon(Icons.star, color: Colors.teal[700], size: 16),
                                      SizedBox(width: 4),
                                      Text(
                                        overallRating.toString(),
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Spacer(),
                                      Text("209 reviews", style: TextStyle(fontSize: 12, color: Colors.grey)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          );
  }
}
