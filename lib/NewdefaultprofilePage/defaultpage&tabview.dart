// // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_new, unused_element, depend_on_referenced_packages

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/Askcommunity%20Section/Askthecommunity.dart';
import 'package:sssv1/HousingServices/overview.dart';
import 'package:sssv1/NewdefaultprofilePage/Additionalinfo.dart';
import 'package:sssv1/NewdefaultprofilePage/operating_hours_display.dart';
import 'package:sssv1/Reviews%20Section/new_showcomments.dart';
import 'package:sssv1/providers/askcommunity_provider.dart';
import 'package:sssv1/providers/business_profile_provider.dart';
import 'package:sssv1/providers/comments_provider.dart';
import 'package:sssv1/providers/service_provider.dart';
import 'package:sssv1/screens/mapscreen.dart';
import 'package:sssv1/utils/constants.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:sssv1/widgets/amenities.dart';
import 'package:autoscale_tabbarview/autoscale_tabbarview.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../Reviews Section/show_fewcomments.dart';
import '../providers/comments_provider_new.dart';

// import '../widgets/review_rating.dart';

// class DefaultProfilePage extends StatefulWidget {
//   const DefaultProfilePage({super.key, required this.uid});

//   final String uid; //00000000000000
//   final String keyy = "business_uid";

//   @override
//   State<DefaultProfilePage> createState() => _DefaultProfilePageState();
// }

// class _DefaultProfilePageState extends State<DefaultProfilePage>
//     with TickerProviderStateMixin {
//   // late List<GlobalKey> _keys;
//   late ScrollController _scrollController;

//   late TabController _tabController;

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 5, vsync: this);
//     _scrollController = ScrollController();

//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       var data = Provider.of<BusinessProfileProvider>(context, listen: false);
//       data.businessProfileProvider(widget.keyy, widget.uid);
//       var dataAsk = Provider.of<AskCommunityProvider>(context, listen: false)
//           .fetchAskCommunityData(widget.uid);
//     });

//     // Future.delayed(Duration(seconds: 2), () {
//     //   var dataAsk = Provider.of<AskCommunityProvider>(context, listen: false);
//     //   dataAsk.fetchAskCommunityData(widget.uid);
//     // });
//     // var data = Provider.of<BusinessProfileProvider>(context, listen: false).businessProfileProvider(widget.keyy, widget.uid);
//     // var dataAsk = Provider.of<AskCommunityProvider>(context, listen: false).fetchAskCommunityData(widget.uid);
//     var datacomments =
//         Provider.of<CommentSectionProvider>(context, listen: false)
//             .commentSectionProvider(widget.uid);
//     var servicesData = Provider.of<ServicesProvider>(context, listen: false)
//         .getMongoBusinessData(widget.uid);

//     // var datacomments =
//     //     Provider.of<CommentSectionProvider>(context, listen: false);
//     // datacomments.commentSectionProvider(widget.uid);

//     // var servicesData = Provider.of<ServicesProvider>(context, listen: false)
//     //     .getMongoBusinessData(widget.uid);

//     _tabController.addListener(() {
//       if (_tabController.indexIsChanging) {
//         if (_tabController.index == 0) {
//           _scrollController.animateTo(1 * 20,
//               duration: Duration(seconds: 1), curve: Curves.ease);
//         } else if (_tabController.index == 1) {
//           _scrollController.animateTo(2 * 40,
//               duration: Duration(seconds: 1), curve: Curves.ease);
//         } else if (_tabController.index == 2) {
//           _scrollController.animateTo(
//             3 * 250,
//             duration: Duration(seconds: 1),
//             curve: Curves.ease,
//           );
//         } else if (_tabController.index == 3) {
//           _scrollController.animateTo(4 * 212,
//               duration: Duration(seconds: 1), curve: Curves.ease);
//         } else if (_tabController.index == 4) {
//           _scrollController.animateTo(5 * 280,
//               duration: Duration(seconds: 1), curve: Curves.ease);
//         } else if (_tabController.indexIsChanging) {
//           _tabController.animateTo(0);
//         }
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     var data = Provider.of<BusinessProfileProvider>(context);

//     // TabController _tabController = TabController(length: 5, vsync: this);

