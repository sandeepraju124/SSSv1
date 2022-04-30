import 'package:flutter/material.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffCAD3D3),
      body: SingleChildScrollView(
          // scrollDirection:Axis.vertical ,
          child: SafeArea(
        child: ListView(
          shrinkWrap: true,
          // scrollDirection: Axis.vertical,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 160,
                  width: double.infinity,
                  color: Colors.green,
                  child: Image.asset(
                    "images/restaurant/restaurant1.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: -65,
                  child: Center(
                    child: Container(
                      height: 110,
                      width: 210,
                      // color: Colors.redAccent,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Stack(clipBehavior: Clip.none, children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 5, left: 2, right: 2),
                          child: Container(
                            height: 40,
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FittedBox(
                                fit: BoxFit.fill,
                                child: Text(
                                  "Tatva Sea Food",
                                  style: TextStyle(
                                    fontFamily: "Roboto",
                                  ),
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xffCAD3D3),
                            ),
                          ),
                        ),
                        Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Color(0xffCAD3D3),
                                    shape: BoxShape.circle,
                                  )),
                            )),
                        Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Color(0xffCAD3D3),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            )),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: -25,
                          child: Center(
                            child: Container(
                                // child: Image.asset(
                                //   "images/restaurant/restaurant1.jpg",
                                //
                                // ) ,
                                height: 85,
                                width: 80,
                                // width: double.infinity,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("images/thegrill.jpg"),fit: BoxFit.cover),
                                  color: Colors.black,
                                  shape: BoxShape.circle,
                                )),
                          ),
                        )
                      ]),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Stack(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 13),
                      child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          )),
                    )),
                Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 13),
                      child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          )),
                    ))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 130,
              width: double.infinity,
              color: Colors.white,
            )
          ],
        ),
      )),
    );
  }
}
