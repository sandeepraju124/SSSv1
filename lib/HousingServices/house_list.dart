// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/NewdefaultprofilePage/defaultpage&tabview.dart';
import 'package:sssv1/providers/Housedata_Provider.dart';
import 'package:sssv1/utils/navigator.dart';

class PropertyCard extends StatefulWidget {
  @override
  State<PropertyCard> createState() => _PropertyCardState();
}

class _PropertyCardState extends State<PropertyCard> {
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<HouseProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Property List',
          style: TextStyle(fontSize: 18),
        ),
        backgroundColor: Colors.teal,
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          right: 5,
        ),
        child: ListView.builder(
          // itemCount: 3,
          itemCount: data.houses.length,
          itemBuilder: (BuildContext, int) {
            return GestureDetector(
              onTap: () {
                navigatorPush(
                    context,
                    DefaultProfilePage(
                      uid: data.houses[int].businessUid ?? "",
                    ));
              },
              child: Card(
                // color: Colors.white,
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Image.network(
                                // 'images/house1.png', // Replace with your image asset
                                data.houses[int].profileImageUrl ?? "",
                                fit: BoxFit.cover,
                                height: 150.0,
                              ),
                            ),
                            // Expanded(
                            //   child: Image.asset(
                            //     'images/house2.png', // Replace with your image asset
                            //     fit: BoxFit.cover,
                            //     height: 150.0,
                            //   ),
                            // ),
                            // Expanded(
                            //   child: Image.asset(
                            //     'images/house3.png', // Replace with your image asset
                            //     fit: BoxFit.cover,
                            //     height: 150.0,
                            //   ),
                            // ),
                          ],
                        ),
                        Positioned(
                          top: 8.0,
                          left: 8.0,
                          child: Container(
                            color: Colors.black.withOpacity(0.5),
                            padding: EdgeInsets.all(4.0),
                            child: Row(
                              children: [
                                Icon(Icons.visibility,
                                    color: Colors.white, size: 16.0),
                                SizedBox(width: 4.0),
                                Text('4 people interested',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12.0)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '3 BHK Flat In Slt Heights for Rent In Slt Enclave',
                            style: TextStyle(
                                fontSize: 14.7, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            // 'slt enclave, near hitech MMTS, Slt enclave',
                            data.houses[int].location ??
                                'Location not available',

                            style: TextStyle(
                                fontSize: 14.0, color: Colors.grey[600]),
                          ),
                          SizedBox(height: 16.0),
                          Row(
                            children: [
                              Icon(Icons.check_circle_outline,
                                  color: Colors.green),
                              SizedBox(width: 8.0),
                              // Text('Fully Furnished'),
                              Text(data.houses[int].furnishingLevel ??
                                  'Not specified'),
                              Spacer(),
                              Icon(Icons.aspect_ratio, color: Colors.blue),
                              SizedBox(width: 8.0),
                              Text('1633 Sq. Ft.'),
                              Spacer(),
                              Icon(Icons.person, color: Colors.orange),
                              SizedBox(width: 8.0),
                              // Text('Anyone'),
                              Text(data.houses[int].preferred ??
                                  'Not specified'),
                            ],
                          ),
                          SizedBox(height: 16.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(children: [
                                  Text(
                                    // '₹35,000',
                                    data.houses[int].price ??
                                        'Price not available',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: 4.0),
                                  // Text('+ ₹1,500'),
                                  Text('+ ${data.houses[int].advance}'),
                                ]),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text('Contact Owner'),
                                style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: Colors.teal),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          // child:
        ),
      ),
    );
  }
}