//     return Scaffold(
//       // backgroundColor: Colors.grey,
//       body: data.isLoading
//           ? Center(
//               child: CircularProgressIndicator(
//               color: tgDarkPrimaryColor,
//             ))
//           : CustomScrollView(
//               controller: _scrollController,
//               slivers: <Widget>[
//                 SliverAppBar(
//                   backgroundColor: tgPrimaryColor,
//                   expandedHeight: 200.0,
//                   floating: true,
//                   pinned: true,
//                   leading: IconButton(
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       },
//                       icon: Icon(
//                         LineAwesomeIcons.angle_left,
//                         color: tgPrimaryText,
//                         size: 19,
//                       )),
//                   actions: [
//                     Row(
//                       children: [
//                         RatingBar.builder(
//                           initialRating:
//                               Provider.of<CommentSectionProvider>(context)
//                                   .averageRating,
//                           minRating: 1,
//                           direction: Axis.horizontal,
//                           allowHalfRating: true,
//                           itemCount: 5,
//                           itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
//                           itemSize: 12,
//                           itemBuilder: (context, _) => Icon(
//                             Icons.star,
//                             color: Colors.amber[700],
//                             size: 20,
//                           ),
//                           onRatingUpdate: (rating) {
//                             // print(rating);
//                           },
//                         ),
//                         SizedBox(width: 2),
//                         Text(
//                           Provider.of<CommentSectionProvider>(context)
//                               .averageRating
//                               .toStringAsFixed(1),
//                           style: TextStyle(color: Colors.white, fontSize: 14),
//                         )
//                       ],
//                     ),
//                     Divider(
//                       color: Colors.grey[200],
//                       thickness: 5,
//                     ),
//                   ],
//                   flexibleSpace: FlexibleSpaceBar(
//                     title: Padding(
//                       padding: const EdgeInsets.only(right: 2),
//                       child: data.isLoading
//                           ? Center(
//                               child: Text(""),
//                             )
//                           : GestureDetector(
//                               onTap: () {
//                                 print(data.businessProfileData!.businessUid);
//                                 showSnackBar(context,
//                                     data.businessProfileData!.businessUid);
//                               },
//                               child: Text(
//                                 // "Hub Restaurant",
//                                 // data.businessProfileData!.businessName.toString(),
//                                 // Replace this line:
//                                 // data.businessProfileData!.businessName.toString(),

//                                 // With this line:
//                                 data.businessProfileData?.businessName
//                                         .toString() ??
//                                     'Default Name',

//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 17),
//                               ),
//                             ),
//                     ),
//                     background:
//                         (data.businessProfileData?.profileImageUrl != null &&
//                                 data.businessProfileData?.profileImageUrl
//                                     .isNotEmpty)
//                             ? Image.network(
//                                 data.businessProfileData?.profileImageUrl,
//                                 fit: BoxFit.cover,
//                               )
//                             : Image.network(
//                                 "https://via.placeholder.com/150",
//                                 // defaultNetworkImage,
//                                 fit: BoxFit.cover,
//                               ),
//                   ),
//                 ),

//                 SliverToBoxAdapter(
//                   child: AdditionalInfoPage(),
//                 ),
//                 SliverPersistentHeader(
//                   delegate: _SliverAppBarDelegate(
//                     TabBar(
//                       controller: _tabController,
//                       // onTap: (index) {
//                       //   _scrollController.animateTo(
//                       //       index * MediaQuery.of(context).size.height,
//                       //       duration: Duration(seconds: 1),
//                       //       curve: Curves.ease);
//                       // },
//                       isScrollable: true,
//                       labelColor: Colors.black87,
//                       unselectedLabelColor: secondaryColor20LightTheme,
//                       indicator: UnderlineTabIndicator(
//                           borderRadius: BorderRadius.all(Radius.circular(2)),
//                           borderSide: BorderSide(color: tgPrimaryColor)),
//                       tabs: [
//                         Tab(text: "Directions"),
//                         Tab(
//                           text: "Overview",
//                         ),
//                         Tab(text: "Amenities"),
//                         Tab(text: "Reviews"),
//                         Tab(
//                           text: "Ask Your Community",
//                         )
//                       ],
//                     ),
//                   ),
//                   pinned: true,
//                 ),
//                 SliverToBoxAdapter(
//                   child: AutoScaleTabBarView(
// //////////////////////// FYI : this above Autoscaletabbarview is a third party package ////////

//                     controller: _tabController,

