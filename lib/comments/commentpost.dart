// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'dart:convert';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:sssv1/network_calling/http.dart';
// import 'package:sssv1/utils/constants.dart';

// import '../providers/user_provider.dart';
// import 'package:provider/provider.dart';
// import 'package:http/http.dart' as http;

// class CommentPost extends StatefulWidget {
//   const CommentPost({
//     super.key,
//     required this.id,
//   });

//   final String id;

//   @override
//   State<CommentPost> createState() => _CommentPostState();
// }

// class _CommentPostState extends State<CommentPost> {
//   Future<Map<String, dynamic>> _fetchData(id) async {
//     String url = "https://revolution.azurewebsites.net/serviceid/$id";
//     final response = await http.get(Uri.parse(url));
//     if (response.statusCode == 200) {
//       return jsonDecode(response.body);
//     } else {
//       throw Exception('Failed to fetch data');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     var userpro = Provider.of<UserProvider>(context, listen: false);
//     final _commentcontroller = TextEditingController();

//     return FutureBuilder<Map<String, dynamic>>(
//         future: _fetchData(widget.id),
//         builder: (BuildContext context, AsyncSnapshot snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             if (snapshot.hasError) {
//               return Text('Error: ${snapshot.error}');
//             } else {
//               final data = snapshot.data;
//               return Container(
//                 margin: EdgeInsets.symmetric(horizontal: 7),
//                 width: double.infinity,
//                 // height: 60,

//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12),
//                     color: Colors.white,
//                     border: Border.all(color: tgPrimaryColor, width: 3)),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       flex: 76,
//                       child: TextField(
//                         controller: _commentcontroller,
//                         decoration: InputDecoration(
//                           hintText: 'Enter your review',
//                           border: InputBorder.none,
//                           contentPadding: EdgeInsets.all(16.0),
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       flex: 24,
//                       child: Container(
//                         padding: EdgeInsets.only(right: 10),
//                         child: ElevatedButton(
//                             onPressed: () {
//                               String? userid = userpro.data?.userid;
//                               Map<String, String> commentBody = {
//                                 "name": data['name'],
//                                 // 'serviceid': widget.id,
//                                 "comment": _commentcontroller.text,
//                                 "user_id": userid.toString()
//                               };
//                               setState(() {
//                                 GetData().postData(
//                                     "https://revolution.azurewebsites.net/addcomment",
//                                     commentBody);
//                               });
//                               if (kDebugMode) {
//                                 print(_commentcontroller.text);
//                               }
//                             },
//                             child: Text(
//                               'Comment',
//                               style: TextStyle(color: tgPrimaryText),
//                             )),
//                       ),
//                     )
//                   ],
//                 ),
//               );
//             }
//           } else {
//             return CircularProgressIndicator(
//               color: tgPrimaryColor,
//             );
//           }
//         });
//   }
// }

