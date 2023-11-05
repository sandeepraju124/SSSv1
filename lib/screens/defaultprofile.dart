// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, prefer_const_constructors_in_immutables

// import 'package:flutter/Material.dart';
// // import 'package:line_icons/line_icon.dart';
// import 'package:sssv1/HousingServices/overview.dart';
// import 'package:sssv1/screens/postcomment.dart';
// import 'package:sssv1/utils/navigator.dart';
// import 'package:sssv1/widgets/amenities.dart';
// import 'package:sssv1/widgets/showcomment.dart';
// import 'package:sssv1/providers/askcommunity_provider.dart';
// import 'package:sssv1/providers/business_profile_provider.dart';
// import 'package:sssv1/providers/comments_provider.dart';
// import 'package:sssv1/Askcommunitypages/Askthecommunity.dart';
// import 'package:sssv1/screens/mapscreen.dart';
// import 'package:provider/provider.dart';

// import 'package:sssv1/utils/constants.dart';
// import 'package:sssv1/widgets/review_rating.dart';
// import 'package:sssv1/widgets/staggered_grid.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';

// class DefaultProfile extends StatefulWidget {
//   String uid;
//   DefaultProfile({super.key, required this.uid});

//   @override
//   _DefaultProfileState createState() => _DefaultProfileState();
// }

// class _DefaultProfileState extends State<DefaultProfile>
//     with TickerProviderStateMixin {
//   void _showModalbottomSheet(BuildContext context) {
//     showModalBottomSheet(
//         context: context,
//         isScrollControlled: true,
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(20),
//           topRight: Radius.circular(20),
//         )),
//         // barrierColor: tgPrimaryColor,
//         builder: (context) => DraggableScrollableSheet(
//             expand: false,
//             initialChildSize: 0.5,
//             minChildSize: 0,
//             builder: (context, scrollController) => SingleChildScrollView(
//                   controller: scrollController,
//                   child: CommentPostPage(uid: widget.uid),
//                 )));
//   }

//   @override
//   void initState() {
//     // print(widget.uid);
//     super.initState();
//     var data = Provider.of<BusinessProfileProvider>(context, listen: false);
//     data.businessProfileProvider(widget.uid);
//     var dataAsk = Provider.of<AskCommunityProvider>(context, listen: false);
//     dataAsk.fetchAskCommunityData(widget.uid);
//     var datacomments =
//         Provider.of<CommentSectionProvider>(context, listen: false);
//     datacomments.commentSectionProvider(widget.uid);
//     print(widget.uid);
//   }

//   @override
//   Widget build(BuildContext context) {
//     // var dataAsk = Provider.of<AskCommunityProvider>(context);
//     var data = Provider.of<BusinessProfileProvider>(context);
//     var datacomments = Provider.of<CommentSectionProvider>(context);
//     print("build comment comm");
//     // var datacomm = Provider.of<CommentSectionProvider>(context);
//     // Map<int, bool> showRemainingAnswers = {};
//     // final _commentcontroller = TextEditingController();
//     TabController _tabController = TabController(length: 5, vsync: this);

//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10.0),
//           side: BorderSide(color: Colors.white),
//         ),
//         onPressed: () {
//           // _showModalbottomSheet(context);
//         },
//         backgroundColor: tgPrimaryColor,
//         child: Icon(
//           Icons.add,
//           color: tgPrimaryText,
//         ),
//       ),
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: tgPrimaryColor,
//         title: data.isLoading
//             ? Center(
//                 child: Text(""),
//               )
//             : Text(
//                 data.businessProfileData!.businessName.toString(),
//                 style:
//                     TextStyle(color: Colors.white, fontWeight: FontWeight.w100),
//               ),
//         leading: IconButton(
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//           icon: Icon(Icons.arrow_back),
//           color: Colors.black54,
//         ),
//         shape: Border(bottom: BorderSide(color: tgDarkPrimaryColor)),
//       ),
//       body: data.isLoading
//           ? Center(
//               child: Image.asset("images/loading.gif"),
//             )
//           :
//           // data.isLoading  ? Center(child: CircularProgressIndicator()) :
//           ListView(
//               // shrinkWrap: true,
//               //     scrollDirection: Axis.vertical,
//               //     physics: const ScrollPhysics(),
//               children: [
//                 Stack(
//                   clipBehavior: Clip.none,