//                     children: [
//                       MapScreenPage(
//                         businesses: data.businessProfileData != null
//                             ? [data.businessProfileData!]
//                             : [],
//                       ),
//                       if (data.businessProfileData != null &&
//                           data.businessProfileData!.subCategory ==
//                               "housingrent")
//                         Container(
//                           height: 7,
//                         ),
//                       if (data.businessProfileData == null ||
//                           data.businessProfileData!.subCategory !=
//                               "housingrent")
//                         Container(
//                           height: 7,
//                         ),
//                       Container(
//                         height: 7,
//                       ),
//                       Container(
//                         height: 7,
//                       ),
//                       Container(
//                         height: 7,
//                       ),
//                     ],
//                   ),
//                 ),
//                 SliverToBoxAdapter(
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 16),
//                     child: Container(
//                       // color: secondaryColor5LightTheme,
//                       color: Colors.white,
//                       // child: Text("commenting for now")
//                       child: OverviewPage(),
//                     ),
//                   ),
//                 ),
//                 SliverToBoxAdapter(
//                   child: Container(
//                     height: 300,
//                     // height: 250,
//                     // color: secondaryColor5LightTheme,
//                     color: Colors.white,
//                     child: AmenitiesGridView(),
//                   ),
//                 ),
//                 SliverToBoxAdapter(
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 16),
//                     child: Container(
//                       height: 600,
//                       // color: secondaryColor5LightTheme,
//                       color: Colors.white,
//                       child: NewShowRewviewPage(),
//                       // child: NewShowRewviewPageTest(),
//                     ),
//                   ),
//                 ),
//                 // Ask community
//                 SliverToBoxAdapter(
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 16),
//                     child: Container(
//                         height: 600,
//                         color: secondaryColor5LightTheme,
//                         child: AskForCommunityWidget(
//                           uid: '',
//                           Questionid: "",
//                         )),
//                   ),
//                 ),
//                 // SliverToBoxAdapter(
//                 //   child: Padding(
//                 //     padding: const EdgeInsets.symmetric(vertical: 16),
//                 //     child: Container(
//                 //         height: 600,
//                 //         color: secondaryColor5LightTheme,
//                 //         child: Container()),
//                 //   ),
//                 // ),
//               ],
//             ),
//     );
//   }
// }

// class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
//   _SliverAppBarDelegate(this._tabBar);

//   final TabBar _tabBar;

//   @override
//   double get maxExtent => _tabBar.preferredSize.height;

//   @override
//   double get minExtent => _tabBar.preferredSize.height;

//   @override
//   bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
//     return false;
//   }

//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return new Container(
//       color: Colors.white,
//       child: _tabBar,
//     );
//   }
// }

// // class _DefaultProfilePageState extends State<DefaultProfilePage>
// //     with TickerProviderStateMixin {
// //   late ScrollController _scrollController;
// //   late TabController _tabController;

// //   int _calculateSelectedIndex(double scrollPosition) {
// //     if (scrollPosition < 1 * 300) return 0; // Directions
// //     if (scrollPosition < 2 * 320) return 1; // Overview
// //     if (scrollPosition < 3 * 400) return 2; // Amenities
// //     if (scrollPosition < 4 * 4) return 3; // Reviews
// //     return 4; // Ask Your Community
// //   }

// //   @override
// //   void initState() {
// //     super.initState();
// //     _tabController = TabController(length: 5, vsync: this);
// //     _scrollController = ScrollController();

// //     _scrollController.addListener(() {
// //       int newIndex = _calculateSelectedIndex(_scrollController.position.pixels);
// //       if (_tabController.index != newIndex) {
// //         setState(() {
// //           _tabController.index = newIndex;
// //         });
// //       }
// //     });

// //     WidgetsBinding.instance.addPostFrameCallback((_) {
// //       var data = Provider.of<BusinessProfileProvider>(context, listen: false);
// //       data.businessProfileProvider(widget.keyy, widget.uid);
// //       var dataAsk = Provider.of<AskCommunityProvider>(context, listen: false)
// //           .fetchAskCommunityData(widget.uid);
// //     });

// //     var datacomments =
// //         Provider.of<CommentSectionProvider>(context, listen: false)
// //             .commentSectionProvider(widget.uid);
// //     var servicesData = Provider.of<ServicesProvider>(context, listen: false)
// //         .getMongoBusinessData(widget.uid);

