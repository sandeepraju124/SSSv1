// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/Askcommunity%20Section/questions.dart';
import 'package:sssv1/Reviews%20Section/full_reviewspage.dart';
import 'package:sssv1/providers/business_profile_provider.dart';
import 'package:sssv1/utils/constants.dart';

import '../utils/navigator.dart';
import '../widgets/staggered_grid.dart';

class AdditionalInfoPage extends StatelessWidget {
  const AdditionalInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<BusinessProfileProvider>(context);

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
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
                                        return Questionpage(id: "");
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
                                    onPressed: () {},
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
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return showallreviewspage();
                                      }));
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
                        child: GestureDetector(
                          onTap: () {
                            Navigators()
                                .navigatorPush(context, StaggeredGridq());
                          },
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
                                      onPressed: () {},
                                      icon: Icon(
                                        LineAwesomeIcons.image,
                                      ),
                                      iconSize: 26,
                                      color: Colors.black54,
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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 10, top: 1),
                    height: 3, // Adjust the height of the line as needed
                    width: 110, // Adjust the width of the line as needed
                    color: tgPrimaryColor // Set the color of the line
                    ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    // height: 104,
                    // color: Colors.white,

                    child: Text(
                      data.businessProfileData!.businessDescription.toString(),
                      // "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. Cras elementum ultrices diam. Maecenas ligula massa, varius a, semper congue, euismod non, mi. Proin porttitor, orci nec nonummy molestie, enim est eleifend mi, non fermentum diam nisl sit amet erat ",
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
        ],
      ),
    );
  }
}