//                   /////////// top image ///////////////

//                   children: [
//                     Container(
//                       color: Colors.grey,
//                       height: 150,
//                       width: double.infinity,
//                       child: Image.network(
//                         // data!['imagenext'],
//                         "https://th.bing.com/th/id/OIP.9Go9irZlGjlgtkYpdlX03gAAAA?pid=ImgDet&rs=1",
//                         fit: BoxFit.cover,
//                       ),
//                     ),

//                     ///second image ////////////
//                     Positioned(
//                       left: -12,
//                       right: -12,
//                       bottom: -75,
//                       child: Container(
//                         decoration: BoxDecoration(
//                             border: Border.all(
//                               color: Colors.grey,
//                               width: 1.5,
//                             ),
//                             borderRadius: BorderRadius.circular(7),
//                             color: Colors.white),
//                         margin: EdgeInsets.only(left: 20, right: 20),
//                         // color: Colors.white,
//                         height: 110,
//                         width: double.infinity,

//                         child: Row(children: [
//                           Expanded(
//                             flex: 28,
//                             child: Container(
//                               decoration: BoxDecoration(
//                                   border: Border.all(
//                                     color: tgPrimaryColor,
//                                   ),
//                                   borderRadius: BorderRadius.circular(2)),
//                               margin: EdgeInsets.all(10),
//                               width: double.infinity,
//                               height: double.infinity,
//                               // color: Colors.lightBlue,
//                               child: Image.network(
//                                 data.businessProfileData!.profileImage,