// //     _tabController.addListener(() {
// //       if (_tabController.indexIsChanging) {
// //         switch (_tabController.index) {
// //           case 0:
// //             _scrollController.animateTo(1 * 20,
// //                 duration: Duration(seconds: 1), curve: Curves.ease);
// //             break;
// //           case 1:
// //             _scrollController.animateTo(2 * 90,
// //                 duration: Duration(seconds: 1), curve: Curves.ease);
// //             break;
// //           case 2:
// //             _scrollController.animateTo(3 * 250,
// //                 duration: Duration(seconds: 1), curve: Curves.ease);
// //             break;
// //           case 3:
// //             _scrollController.animateTo(4 * 212,
// //                 duration: Duration(seconds: 1), curve: Curves.ease);
// //             break;
// //           case 4:
// //             _scrollController.animateTo(5 * 280,
// //                 duration: Duration(seconds: 1), curve: Curves.ease);
// //             break;
// //           default:
// //             _tabController.animateTo(0);
// //         }
// //       }
// //     });
// //   }

// //   @override
// //   void dispose() {
// //     _scrollController.removeListener(() {});
// //     _scrollController.dispose();
// //     _tabController.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     var data = Provider.of<BusinessProfileProvider>(context);

// //     return Scaffold(
// //       body: data.isLoading
// //           ? Center(
// //               child: CircularProgressIndicator(
// //               color: tgDarkPrimaryColor,
// //             ))
// //           : CustomScrollView(
// //               controller: _scrollController,
// //               slivers: <Widget>[
// //                 SliverAppBar(
// //                   backgroundColor: tgPrimaryColor,
// //                   expandedHeight: 200.0,
// //                   floating: true,
// //                   pinned: true,
// //                   leading: IconButton(
// //                       onPressed: () {
// //                         Navigator.of(context).pop();
// //                       },
// //                       icon: Icon(
// //                         LineAwesomeIcons.angle_left,
// //                         color: tgPrimaryText,
// //                       )),
// //                   actions: [
// //                     Row(
// //                       children: [
// //                         RatingBar.builder(
// //                           initialRating:
// //                               Provider.of<CommentSectionProvider>(context)
// //                                   .averageRating,
// //                           minRating: 1,
// //                           direction: Axis.horizontal,
// //                           allowHalfRating: true,
// //                           itemCount: 5,
// //                           itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
// //                           itemSize: 12,
// //                           itemBuilder: (context, _) => Icon(
// //                             Icons.star,
// //                             color: Colors.amber[700],
// //                             size: 20,
// //                           ),
// //                           onRatingUpdate: (rating) {
// //                             // print(rating);
// //                           },
// //                         ),
// //                         SizedBox(width: 2),
// //                         Text(
// //                           Provider.of<CommentSectionProvider>(context)
// //                               .averageRating
// //                               .toStringAsFixed(1),
// //                           style: TextStyle(color: Colors.white, fontSize: 14),
// //                         )
// //                       ],
// //                     ),
// //                     Divider(
// //                       color: Colors.grey[200],
// //                       thickness: 5,
// //                     ),
// //                   ],
// //                   flexibleSpace: FlexibleSpaceBar(
// //                     title: Padding(
// //                       padding: const EdgeInsets.only(right: 2),
// //                       child: data.isLoading
// //                           ? Center(
// //                               child: Text(""),
// //                             )
// //                           : GestureDetector(
// //                               onTap: () {
// //                                 print(data.businessProfileData!.businessUid);
// //                                 showSnackBar(context,
// //                                     data.businessProfileData!.businessUid);
// //                               },
// //                               child: Text(
// //                                 data.businessProfileData?.businessName
// //                                         .toString() ??
// //                                     'Default Name',
// //                                 style: TextStyle(
// //                                     color: Colors.white, fontSize: 17),
// //                               ),
// //                             ),
// //                     ),
// //                     background:
// //                         (data.businessProfileData?.profileImageUrl != null &&
// //                                 data.businessProfileData?.profileImageUrl
// //                                     .isNotEmpty)
// //                             ? Image.network(
// //                                 data.businessProfileData?.profileImageUrl,
// //                                 fit: BoxFit.cover,
// //                               )
// //                             : Image.network(
// //                                 "https://via.placeholder.com/150",
// //                                 fit: BoxFit.cover,
// //                               ),
// //                   ),
// //                 ),
// //                 SliverToBoxAdapter(
// //                   child: AdditionalInfoPage(),
// //                 ),
// //                 SliverPersistentHeader(
// //                   delegate: _SliverAppBarDelegate(
// //                     TabBar(
// //                       controller: _tabController,
// //                       isScrollable: true,
// //                       labelColor: Colors.black87,
// //                       unselectedLabelColor: secondaryColor20LightTheme,
// //                       indicator: UnderlineTabIndicator(
// //                           borderRadius: BorderRadius.all(Radius.circular(2)),
// //                           borderSide: BorderSide(color: tgPrimaryColor)),
// //                       tabs: [
// //                         Tab(text: "Directions"),
// //                         Tab(text: "Overview"),
// //                         Tab(text: "Amenities"),
// //                         Tab(text: "Reviews"),
// //                         Tab(text: "Ask Your Community"),
// //                       ],
// //                     ),
// //                   ),
// //                   pinned: true,
// //                 ),
// //                 SliverToBoxAdapter(
// //                   child: AutoScaleTabBarView(
// //                     controller: _tabController,
// //                     children: [
// //                       MapScreenPage(
// //                         businesses: data.businessProfileData != null
// //                             ? [data.businessProfileData!]
// //                             : [],
// //                       ),
// //                       if (data.businessProfileData != null &&
// //                           data.businessProfileData!.subCategory ==
// //                               "housingrent")
// //                         Container(
// //                           height: 7,
// //                         ),
// //                       if (data.businessProfileData == null ||
// //                           data.businessProfileData!.subCategory !=
// //                               "housingrent")
// //                         Container(
// //                           height: 7,
// //                         ),
// //                       Container(
// //                         height: 7,
// //                       ),
// //                       Container(
// //                         height: 7,
// //                       ),
// //                       Container(
// //                         height: 7,
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //                 SliverToBoxAdapter(
// //                   child: Padding(
// //                     padding: const EdgeInsets.symmetric(vertical: 16),
// //                     child: Container(
// //                       color: Colors.white,
// //                       child: OverviewPage(),
// //                     ),
// //                   ),
// //                 ),
// //                 SliverToBoxAdapter(
// //                   child: Container(
// //                     color: Colors.white,
// //                     child: AmenitiesGridView(),
// //                   ),
// //                 ),
// //                 SliverToBoxAdapter(
// //                   child: Padding(
// //                     padding: const EdgeInsets.symmetric(vertical: 16),
// //                     child: Container(
// //                       height: 600,
// //                       color: secondaryColor5LightTheme,
// //                       child: NewShowRewviewPage(),
// //                     ),
// //                   ),
// //                 ),
// //                 SliverToBoxAdapter(
// //                   child: Padding(
// //                     padding: const EdgeInsets.symmetric(vertical: 16),
// //                     child: Container(
// //                         height: 600,
// //                         color: secondaryColor5LightTheme,
// //                         child: AskForCommunityWidget(
// //                           uid: '',
// //                           Questionid: "",
// //                         )),
// //                   ),
// //                 ),
// //                 SliverToBoxAdapter(
// //                   child: Padding(
// //                     padding: const EdgeInsets.symmetric(vertical: 16),
// //                     child: Container(
// //                         height: 600,
// //                         color: secondaryColor5LightTheme,
// //                         child: Container()),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //     );
// //   }
// // }

