// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/Askcommunity%20Section/questions.dart';
import 'package:sssv1/NewdefaultprofilePage/operating_hours_display.dart';
import 'package:sssv1/NewdefaultprofilePage/photos.dart';
import 'package:sssv1/Reviews%20Section/displayreviewbottomsheet.dart';

import 'package:sssv1/providers/business_profile_provider.dart';
import 'package:sssv1/utils/constants.dart';
import 'package:sssv1/utils/navigator.dart';

class AdditionalInfoPage extends StatelessWidget {
  const AdditionalInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<BusinessProfileProvider>(context);

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 101,
            // color: Colors.redAccent,
            // color: Colors.white,

            decoration: BoxDecoration(
              border: Border(
                // top: BorderSide(color: Colors.blueGrey, width: 0.6),
                bottom: BorderSide(color: Colors.blueGrey, width: 0.6),
              ),
            ),

            child: Padding(
              padding: const EdgeInsets.only(top: 7),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 65,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    border: Border.all(color: tgAccentColor)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return Questionpage(
                                          id: '',
                                        );
                                      }));
                                    },
                                    icon: Icon(LineAwesomeIcons.comment),
                                    iconSize: 26,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 3),
                                child: Text(
                                  "Ask Community",
                                  style: TextStyle(fontSize: 12),
                                ),
                              )
                            ]),
                      ),
                      Expanded(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 65,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    border: Border.all(color: tgAccentColor)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: IconButton(
                                    onPressed: () {
                                      // makePhoneCall(displayData[index].contactInformation);
                                      print(data.businessProfileData!
                                          .contactInformation);
                                      makePhoneCall(data.businessProfileData!
                                          .contactInformation);
                                    },
                                    icon: Icon(LineAwesomeIcons.phone_volume),
                                    iconSize: 26,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 3),
                                child: Text(
                                  "Call",
                                  style: TextStyle(fontSize: 12),
                                ),
                              )
                            ]),
                      ),
                      Expanded(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 65,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    border: Border.all(color: tgAccentColor)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: IconButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                        context: context,
                                        elevation: 6,
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        builder: (context) {
                                          return Builder(
                                            builder: (context) {
                                              return Padding(
                                                padding: EdgeInsets.only(
                                                  bottom: MediaQuery.of(context)
                                                      .viewInsets
                                                      .bottom,
                                                ),
                                                child: SingleChildScrollView(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(20),
                                                        topRight:
                                                            Radius.circular(20),
                                                      ),
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  20),
                                                          decoration:
                                                              BoxDecoration(
                                                            // Set your desired header color
                                                            color:
                                                                secondaryColor20LightTheme,

                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(20),
                                                              topRight: Radius
                                                                  .circular(20),
                                                            ),
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                "Add Review",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black, // Set your desired text color
                                                                  fontSize: 15,
                                                                  // fontWeight:
                                                                  //     FontWeight
                                                                  //         .bold,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(4.0),
                                                          child:
                                                              DisplayReviewBottomSheet(
                                                            businessUid: data
                                                                .businessProfileData!
                                                                .businessUid,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      );
                                    },
                                    icon: Icon(Icons.comment_bank_sharp),
                                    iconSize: 26,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 3),
                                child: Text(
                                  "Add Review",
                                  style: TextStyle(fontSize: 12),
                                ),
                              )
                            ]),
                      ),
                      Expanded(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // navigatorPush(context, AddPhotos());
                                },
                                child: Container(
                                  height: 65,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      border: Border.all(color: tgAccentColor)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: IconButton(
                                      onPressed: () {
                                        navigatorPush(context, AddPhotos());
                                      },
                                      icon: Icon(
                                        LineAwesomeIcons.image,
                                      ),
                                      iconSize: 26,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 3),
                                child: Text(
                                  "Photo",
                                  style: TextStyle(fontSize: 12),
                                ),
                              )
                            ]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          /////// small description  ////////////////

          Container(
            width: double.infinity,
            // height: 170,
            // height: MediaQuery.of(context).size.height / 8,
            decoration: BoxDecoration(
              border: Border(
                // top: BorderSide(color: Colors.blueGrey, width: 0.6),
                bottom: BorderSide(color: Colors.blueGrey, width: 0.6),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 11, top: 12),
                  child: Text(
                    'Know About them',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 10, top: 1),
                    height: 1.7, // Adjust the height of the line as needed
                    width: 110, // Adjust the width of the line as needed
                    color: tgPrimaryColor // Set the color of the line
                    ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    // height: 104,
                    // color: Colors.white,

                    // child: Text(
                    //   data.businessProfileData!.businessDescription.toString(),
                    //   // "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. Cras elementum ultrices diam. Maecenas ligula massa, varius a, semper congue, euismod non, mi. Proin porttitor, orci nec nonummy molestie, enim est eleifend mi, non fermentum diam nisl sit amet erat ",
                    //   style: TextStyle(
                    //       color: secondaryColor20LightTheme,
                    //       fontFamily: "Roboto",
                    //       wordSpacing: 0.5,
                    //       letterSpacing: -0.1),
                    // ),
                    child: Text(
                      data.businessProfileData?.businessDescription
                              .toString() ??
                          'Default description',
                      style: TextStyle(
                          color: secondaryColor20LightTheme,
                          fontFamily: "Roboto",
                          wordSpacing: 0.5,
                          letterSpacing: -0.1),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 11, top: 12),
            child: Text(
              'Business Status',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 10, top: 1),
              height: 1.7, // Adjust the height of the line as needed
              width: 110, // Adjust the width of the line as needed
              color: tgPrimaryColor // Set the color of the line
              ),
          // SizedBox(
          //   height: 10,
          // ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BusinessStatus(),
          ),
        ],
      ),
    );
  }
}