//                                 // "https://www.discoverlosangeles.com/sites/default/files/images/2019-01/laxbw-prime-1715-hor-wide.jpg?width=1600&height=1200&fit=crop&quality=78&auto=webp",
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                           Expanded(
//                               flex: 45,
//                               child: SizedBox(
//                                 width: double.infinity,
//                                 height: double.infinity,
//                                 // color: Colors.deepPurple,
//                                 child: Column(children: [
//                                   Expanded(
//                                     child: Align(
//                                       alignment: Alignment.centerLeft,
//                                       child: Padding(
//                                         padding: const EdgeInsets.only(top: 18),
//                                         child: Text(
//                                             data.businessProfileData!
//                                                 .businessName
//                                                 .toString(),
//                                             style: TextStyle(
//                                                 fontSize: 16,
//                                                 fontWeight: FontWeight.w600)),
//                                       ),
//                                     ),
//                                   ),
//                                   Divider(
//                                     endIndent: 10,
//                                     color: Colors
//                                         .grey, // Optional - set the color of the divider
//                                     thickness:
//                                         1, // Optional - set the thickness of the divider
//                                   ),
//                                   Expanded(
//                                     child: Align(
//                                       alignment: Alignment.centerRight,
//                                       child: Padding(
//                                         padding: const EdgeInsets.only(
//                                             bottom: 10, right: 10),
//                                         child: Text(
//                                             "this is located on the bank od reaver with 2 bedrooms",
//                                             style:
//                                                 TextStyle(color: Colors.grey)),
//                                       ),
//                                     ),
//                                   ),
//                                 ]),
//                               )),
//                           Container(
//                             width: 1,
//                             height: 90, // Set the height of the vertical line
//                             color: Colors
//                                 .grey, // Set the color of the vertical line
//                           ),
//                           Expanded(
//                               flex: 27,
//                               child: Container(
//                                 padding: EdgeInsets.symmetric(vertical: 20),
//                                 width: double.infinity,
//                                 height: double.infinity,
//                                 // color: Colors.pink,
//                                 child: Column(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceEvenly,
//                                     children: [
//                                       Text("12,000 PM"),
//                                       Text("24000 Dpst"),
//                                       Text("20 sft")
//                                     ]),
//                               )),
//                         ]),

//                         // width: 50,
//                       ),
//                     ),
//                   ],
//                 ),

//                 //////// //////////////////////
//                 ///

//                 SizedBox(
//                   height: 82,
//                 ),

//                 Divider(
//                   color: Colors.blueGrey,
//                   thickness: .7,
//                 ),

//                 //////// services ///////////////
//                 ///
//                 ///////Icon BUTTONS //////////////////////

//                 Container(
//                   width: double.infinity,
//                   height: 100,
//                   // color: Colors.redAccent,
//                   color: Colors.white,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Expanded(
//                         child: Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Container(
//                                 height: 65,
//                                 decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     color: Colors.white,
//                                     border: Border.all(color: tgAccentColor)),
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: IconButton(
//                                     onPressed: () {},
//                                     icon: Icon(LineAwesomeIcons.comment),
//                                     iconSize: 26,
//                                     color: Colors.black54,
//                                   ),
//                                 ),
//                               ),
//                               Text(
//                                 "Ask Community",
//                                 style: TextStyle(fontSize: 12),
//                               )
//                             ]),
//                       ),
//                       Expanded(
//                         child: Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Container(
//                                 height: 65,
//                                 decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     color: Colors.white,
//                                     border: Border.all(color: tgAccentColor)),
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: IconButton(
//                                     onPressed: () {},
//                                     icon: Icon(LineAwesomeIcons.phone_volume),
//                                     iconSize: 26,
//                                     color: Colors.black54,
//                                   ),
//                                 ),
//                               ),
//                               Text(
//                                 "Call",
//                                 style: TextStyle(fontSize: 12),
//                               )
//                             ]),
//                       ),
//                       Expanded(
//                         child: Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Container(
//                                 height: 65,
//                                 decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     color: Colors.white,
//                                     border: Border.all(color: tgAccentColor)),
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: IconButton(
//                                     onPressed: () {},
//                                     icon: Icon(Icons.comment_bank_sharp),
//                                     iconSize: 26,
//                                     color: Colors.black54,
//                                   ),
//                                 ),
//                               ),
//                               Text(
//                                 "Add Review",
//                                 style: TextStyle(fontSize: 12),
//                               )
//                             ]),
//                       ),
//                       Expanded(
//                         child: GestureDetector(
//                           onTap: () {
//                             Navigators()
//                                 .navigatorPush(context, StaggeredGridq());
//                           },
//                           child: Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 Container(
//                                   height: 65,
//                                   decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       color: Colors.white,
//                                       border: Border.all(color: tgAccentColor)),
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: IconButton(
//                                       onPressed: () {},
//                                       icon: Icon(
//                                         LineAwesomeIcons.image,
//                                       ),
//                                       iconSize: 26,
//                                       color: Colors.black54,
//                                     ),
//                                   ),
//                                 ),
//                                 Text(
//                                   "Photo",
//                                   style: TextStyle(fontSize: 12),
//                                 )
//                               ]),
//                         ),
//                       ),
//                     ],

//                     // SizedBox(height: 10),
//                     // Text(
//                     //   'Add Review',
//                     //   style: TextStyle(fontSize: 12),
//                     // ),
//                   ),
//                 ),

//                 Divider(
//                   color: Colors.blueGrey,
//                   thickness: .7,
//                 ),

//                 ////////////// small description ////////////////////

//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(left: 11, top: 8),
//                       child: Text(
//                         'Know About them',
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.w600),
//                       ),
//                     ),
//                     Container(
//                         margin: EdgeInsets.only(left: 10, top: 1),
//                         height: 3, // Adjust the height of the line as needed
//                         width: 110, // Adjust the width of the line as needed
//                         color: tgPrimaryColor // Set the color of the line
//                         ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                         width: double.infinity,
//                         // height: 104,
//                         color: Colors.white,

//                         child: Text(
//                           data.businessProfileData!.businessDescription
//                               .toString(),
//                           style: TextStyle(color: secondaryColor40LightTheme),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),

//                 SizedBox(
//                   height: 8,
//                 ),
//                 Divider(
//                   color: Colors.blueGrey,
//                   thickness: .7,
//                 ),

//                 // use this for adding additional widgets for specific catogery

//                 if (data.businessProfileData!.subCategory == "housingrent")
//                   OverviewPage(),

//                 // AskForCommunityWidget(
//                 //   uid: widget.uid,
//                 // ),

//                 // Divider(
//                 //   color: Colors.blueGrey,
//                 //   thickness: .7,
//                 // ),
//                 SizedBox(
//                   height: 10,
//                 ),

//                 // TabBar(
//                 //     controller: _tabController,
//                 //     // labelColor: tgAccentColor,
//                 //     labelColor: secondaryColor60LightTheme,
//                 //     isScrollable: true,
//                 //     unselectedLabelColor: Colors.grey,
//                 //     indicator: UnderlineTabIndicator(
//                 //         borderRadius: BorderRadius.all(Radius.circular(2)),
//                 //         borderSide:
//                 //             BorderSide(color: secondaryColor60LightTheme)),
//                 //     tabs: [
//                 //       Tab(text: "Directions"),
//                 //       Tab(text: "Ask Community"),
//                 //       Tab(text: "Amenities"),
//                 //       Tab(
//                 //         text: "More Options",
//                 //       ),
//                 //       Tab(
//                 //         text: "yess sirr",
//                 //       )
//                 //     ]),

//                 // SizedBox(
//                 //   height: 5,
//                 // ),

//                 // SizedBox(
//                 //   // color: Colors.red,
//                 //   // height: 300,
//                 //   height: MediaQuery.of(context).size.height,
//                 //   // height: double.infinity,

//                 //   width: double.infinity,
//                 //   child: TabBarView(
//                 //     controller: _tabController,
//                 //     children: [
//                 //       MapScreenPage(),
//                 //       AskForCommunityWidget(
//                 //         uid: widget.uid,
//                 //       ),
//                 //       AmenitiesGridView(),
//                 //       MapScreenPage(),
//                 //       // AskForCommunityWidget(
//                 //       //   uid: widget.uid,
//                 //       // ),
//                 //     ],
//                 //   ),
//                 // ),
//                 CustomScrollView(
//                   slivers: <Widget>[
//                     SliverAppBar(
//                       // Your SliverAppBar properties here
//                       pinned: true,
//                       floating: true,
//                       snap: true,
//                     ),
//                     SliverList(
//                       delegate: SliverChildListDelegate([
//                         TabBar(
//                           controller: _tabController,
//                           labelColor: secondaryColor60LightTheme,
//                           isScrollable: true,
//                           unselectedLabelColor: Colors.grey,
//                           indicator: UnderlineTabIndicator(
//                             borderRadius: BorderRadius.all(Radius.circular(2)),
//                             borderSide:
//                                 BorderSide(color: secondaryColor60LightTheme),
//                           ),
//                           tabs: [
//                             Tab(text: "Directions"),
//                             Tab(text: "Ask Community"),
//                             Tab(text: "Amenities"),
//                             Tab(text: "More Options"),
//                             Tab(text: "yess sirr"),
//                           ],
//                         ),
//                         SliverToBoxAdapter(
//                           child: TabBarView(
//                             controller: _tabController,
//                             children: [
//                               MapScreenPage(),
//                               AskForCommunityWidget(uid: widget.uid),
//                               AmenitiesGridView(),
//                               MapScreenPage(),
//                             ],
//                           ),
//                         ),
//                       ]),
//                     ),
//                   ],
//                 ),

//                 // Divider(height: 2,color: tgDividerColor,),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 ReviewRating(),

//                 SizedBox(
//                   height: 20,
//                 ),

//                 GestureDetector(
//                   onTap: () {
//                     Navigators().navigatorPush(
//                         context,
//                         PostComment(
//                           businessUid: data.businessProfileData!.businessUid,
//                         ));
//                   },
//                   child: Container(
//                     alignment: Alignment.center,
//                     margin: EdgeInsets.symmetric(horizontal: 10),
//                     width: double.infinity,
//                     height: 40,
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         border: Border.all(color: Colors.grey)),
//                     child: Text("POST COMMENT"),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),

//                 GestureDetector(
//                   onTap: () {
//                     _showModalbottomSheet(context);
//                   },
//                   child: Container(
//                     alignment: Alignment.center,
//                     height: 60,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                         color: Colors.black54,
//                         borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(25),
//                             topRight: Radius.circular(25))),
//                     child: datacomments.isLoading
//                         ? Text("Comments ")
//                         : Text(
//                             "Comments ${datacomments.getCommentsData!.reviews.length}",
//                             style: TextStyle(color: Colors.white, fontSize: 16),
//                           ),
//                   ),
//                 )
//               ],
//             ),
//     );
//   }
// }