// // class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
// //   _SliverAppBarDelegate(this._tabBar);

// //   final TabBar _tabBar;

// //   @override
// //   double get maxExtent => _tabBar.preferredSize.height;

// //   @override
// //   double get minExtent => _tabBar.preferredSize.height;

// //   @override
// //   bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
// //     return false;
// //   }

// //   @override
// //   Widget build(
// //       BuildContext context, double shrinkOffset, bool overlapsContent) {
// //     return new Container(
// //       color: Colors.white,
// //       child: _tabBar,
// //     );
// //   }
// // }

class DefaultProfilePage extends StatefulWidget {
  const DefaultProfilePage({super.key, required this.uid});

  final String uid;
  final String keyy = "business_uid";

  @override
  State<DefaultProfilePage> createState() => _DefaultProfilePageState();
}

class _DefaultProfilePageState extends State<DefaultProfilePage>
    with TickerProviderStateMixin {
  late ScrollController _scrollController;
  late TabController _tabController;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    print(widget.uid);
    // String? userId = await getUserId();

    // if (userId != null) {
    //   // sendProfileVisit(userId, 200);
    //   sendProfileVisit(userId, widget.uid);
    // } else {
    //   print('User is not signed in.');
    // }
    sendProfileVisit(widget.uid);
    _tabController = TabController(length: 5, vsync: this);
    _scrollController = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      var data = Provider.of<BusinessProfileProvider>(context, listen: false);
      data.businessProfileProvider(widget.keyy, widget.uid);

      var dataAsk = Provider.of<AskCommunityProvider>(context, listen: false)
          .fetchAskCommunityData(widget.uid);

      // var datacomments =
      //     Provider.of<CommentSectionProvider>(context, listen: false)
      //         .commentSectionProvider(widget.uid);
      // var datacomments =
      // Provider.of<CommentSectionProviderNew>(context, listen: false)
      //     .getComments(widget.uid);

      var datacomments = Provider.of<CommentSectionProviderNew>(context, listen: false)
          // .getComments("FOORESmqqwlT1J3v");
          .getComments(widget.uid);
      var servicesData = Provider.of<ServicesProvider>(context, listen: false)
          .getMongoBusinessData(widget.uid);


    });

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        if (_tabController.index == 0) {
          _scrollController.animateTo(1 * 30,
              duration: Duration(seconds: 1), curve: Curves.ease);
        } else if (_tabController.index == 1) {
          _scrollController.animateTo(2 * 60,
              duration: Duration(seconds: 1), curve: Curves.ease);
        } else if (_tabController.index == 2) {
          _scrollController.animateTo(3 * 280,
              duration: Duration(seconds: 1), curve: Curves.ease);
        } else if (_tabController.index == 3) {
          _scrollController.animateTo(4 * 300,
              duration: Duration(seconds: 1), curve: Curves.ease);
        } else if (_tabController.index == 4) {
          _scrollController.animateTo(5 * 370,
              duration: Duration(seconds: 1), curve: Curves.ease);
        } else if (_tabController.indexIsChanging) {
          _tabController.animateTo(0);
        }
      }
    });
  }

  Future<void> sendProfileVisit( String businessId) async {
    String? userId = await getUserId();
    final String url = 'https://supernova1137.azurewebsites.net/provile_visit';

    // Constructing the request body
    Map<String, dynamic> requestBody = {
      'user_id': userId,
      'business_id': businessId,
    };

    try {
      // Sending the POST request
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',  // Set the content type to JSON
        },
        body: jsonEncode(requestBody),  // Encode the request body as JSON
      );

      if (response.statusCode == 201) {
        // Successfully sent the request
        print('Profile visit recorded successfully.');
      } else {
        // Handle other status codes here
        print('Failed to record profile visit or user already visited profile: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exceptions
      print('Error occurred: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<BusinessProfileProvider>(context);
    var servicesData = Provider.of<ServicesProvider>(context);

    return Scaffold(
      // backgroundColor: Colors.white,
      body: data.isLoading || servicesData.isLoading
          ? Center(
              child: CircularProgressIndicator(
              color: tgDarkPrimaryColor,
            ))
          : CustomScrollView(
              controller: _scrollController,
              slivers: <Widget>[
                // SliverAppBar(
                //   backgroundColor: tgPrimaryColor,
                //   expandedHeight: 200.0,
                //   floating: true,
                //   pinned: true,
                //   leading: IconButton(
                //       onPressed: () {
                //         Navigator.of(context).pop();
                //       },
                //       icon: Icon(
                //         LineAwesomeIcons.angle_left,
                //         // color: tgPrimaryText,
                //         color: tgPrimaryText,
                //         size: 19,
                //       )),
                //   actions: [
                //     Row(
                //       children: [
                //         RatingBar.builder(
                //           initialRating:
                //               Provider.of<CommentSectionProvider>(context)
                //                   .averageRating,
                //           minRating: 1,
                //           direction: Axis.horizontal,
                //           allowHalfRating: true,
                //           itemCount: 5,
                //           itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                //           itemSize: 12,
                //           itemBuilder: (context, _) => Icon(
                //             Icons.star,
                //             color: Colors.amber[700],
                //             size: 20,
                //           ),
                //           onRatingUpdate: (rating) {},
                //         ),
                //         SizedBox(width: 2),
                //         Text(
                //           Provider.of<CommentSectionProvider>(context)
                //               .averageRating
                //               .toStringAsFixed(1),
                //           style: TextStyle(color: Colors.white, fontSize: 14),
                //         ),
                //         Icon(
                //           Icons.thumb_up_rounded,
                //           color: Colors.amber[700],
                //           size: 20,
                //         ),
                //       ],
                //     ),
                //     Divider(
                //       color: Colors.grey[200],
                //       thickness: 5,
                //     ),
                //   ],
                //   // flexibleSpace: FlexibleSpaceBar(
                //   //   title: Padding(
                //   //     padding: const EdgeInsets.only(right: 2),
                //   //     child: data.isLoading
                //   //         ? Center(child: Text(""))
                //   //         : GestureDetector(
                //   //             onTap: () {
                //   //               print(data.businessProfileData!.businessUid);
                //   //               showSnackBar(context,
                //   //                   data.businessProfileData!.businessUid);
                //   //             },
                //   //             child: Text(
                //   //               data.businessProfileData?.businessName
                //   //                       ?.toString() ??
                //   //                   'Default Name',
                //   //               style: TextStyle(
                //   //                   color: Colors.white, fontSize: 17),
                //   //             ),
                //   //           ),
                //   //   ),
                //   //   background:
                //   //       (data.businessProfileData?.profileImageUrl != null &&
                //   //               data.businessProfileData?.profileImageUrl
                //   //                   .isNotEmpty)
                //   //           ? Image.network(
                //   //               data.businessProfileData?.profileImageUrl,
                //   //               fit: BoxFit.cover,
                //   //             )
                //   //           : Image.network(
                //   //               "https://via.placeholder.com/150",
                //   //               fit: BoxFit.cover,
                //   //             ),
                //   // ),
                //   flexibleSpace: FlexibleSpaceBar(
                //     title: Padding(
                //       padding: const EdgeInsets.only(right: 2),
                //       child: data.isLoading
                //           ? Center(child: Text(""))
                //           : GestureDetector(
                //         onTap: () {
                //           print(data.businessProfileData!.businessUid);
                //           showSnackBar(context,
                //               data.businessProfileData!.businessUid);
                //         },
                //         child: Text(
                //           data.businessProfileData?.businessName
                //               ?.toString() ??
                //               'Default Name',
                //           style: TextStyle(
                //             color: Colors.white,
                //             fontSize: 17,
                //             fontWeight: FontWeight.bold, // Added for better visibility
                //           ),
                //         ),
                //       ),
                //     ),
                //     background: Stack(
                //       fit: StackFit.expand,
                //       children: [
                //         (data.businessProfileData?.profileImageUrl != null &&
                //             data.businessProfileData?.profileImageUrl
                //                 .isNotEmpty)
                //             ? Image.network(
                //           data.businessProfileData?.profileImageUrl,
                //           fit: BoxFit.cover,
                //         )
                //             : Image.network(
                //           "https://via.placeholder.com/150",
                //           fit: BoxFit.cover,
                //         ),
                //         Positioned(
                //           left: 0,
                //           right: 0,
                //           bottom: 0,
                //           child: Container(
                //             height: 60, // Adjust this value to control the height of the overlay
                //             decoration: BoxDecoration(
                //               gradient: LinearGradient(
                //                 begin: Alignment.bottomCenter,
                //                 end: Alignment.topCenter,
                //                 colors: [
                //                   Colors.black.withOpacity(0.7),
                //                   Colors.transparent,
                //                 ],
                //               ),
                //             ),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                SliverAppBar(
                  backgroundColor: tgPrimaryColor,
                  expandedHeight: 200.0,
                  floating: true,
                  pinned: true,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      LineAwesomeIcons.angle_left,
                      color: tgPrimaryText,
                      size: 24,
                    ),
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Row(
                        children: [
                          RatingBar.builder(
                            initialRating: Provider.of<CommentSectionProvider>(context).averageRating,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                            itemSize: 16,
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber[700],
                            ),
                            onRatingUpdate: (rating) {},
                          ),
                          SizedBox(width: 4),
                          Text(
                            Provider.of<CommentSectionProvider>(context).averageRating.toStringAsFixed(1),
                            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 12),
                          LikeButton(
                            size: 24,
                            circleColor: CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
                            bubblesColor: BubblesColor(
                              dotPrimaryColor: Color(0xff33b5e5),
                              dotSecondaryColor: Color(0xff0099cc),
                            ),
                            likeBuilder: (bool isLiked) {
                              print(isLiked);
                              return Icon(
                                Icons.favorite,
                                // color: isLiked ? Colors.amber[700] : Colors.white,
                                color: isLiked ? Colors.teal : Colors.white,
                                size: 34,
                              );
                            },
                            // likeCount: 0, // You can set this dynamically if you're tracking likes
                            // countBuilder: (int? count, bool isLiked, String text) {
                            //   return Text(
                            //     text,
                            //     style: TextStyle(color: Colors.white, fontSize: 14),
                            //   );
                            // },
                          ),
                        ],
                      ),
                    ),
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                    title: Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: data.isLoading
                          ? Center(child: CircularProgressIndicator(color: Colors.white))
                          : GestureDetector(
                        onTap: () {
                          print(data.businessProfileData!.businessUid);
                          showSnackBar(context, data.businessProfileData!.businessUid);
                        },
                        child: Text(
                          data.businessProfileData?.businessName?.toString() ?? 'Default Name',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            // fontWeight: FontWeight.bold,
                            // fontStyle: FontStyle.italic,
                            shadows: [
                              Shadow(
                                blurRadius: 3.0,
                                color: Colors.black.withOpacity(0.5),
                                offset: Offset(1.0, 1.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    background: Stack(
                      fit: StackFit.expand,
                      children: [
                        (data.businessProfileData?.profileImageUrl != null &&
                            data.businessProfileData?.profileImageUrl.isNotEmpty)
                            ? Image.network(
                          data.businessProfileData?.profileImageUrl,
                          fit: BoxFit.cover,
                        )
                            : Image.network(
                          "https://via.placeholder.com/150",
                          fit: BoxFit.cover,
                        ),
                        Positioned.fill(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.black.withOpacity(0.3),
                                  Colors.black.withOpacity(0.7),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // Positioned(
                        //   height: 10,
                        //   bottom: 40,
                        //   right: 20,
                        //   // left: 0,
                        //   child: LikeButton(
                        //     size: 24,
                        //     circleColor: CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
                        //     bubblesColor: BubblesColor(
                        //       dotPrimaryColor: Color(0xff33b5e5),
                        //       dotSecondaryColor: Color(0xff0099cc),
                        //     ),
                        //     likeBuilder: (bool isLiked) {
                        //       return Icon(
                        //         Icons.favorite,
                        //         // color: isLiked ? Colors.amber[700] : Colors.white,
                        //         color: isLiked ? Colors.teal : Colors.white,
                        //         size: 34,
                        //       );
                        //     },
                        //     // likeCount: 0, // You can set this dynamically if you're tracking likes
                        //     // countBuilder: (int? count, bool isLiked, String text) {
                        //     //   return Text(
                        //     //     text,
                        //     //     style: TextStyle(color: Colors.white, fontSize: 14),
                        //     //   );
                        //     // },
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: AdditionalInfoPage(),
                ),
                SliverPersistentHeader(
                  delegate: _SliverAppBarDelegate(
                    TabBar(
                      controller: _tabController,
                      isScrollable: true,
                      labelColor: Colors.black87,
                      unselectedLabelColor: secondaryColor20LightTheme,
                      indicator: UnderlineTabIndicator(
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                          borderSide: BorderSide(color: tgPrimaryColor)),
                      tabs: [
                        Tab(text: "Directions"),
                        Tab(text: "Overview"),
                        Tab(text: "Amenities"),
                        Tab(text: "Reviews"),
                        Tab(text: "Ask Your Community"),
                      ],
                    ),
                  ),
                  pinned: true,
                ),
                SliverToBoxAdapter(
                  child: AutoScaleTabBarView(
                    controller: _tabController,
                    children: [
                      MapScreenPage(
                        businesses: data.businessProfileData != null
                            ? [data.businessProfileData!]
                            : [],
                      ),
                      if (data.businessProfileData != null &&
                          data.businessProfileData!.subCategory ==
                              "housingrent")
                        Container(height: 7),
                      if (data.businessProfileData == null ||
                          data.businessProfileData!.subCategory !=
                              "housingrent")
                        Container(height: 7),
                      Container(height: 7),
                      Container(height: 7),
                      Container(height: 7),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Container(
                      color: Colors.white70,
                      child: OverviewPage(),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    color: Colors.white70,
                    child: AmenitiesGridView(),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Container(
                      height: 600,
                      // child: NewShowReviewPageTest(),
                      // child: NewShowRewviewPage(),
                      child: FewReviews(),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0),
                    child: Container(
                        height: 700,
                        color: Colors.white70,
                        child: AskForCommunityWidget(
                          uid: '',
                          Questionid: "",
                        )),
                  ),
                ),
              ],
            ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      color: Colors.white,
      child: _tabBar,
    );
  }
}


