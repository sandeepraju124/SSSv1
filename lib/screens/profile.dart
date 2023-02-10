// ignore_for_file: camel_case_types, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sssv1/network_calling/http.dart';
import 'package:sssv1/providers/rescomments_provider.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/providers/service_provider.dart';
import 'package:sssv1/providers/user_provider.dart';

class profile extends StatefulWidget {
  final String id;

  profile({required this.id});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  void initState() {
    print('widget id');
    print(widget.id);
    // GetData().getSingleServiceData(widget.id);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var rescomments = Provider.of<rescommentsProvider>(context, listen: true);
    var user = Provider.of<UserProvider>(context, listen: false);
    // print("printing provider data");
    // print(widget.idpasses.toString());
    // print(rescomments.data[0].comments[1].comment);
    return FutureBuilder(
      future:GetData().getSingleServiceData(widget.id),
      builder: (context, snapshot){
        print("builder called");
        if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(body: Center(child:CircularProgressIndicator() ));
            
          }else if ((snapshot.hasData && snapshot.data != null)){
             Map data = snapshot.data as Map;
            try{
              return Scaffold(
      backgroundColor: Color(0xffCAD3D3),
      body: SafeArea(
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
                            child: Center(
                              child: Text(
                                data["name"] ?? "Unknown",
                                // widget.idpasses,
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
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit:BoxFit.cover ,
                                      image: NetworkImage(data["image"] ?? "Unknown"),
                    ),
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
            Text(rescomments.data.length.toString()),
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
                        const Text("Status",
                            style:
                                TextStyle(fontFamily: "Roboto", fontSize: 20)),
                        const SizedBox(
                          height: 10,
                        ),
                        // Text(widget.idpasses),
                        Text(data["name"] ?? "Unknown",
                          // widget.idpasses,
                            style: const TextStyle(
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
                      children: [
                        Text("Dine",
                            style:
                                TextStyle(fontFamily: "Roboto", fontSize: 20)),
                        SizedBox(
                          height: 10,
                        ),
                        Text(rescomments.data.length.toString(),
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
              color: Colors.blueAccent,
            ),
            const Gap(10),
            // comment section whole container
            SizedBox(
              height: 400,
              child: ListView.builder(
                  itemCount: 1,
                  // rescomments.data[0].comments.length,
                  shrinkWrap: true,
                  // scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext, int) => Text(data["name"] ?? "Unknown"),
                  // commentSection(
                  //       indexvalue: int,
                  //       // resname: widget.idpasses,
                  //       resname: service.data[int].name
                  //     )
                      ),
            )
          ], 
        ),
      ),
    );
            }catch (e) {
        return Text("Error: $e");
      } 

          }
          else {
            return Text('Empty data');}
        
      });
    
    
  }
}

class commentSection extends StatelessWidget {
  int indexvalue; // 1,2,3,4,5,6,7,8,9
  String resname;

  commentSection({
    Key? key,
    required this.indexvalue,
    required this.resname,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    resname = resname.toString();
    List<dynamic> comm;
    var rescomments = Provider.of<rescommentsProvider>(context, listen: false);
    var user = Provider.of<UserProvider>(context, listen: false);
    // user.data[0].name[1].toString();
    // var comn = checkuserid(indexvalue,context);
    // print("comn $comn");
    // user.userProv(indexvalue);
    print("----------------------------------");
    print(user.data.length);
    // print(user.data[0].name);
    // print(rescomments.data);
    // print("rescomments");
    return FutureBuilder(
        future: checkuserid(indexvalue, context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasData) {
            return Container(
              height: 200,
              color: Colors.white,
              child: Column(children: [
                Container(
                    height: 60,
                    // color: Colors.white,
                    child: Row(
                      children: [
                        //Column1 Row1
                        Expanded(
                          flex: 30,
                          child: Container(
                            child: Column(children: [
                              CircleAvatar(
                                  radius: 22,
                                  backgroundImage:
                                      NetworkImage(user.data[0].dp.toString())),
                              // Gap(2),
                              Text(
                                  // 'Sandeep Raju',
                                  user.data[0].username.toString(),
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.all(3),
                                      child: const Icon(
                                        FontAwesomeIcons.circleArrowUp,
                                      ),
                                    ),
                                    const Text(
                                      "Uplift",
                                      style: TextStyle(fontSize: 8),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        margin: const EdgeInsets.all(3),
                                        child: const Icon(
                                            FontAwesomeIcons.circleArrowDown)),
                                    const Text("Downlift",
                                        style: TextStyle(fontSize: 8)),
                                  ],
                                ),
                              ],
                            )))
                      ],
                    )),
                // column 2
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.all(10),
                      // color: Colors.indigo,
                      // String comm = rescomments.data[name][indexvalue][["comment"];
                      child:
                          // Text("lopam zopam jhfuhrh iiejije oiejrijre ojrfoirjef oirjfffffffr orjow reoj  o;rj fwrfiwre flerf fwruhfw ier")

                          Text(
                        rescomments.data[0].comments[indexvalue].comment,
                        style: TextStyle(color: Colors.black54),
                      )),
                ),
                // comm = rescomments.data[indexvalue].name["comments"])

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
            );
          } else {
            return const Text('Empty data');
          }
        });
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

Future<bool> checkuserid(indexvalue, context) async {
  var rescomments = Provider.of<rescommentsProvider>(context, listen: false);
  var user = Provider.of<UserProvider>(context, listen: false);
  int id = await rescomments.data[0].comments[indexvalue].userId;
  await user.userProv(id);
  print("xnxnxnxnxnxnxnxnxnxnx");
  print(id);
  // var comname = user.data[0].name;
  return true;
}


// Future<bool> GetRestaurantData(id, context) async {
//   var service = Provider.of<SingleServiceProvider>(context, listen: false);

//   service.serviceProv(id);
//   // var comname = user.data[0].name;
//   return true;
// }
