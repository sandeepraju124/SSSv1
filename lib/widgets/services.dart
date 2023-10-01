// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sssv1/utils/constants.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Services extends StatelessWidget {
  const Services({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black12, width: 1),
            color: secondaryColor5LightTheme,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Column(children: [
          Expanded(
              child: Row(children: [
            Expanded(
                child: Column(children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(3, 15, 3, 3),
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        LineAwesomeIcons.car,
                        size: 31,
                      ),
                      //  Image.asset('images/services/carwash.png'),
                    ),
                  ),
                ),
              ),
              const Text(
                'Car Wash',
                style: TextStyle(color: secondaryColor20LightTheme),
              )
            ])),
            Expanded(
                child: Column(children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(3, 15, 3, 3),
                  child: GestureDetector(
                    onTap: () {
                      // var searchlist = Provider.of<SearchlistProvider>(context, listen: false);
                      // searchlist.resProv();
                      // print('navigation called');

                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => SearchList())
                      //     );
                    },
                    child: Container(
                      height: 40,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                            // Image.asset('images/services/cutlery.png'),
                            Icon(
                          LineAwesomeIcons.utensils,
                          size: 31,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Text(
                'Restaurants',
                style: TextStyle(color: secondaryColor20LightTheme),
              )
            ])),
            Expanded(
                child: Column(children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(3, 15, 3, 3),
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.white
                        // secondaryColor10LightTheme
                        ,
                        shape: BoxShape.circle),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                          // Image.asset('images/services/estateagent.png'),
                          Icon(
                        LineAwesomeIcons.home,
                        size: 31,
                      ),
                    ),
                  ),
                ),
              ),
              const Text(
                'real estate',
                style: TextStyle(color: secondaryColor20LightTheme),
              )
            ])),
            Expanded(
                child: Column(children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(3, 15, 3, 3),
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        // color: secondaryColor10LightTheme,
                        color: Colors.white,
                        shape: BoxShape.circle),
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                            // Image.asset('images/services/plumber.png'),
                            Icon(
                          LineAwesomeIcons.tools,
                          size: 31,
                        )),
                  ),
                ),
              ),
              const Text(
                'plumbing',
                style: TextStyle(color: secondaryColor20LightTheme),
              )
            ])),
          ])),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: Column(children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(3, 15, 3, 3),
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                                // Image.asset('images/services/fitness.png'),
                                Icon(
                              LineAwesomeIcons.dumbbell,
                              size: 31,
                            )),
                      ),
                    ),
                  ),
                  const Text(
                    'Gym',
                    style: TextStyle(color: secondaryColor20LightTheme),
                  )
                ])),
                Expanded(
                    child: Column(children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(3, 15, 3, 5),
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              // Image.asset('images/services/barber.png'),
                              Icon(
                            LineAwesomeIcons.cut,
                            size: 31,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    'Barber',
                    style: TextStyle(color: secondaryColor20LightTheme),
                  )
                ])),
                Expanded(
                    child: Column(children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(3, 15, 3, 3),
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                                // Image.asset('images/services/champagne.png'),
                                Icon(
                              LineAwesomeIcons.beer,
                              size: 31,
                            )),
                      ),
                    ),
                  ),
                  const Text(
                    'bar',
                    style: TextStyle(color: secondaryColor20LightTheme),
                  )
                ])),
                Expanded(
                    child: Column(children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(2, 15, 2, 3),
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: secondaryColor10LightTheme,
                            shape: BoxShape.circle),
                        child: const Align(
                            alignment: Alignment.center,
                            child: Text(
                              'MORE',
                              style: TextStyle(fontSize: 10),
                            )),
                      ),
                    ),
                  ),
                  const Text('more')
                ])),
              ],
            ),
          ),
          const SizedBox(
            height: 7,
          )
        ]),
      ),
    );
  }
}
