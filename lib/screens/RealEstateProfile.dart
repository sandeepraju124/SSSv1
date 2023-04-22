// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'dart:convert';

import 'package:flutter/Material.dart';
import 'package:http/http.dart' as http;
import 'package:sssv1/comments/commentpost.dart';
// import 'package:sssv1/login/Showmodalcomment.dart';
import 'package:sssv1/network_calling/http.dart';
import 'package:sssv1/providers/user_provider.dart';
import 'package:sssv1/screens/RestaurantProfile.dart';
import 'package:sssv1/utils/constants.dart';
import 'package:sssv1/widgets/commentSection.dart';
import 'package:provider/provider.dart';

class RealEstateProfile extends StatefulWidget {
  RealEstateProfile({super.key, required this.id});

  String id; //63f11685190416d07f3687e7 //Elite Estates

  @override
  _RealEstateProfileState createState() => _RealEstateProfileState();
}

class _RealEstateProfileState extends State<RealEstateProfile> {
  Future<Map<String, dynamic>> _fetchData(id) async {
    String url = "https://revolution.azurewebsites.net/serviceid/$id";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  void _showModalbottomSheet(BuildContext context) {
    showBottomSheet(
        context: context,
        // isScrollControlled:true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        builder: (context) => SingleChildScrollView(
              child: CommentPost(),
            ));
  }

  @override
  Widget build(BuildContext context) {
    var userpro = Provider.of<UserProvider>(context, listen: false);
    final _commentcontroller = TextEditingController();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showModalbottomSheet(context);
        },
        backgroundColor: tgPrimaryColor,
        child: Icon(
          Icons.add,
          color: tgPrimaryText,
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: tgPrimaryColor,
        title: Text(
          "Real Estate",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.black54,
        ),
        shape: Border(bottom: BorderSide(color: tgDarkPrimaryColor)),
      ),
      body: Center(
        child: FutureBuilder<Map<String, dynamic>>(
          future: _fetchData(widget.id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              } else {
                final data = snapshot.data;
                return ListView(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,

                      /////////// top image ///////////////

                      children: [
                        Container(
                          color: Colors.grey,
                          height: 150,
                          width: double.infinity,
                          child: Image.network(
                            data!['imagenext'],
                            // "https://images.unsplash.com/photo-1495954380655-01609180eda3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
                            fit: BoxFit.cover,
                          ),
                        ),

                        ///second image ////////////
                        Positioned(
                          left: 0,
                          right: -12,
                          bottom: -75,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: tgPrimaryColor,
                                  width: 1.5,
                                ),
                                color: Colors.white),
                            margin: EdgeInsets.only(left: 20, right: 20),
                            // color: Colors.white,
                            height: 110,
                            width: double.infinity,
                            child: Row(children: [
                              Expanded(
                                flex: 28,
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                    color: tgPrimaryColor,
                                  )),
                                  margin: EdgeInsets.all(10),
                                  width: double.infinity,
                                  height: double.infinity,
                                  // color: Colors.lightBlue,
                                  child: Image.network(
                                    data['image'],
                                    // "https://images.unsplash.com/photo-1605276374104-dee2a0ed3cd6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                  flex: 45,
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: double.infinity,
                                    // color: Colors.deepPurple,
                                    child: Column(children: [
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 18),
                                            child: Text(data['name'],
                                                style: TextStyle(
                                                  fontSize: 20,
                                                )),
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        endIndent: 10,
                                        color: Colors
                                            .grey, // Optional - set the color of the divider
                                        thickness:
                                            1, // Optional - set the thickness of the divider
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10, right: 10),
                                            child: Text(
                                                "this is located on the bank od reaver with 2 bedrooms",
                                                style: TextStyle(
                                                    color: Colors.grey)),
                                          ),
                                        ),
                                      ),
                                    ]),
                                  )),
                              Container(
                                width: 1,
                                height:
                                    90, // Set the height of the vertical line
                                color: Colors
                                    .grey, // Set the color of the vertical line
                              ),
                              Expanded(
                                  flex: 27,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 20),
                                    width: double.infinity,
                                    height: double.infinity,
                                    // color: Colors.pink,
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text("12,000 PM"),
                                          Text("24000 Dpst"),
                                          Text("20 sft")
                                        ]),
                                  )),
                            ]),

                            // width: 50,
                          ),
                        ),
                      ],
                    ),

                    //////// //////////////////////
                    ///

                    SizedBox(
                      height: 82,
                    ),

                    Divider(
                      color: Colors.blueGrey,
                      thickness: .7,
                    ),

                    //////// services ///////////////
                    ///
                    ///////Icon BUTTONS //////////////////////

                    Container(
                      width: double.infinity,
                      height: 120,
                      color: Colors.white,
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 36, vertical: 12),
                                child: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.blueGrey[50],
                                      border:
                                          Border.all(color: tgPrimaryColor)),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.add_comment_outlined),
                                    iconSize: 36,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                              // SizedBox(height: 2),
                              Text(
                                'Add Review',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          ////// second iconbutton //////
                          Column(
                            children: [
                              Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 6)),
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.blueGrey[50],
                                    border: Border.all(color: tgPrimaryColor)),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.add_a_photo_outlined),
                                  iconSize: 36,
                                  color: Colors.black54,
                                ),
                              ),
                              SizedBox(
                                height: 11,
                              ),
                              Text(
                                'Add Photo',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),

                          ///// third icon button /////////

                          Column(
                            children: [
                              Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 58, vertical: 6)),
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.blueGrey[50],
                                    border: Border.all(color: tgPrimaryColor)),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.call),
                                  iconSize: 36,
                                  color: Colors.black54,
                                ),
                              ),
                              SizedBox(
                                height: 11,
                              ),
                              Text(
                                'Call',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),

                          ///// fourth iconbutton ////

                          Column(
                            children: [
                              Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 6)),
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.blueGrey[50],
                                    border: Border.all(color: tgPrimaryColor)),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.comment_bank_sharp),
                                  iconSize: 36,
                                  color: Colors.black54,
                                ),
                              ),
                              SizedBox(
                                height: 11,
                              ),
                              Text(
                                'Ask Community',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ],

                        // SizedBox(height: 10),
                        // Text(
                        //   'Add Review',
                        //   style: TextStyle(fontSize: 12),
                        // ),
                      ),
                    ),

                    // Divider(
                    //   color: Colors.blueGrey,
                    //   thickness: .7,
                    // ),

                    // SizedBox(
                    //   height: 8,
                    // ),
                    // Container(
                    //     width: double.infinity,
                    //     height: 120,
                    //     color: Colors.grey),
                    // SizedBox(
                    //   height: 8,
                    // ),
                    // // Container(
                    // //     width: double.infinity, height: 80, color: Colors.grey),
                    // ShowModelComment(),
                    // SizedBox(
                    //   height: 8,
                    // ),
                    // Text(userpro.data?.userid ?? "no data"),
                    // SizedBox(
                    //   height: 8,
                    // ),

                    // Padding(
                    //   padding:
                    //       EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                    //   child: FloatingActionButton(
                    //     onPressed: () {},
                    //     child: Icon(Icons.add),
                    //   ),
                    // ),

                    // ShowModelComment(),

                    ////////// comment posting section ////////////////////

                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 7),
                      width: double.infinity,
                      height: 60,
                      // color: Colors.white,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          border: Border.all(color: Colors.blue, width: 3)),
                      child: Row(children: [
                        Expanded(
                            flex: 76,
                            child: TextField(
                              controller: _commentcontroller,
                              decoration: InputDecoration(
                                hintText: 'Enter Your Review',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(16.0),
                              ),
                            )),
                        Expanded(
                            flex: 24,
                            child: Container(
                              padding: EdgeInsets.only(right: 10),
                              // color: Colors.blue,
                              child: ElevatedButton(
                                onPressed: () {
                                  String? userid = userpro.data?.userid;
                                  Map<String, String> CommentBody = {
                                    "name": data['name'],
                                    "serviceid": widget.id,
                                    "comment": _commentcontroller.text,
                                    "user_id": userid.toString()
                                  };
                                  setState(() {
                                    GetData().postData(
                                        "https://revolution.azurewebsites.net/addcomment",
                                        CommentBody);
                                    print(_commentcontroller.text);
                                  });
                                  // Code to run when the button is pressed
                                },
                                child: Text('Publish'),
                              ),
                            )),
                      ]),
                    ),