// class Comment extends StatelessWidget {
//   const Comment({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 200,
//       color: Colors.white,
//       child: Column(children: [
//         SizedBox(
//             height: 60,
//             // color: Colors.white,
//             child: Row(
//               children: [
//                 //Column1 Row1
//                 Expanded(
//                   flex: 30,
//                   child: Column(children: [
//                     CircleAvatar(
//                         radius: 22,
//                         backgroundImage: AssetImage("images/modell.jpeg")
//                         // NetworkImage(user.data[0].dp.toString())
//                         ),
//                     // Gap(2),
//                     Text('Sandeep Raju',
//                         // user.data[0].username.toString(),
//                         style: TextStyle(fontSize: 12)),
//                   ]),
//                 ),
//                 //Column1 Row2
//                 Expanded(
//                     flex: 40,
//                     child: Column(children: [
//                       Expanded(
//                           child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: const [
//                           Icon(Icons.star_rate_rounded),
//                           Icon(Icons.star_rate_rounded),
//                           Icon(Icons.star_rate_rounded),
//                           Icon(Icons.star_rate_rounded),
//                           // Icon(Icons.star_rate_rounded),
//                         ],
//                       )),
//                       Expanded(
//                           child: Container(
//                         color: Colors.purple,
//                       ))
//                     ])),
//                 // Column1 Row3
//                 Expanded(
//                     flex: 30,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Container(
//                               margin: const EdgeInsets.all(3),
//                               child: const Icon(
//                                 Icons.swipe_up_rounded,
//                               ),
//                             ),
//                             const Text(
//                               "Uplift",
//                               style: TextStyle(fontSize: 8),
//                             ),
//                           ],
//                         ),
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Container(
//                                 margin: const EdgeInsets.all(3),
//                                 child: Icon(Icons.swipe_down_rounded)),
//                             const Text("Downlift",
//                                 style: TextStyle(fontSize: 8)),
//                           ],
//                         ),
//                       ],
//                     ))
//               ],
//             )),
//         // column 2
//         Expanded(
//           child: Container(
//               margin: const EdgeInsets.all(10),
//               // color: Colors.indigo,
//               // String comm = rescomments.data[name][indexvalue][["comment"];
//               child:
//                   // Text("lopam zopam jhfuhrh iiejije oiejrijre ojrfoirjef oirjfffffffr orjow reoj  o;rj fwrfiwre flerf fwruhfw ier")

//                   Text(
//                 "this is text",
//                 // rescomments.data[0].comments[indexvalue].comment,
//                 // data["name"] ?? "Unknown"
//                 // comments[widget.index].comment,
//                 style: TextStyle(color: Colors.black54),
//               )),
//         ),
//         // comm = rescomments.data[indexvalue].name["comments"])

//         // Column 3
//         Expanded(
//             child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: 5,
//                 itemBuilder: (BuildContext, int) => Text("skip")
//                 // images(),
//                 )),
//       ]),
//     );
//   }
// }

// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sssv1/network_calling/http.dart';
import 'package:sssv1/utils/constants.dart';

import '../providers/user_provider.dart';
import 'package:provider/provider.dart';

class CommentPostPage extends StatefulWidget {
  const CommentPostPage({super.key});

  @override
  State<CommentPostPage> createState() => _CommentPostPageState();
}

final _commentcontroller = TextEditingController();

class _CommentPostPageState extends State<CommentPostPage> {
  @override
  Widget build(BuildContext context) {
    // var userpro = Provider.of<UserProvider>(context, listen: false);

    //// here we've used the stack class to provide the TOP line of the Bottom sheet /////////////////

    return Stack(
    
        //////// this is for the line on top of Bottom sheet ////////////
        alignment: AlignmentDirectional.topCenter,
        clipBehavior: Clip.none,
        children: [
          Positioned(
              top: -15,
              child: Container(
                width: 60,
                height: 7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: tgLightPrimaryColor,
                ),
              )),
    
          ///// Text on top of COMMENT TEXTfield///////////////
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Column(
              children: [
                Text(
                  'Add Your Valuable Review Here',
                  style: TextStyle(fontSize: 23, color: tgPrimaryText),
                ),
                SizedBox(height: 30),
    
                //////////////// comment section starts here ////////////////
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 7),
                  width: double.infinity,
                  // height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    // color: Colors.white,
                    border: Border.all(color: tgPrimaryColor, width: 3),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 70,
                        child: TextField(
                          controller: _commentcontroller,
                          decoration: InputDecoration(
                            hintText: 'Enter your review',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(16.0),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 30,
                        child: Container(
                          padding: EdgeInsets.only(right: 10),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: tgPrimaryColor,
                                backgroundColor: secondaryColor10LightTheme,
                              ),
                              onPressed: () {
                                // String? userid = userpro.data?.userid;
                                Map<String, String> commentBody = {
                                  "name": 'sai ram',
                                  // 'serviceid': widget.id,
                                  "comment": _commentcontroller.text,
                                  // "user_id": userid.toString()
                                };
                                setState(() {
                                  Http().postData(
                                      "https://revolution.azurewebsites.net/addcomment",
                                      commentBody);
                                });
                                if (kDebugMode) {
                                  print(_commentcontroller.text);
                                }
                              },
                              child: Text(
                                'Comment',
                                style: TextStyle(color: tgPrimaryText),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(),
                SizedBox(
                  height: 700,
                  child: SingleChildScrollView(
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (BuildContext, int){
                        return Container(
                      // height: 100,
                      width: double.infinity,
                      margin: EdgeInsets.all(9),
                      // color: secondaryColor10LightTheme,
                      decoration: BoxDecoration(
                          color: secondaryColor10LightTheme,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Row(
                        
                        children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          height: 65,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(color: tgPrimaryColor)),
                          child: CircleAvatar(
                            
                            radius: 25,
                            backgroundImage: NetworkImage(
                              'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1985&q=80',
                            ),
                          ),
                        ),
                        
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 9, bottom: 9),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(20))
                              ),
                              margin: EdgeInsets.only(right: 10),
                              padding: EdgeInsets.all(12),
                          
                              alignment: Alignment.centerLeft,
                                              
                              // height: double.infinity,
                              // width: double.infinity,
                              
                              child: RichText(text: TextSpan(
                                children: [
                                  TextSpan(text: "sandeep raju  ", style: TextStyle(color: Colors.black)),
                                  TextSpan(text: "trust me this is the best restaurant i ever seen  really good staff and every one  ", style: TextStyle(color: Colors.grey))
                                ]
                              )),
                            ),
                          ),
                        ),
                      ]),
                    );
                    
                      }),
                  ),
                )
              ],
            ),
          ),
        ]);
  }
}
