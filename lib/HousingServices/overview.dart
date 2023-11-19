// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:sssv1/providers/business_profile_provider.dart';

// class OverviewPage extends StatelessWidget {
//   const OverviewPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var data = Provider.of<BusinessProfileProvider>(context);

//     return Column(children: [
//       if (data.businessProfileData?.hosingdetails != null) ...[
//         Text(
//             "Age of Building :  ${data.businessProfileData?.hosingdetails!.ageofBuilding.toString()}"),
//         Text(
//             "Bathroom : ${data.businessProfileData?.hosingdetails!.bathroom.toString()}"),
//         Text(
//             'Facing: ${data.businessProfileData?.hosingdetails!.facing.toString()}'),
//         Text(
//             'Furnishing Status: ${data.businessProfileData?.hosingdetails!.furnishingStatus.toString()}'),
//         Text(
//             'Gated Security: ${data.businessProfileData?.hosingdetails!.gatedSecurity.toString()}'),
//         Text(
//             'Rooms: ${data.businessProfileData?.hosingdetails!.rooms.toString()}'),
//       ],
//     ]);
//   }
// }

// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/providers/business_profile_provider.dart';
import 'package:sssv1/utils/constants.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<BusinessProfileProvider>(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 11, top: 7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Overview",
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 6,
                ),
                height: 3, // Adjust the height of the line as needed
                width: 75, // Adjust the width of the line as needed
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color:
                                tgPrimaryColor))), // Set the color of the line
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      children: [
                        Icon(Icons.circle,
                            size: 8, color: secondaryColor20LightTheme),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Furnishing Status : ${data.businessProfileData?.hosingdetails?.furnishingStatus.toString() ?? "N/A"}",
                          style: TextStyle(color: secondaryColor40LightTheme),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              ////////// 2nd //////////
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      children: [
                        Icon(Icons.circle,
                            size: 8, color: secondaryColor20LightTheme),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Facing : ${data.businessProfileData?.hosingdetails?.facing.toString() ?? "N/A"}",
                          style: TextStyle(color: secondaryColor40LightTheme),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              ////////// 3rd /////
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      children: [
                        Icon(Icons.circle,
                            size: 8, color: secondaryColor20LightTheme),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "GatedSecurity : ${data.businessProfileData?.hosingdetails?.gatedSecurity.toString() ?? "N/A"}",
                          style: TextStyle(color: secondaryColor40LightTheme),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              ////////////// 4th ////////////////

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      children: [
                        Icon(Icons.circle,
                            size: 8, color: secondaryColor20LightTheme),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          " Age of building : ${data.businessProfileData?.hosingdetails?.ageofBuilding.toString() ?? "N/A"}",
                          style: TextStyle(color: secondaryColor40LightTheme),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // 5th //////////////////////

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      children: [
                        Icon(Icons.circle,
                            size: 8, color: secondaryColor20LightTheme),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          " Rooms : ${data.businessProfileData?.hosingdetails?.rooms.toString() ?? "N/A"}",
                          style: TextStyle(color: secondaryColor40LightTheme),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        // Divider(
        //   color: Colors.blueGrey,
        //   thickness: .7,
        // ),
      ],
    );
  }
}