// --------------------------------------------------------
// ---------------------------comment section------------------------
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        height: 200,

                        //comment section

                        child: CommentSection(
                          id: widget.id,
                        ))
                    // Comment()

                    // Text("one"),
                    // Text("one"),
                  ],
                );
                // Column(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text("Name: ${data!['name']}"),
                //     Text("Category: ${data['category']}"),
                //     Text("Rating: ${data['rating']}"),
                //     Text("Reviews: ${data['reviews']}"),
                //     Text("Description: ${data['description']}"),
                //     Image.network(data['image']),
                //   ],
                // );
              }
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

// comment ui in case of miss

class Comment extends StatelessWidget {
  const Comment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: Column(children: [
        SizedBox(
            height: 60,
            // color: Colors.white,
            child: Row(
              children: [
                //Column1 Row1
                Expanded(
                  flex: 30,
                  child: Column(children: [
                    CircleAvatar(
                        radius: 22,
                        backgroundImage: AssetImage("images/modell.jpeg")
                        // NetworkImage(user.data[0].dp.toString())
                        ),
                    // Gap(2),
                    Text('Sandeep Raju',
                        // user.data[0].username.toString(),
                        style: TextStyle(fontSize: 12)),
                  ]),
                ),
                //Column1 Row2
                Expanded(
                    flex: 40,
                    child: Column(children: [
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.star_rate_rounded),
                          Icon(Icons.star_rate_rounded),
                          Icon(Icons.star_rate_rounded),
                          Icon(Icons.star_rate_rounded),
                          // Icon(Icons.star_rate_rounded),
                        ],
                      )),
                      Expanded(
                          child: Container(
                        color: Colors.purple,
                      ))
                    ])),
                // Column1 Row3
                Expanded(
                    flex: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.all(3),
                              child: const Icon(
                                Icons.swipe_up_rounded,
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
                                child: Icon(Icons.swipe_down_rounded)),
                            const Text("Downlift",
                                style: TextStyle(fontSize: 8)),
                          ],
                        ),
                      ],
                    ))
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
                "this is text",
                // rescomments.data[0].comments[indexvalue].comment,
                // data["name"] ?? "Unknown"
                // comments[widget.index].comment,
                style: TextStyle(color: Colors.black54),
              )),
        ),
        // comm = rescomments.data[indexvalue].name["comments"])

        // Column 3
        Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (BuildContext, int) => Text("skip")
                // images(),
                )),
      ]),
    );
  }
}
