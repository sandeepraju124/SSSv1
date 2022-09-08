import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                            child: const Center(
                              child: Text(
                                "Tatva Sea Food",
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 18,
                                    color: Colors.black87),
                              ),
                            ),
                            decoration: const BoxDecoration(
                              color: Color(0xffCAD3D3),
                            ),
                          ),
                        ),
                        Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  child: const Icon(
                                    Icons.filter_outlined,
                                  ),
                                  height: 50,
                                  width: 50,
                                  decoration: const BoxDecoration(
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
                                decoration: const BoxDecoration(
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
                                height: 85,
                                width: 80,
                                // width: double.infinity,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("images/thegrill.jpg"),
                                      fit: BoxFit.cover),
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
                          child: Image.asset("images/setting.png",
                              height: 10,
                              fit: BoxFit.none,
                              color: Color(0xff5F6368)),
                          height: 60,
                          width: 60,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          )),
                    )),
                Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 13),
                      child: Container(
                          child: const Icon(
                            Icons.filter_outlined,
                            color: Color(0xff5F6368),
                          ),
                          height: 60,
                          width: 60,
                          decoration: const BoxDecoration(
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
              height: 110,
              width: double.infinity,
              color: Colors.white,
              child: Row(children: [
                Expanded(
                    child: Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Status",
                            style:
                                TextStyle(fontFamily: "Roboto", fontSize: 20)),
                        SizedBox(
                          height: 10,
                        ),
                        Text('online',
                            style: TextStyle(
                                fontFamily: "Roboto", color: Colors.green))
                      ]),
                  // color: Colors.blueGrey,
                )),
                const VerticalDivider(
                    color: Colors.grey,
                    thickness: 2,
                    indent: 20,
                    endIndent: 20),
                Expanded(
                    child: Container(
                  // color: Colors.amber,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Premium",
                            style:
                                TextStyle(fontFamily: "Roboto", fontSize: 20)),
                        SizedBox(
                          height: 10,
                        ),
                        Icon(
                          Icons.currency_rupee_rounded,
                          size: 20,
                          color: Colors.red,
                        )
                      ]),
                )),
                const VerticalDivider(
                    color: Colors.grey,
                    thickness: 2,
                    indent: 20,
                    endIndent: 20),
                Expanded(
                    child: Container(
                  // color: Colors.pink,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Dine",
                            style:
                                TextStyle(fontFamily: "Roboto", fontSize: 20)),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Available',
                            style: TextStyle(
                                fontFamily: "Roboto", color: Colors.green))
                      ]),
                )),
                const VerticalDivider(
                    color: Colors.grey,
                    thickness: 2,
                    indent: 20,
                    endIndent: 20),
                Expanded(
                    child: Container(
                  // color: Colors.deepOrange,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Type",
                            style:
                                TextStyle(fontFamily: "Roboto", fontSize: 20)),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Only Veg',
                            style: TextStyle(
                                fontFamily: "Roboto", color: Colors.green))
                      ]),
                ))
              ]),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 120,
              color: Colors.white,
            ),
            const Gap(10),
            // coluumn 1
            Container(
              height: 200,
              color: Colors.white,
              child: Column(children: [
                Container(
                    height: 60,
                    // color: Colors.blueGrey,
                    child: Row(
                      children: [
                        //Column1 Row1
                        Expanded(
                          flex: 30,
                          child: Container(
                            child: Column(children: const [
                              CircleAvatar(
                                  radius: 22,
                                  backgroundImage: NetworkImage(
                                      'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=600')),
                              // Gap(2),
                              Text('Sandeep Raju',
                                  style: TextStyle(fontSize: 12)),
                            ]),
                            // color: Colors.green,
                          ),
                        ),
                        //Column1 Row2
                        Expanded(
                            flex: 40,
                            child: Container(
                              // color: Colors.amber[400],
                              child: Column(children: [
                                Expanded(
                                    child: Container(
                                  // color: Colors.deepPurpleAccent,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(Icons.star_rate_rounded),
                                      Icon(Icons.star_rate_rounded),
                                      Icon(Icons.star_rate_rounded),
                                      Icon(Icons.star_rate_rounded),
                                      // Icon(Icons.star_rate_rounded),
                                    ],
                                  ),
                                )),
                                Expanded(
                                    child: Container(
                                  color: Colors.purple,
                                ))
                              ]),
                            )),
                        // Column1 Row3
                        Expanded(
                            flex: 30,
                            child: Container(
                                // margin: EdgeInsets.all(5),
                                // color: Colors.amber[700],
                                child: Row(
                                  mainAxisAlignment:MainAxisAlignment.center ,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.all(3),
                                          child: const Icon(
                                            FontAwesomeIcons.circleArrowUp,
                                          ),
                                        ),
                                        const Text("Uplift",style: TextStyle(fontSize: 8),),
                                      ],
                                    ),
                                    Column(mainAxisAlignment:MainAxisAlignment.center ,
                                children: [
                                  Container(margin: const EdgeInsets.all(3),
                                    child: const Icon(FontAwesomeIcons.circleArrowDown)),
                                    const Text("Downlift",style:TextStyle(fontSize: 8) ),
                                ],
                              ),
                                  ],
                                )))
                      ],
                    )),
                // column 2
                Expanded(
                    child: Container(
                  margin: EdgeInsets.all(10),
                  // color: Colors.indigo,
                  child: const Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent vel a rhoncus mi, vel fermentum quam sodales imperdiet. Nullam nec fermentum justo, a molestie nibh. Maecenas mattis sem at odio fermentum'),
                )),
                // Column 3
                Expanded(
                    child: Container(
                  // color: Colors.lightGreenAccent,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext, int) => images(),
                  ),
                )),
              ]),
            )
          ],
        ),
      )),
    );
  }
}

class images extends StatelessWidget {
  const images({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Image.network(
              'https://images.unsplash.com/photo-1600891964599-f61ba0e24092?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cmVzdGF1cmFudCUyMGZvb2R8ZW58MHx8MHx8&w=1000&q=80'),
        ),
        const Gap(8),
      ],
    );
  }
}
