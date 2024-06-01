// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// import 'package:sssv1/Askcommunity%20Section/Askthecommunity.dart';
// import 'package:sssv1/HousingServices/overview.dart';
// import 'package:sssv1/NewdefaultprofilePage/Additionalinfo.dart';
// import 'package:sssv1/Reviews%20Section/new_showcomments.dart';
// import 'package:sssv1/providers/askcommunity_provider.dart';
// import 'package:sssv1/providers/business_profile_provider.dart';
// import 'package:sssv1/providers/comments_provider.dart';
// import 'package:sssv1/screens/mapscreen.dart';
// import 'package:sssv1/utils/constants.dart';
// import 'package:sssv1/widgets/amenities.dart';
// import 'package:autoscale_tabbarview/autoscale_tabbarview.dart';

// class DefaultProfilePageTest extends StatefulWidget {
//   const DefaultProfilePageTest({super.key, required this.uid});

//   final String uid;

//   @override
//   State<DefaultProfilePageTest> createState() => _DefaultProfilePageTestState();
// }

// class _DefaultProfilePageTestState extends State<DefaultProfilePageTest>
//     with TickerProviderStateMixin {
//   late ScrollController _scrollController;
//   late TabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 5, vsync: this);
//     _scrollController = ScrollController();

//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       Provider.of<BusinessProfileProvider>(context, listen: false)
//           .businessProfileProvider('business_uid', widget.uid);
//       Provider.of<AskCommunityProvider>(context, listen: false)
//           .fetchAskCommunityData(widget.uid);
//       Provider.of<CommentSectionProvider>(context, listen: false)
//           .commentSectionProvider(widget.uid);
//     });
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     _scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var data = Provider.of<BusinessProfileProvider>(context);

//     return Scaffold(
//       body: data.isLoading
//           ? Center(child: CircularProgressIndicator(color: tgDarkPrimaryColor))
//           : CustomScrollView(
//               controller: _scrollController,
//               slivers: <Widget>[
//                 SliverAppBar(
//                   backgroundColor: tgPrimaryColor,
//                   expandedHeight: 200.0,
//                   floating: true,
//                   pinned: true,
//                   leading: IconButton(
//                     onPressed: () => Navigator.of(context).pop(),
//                     icon: Icon(LineAwesomeIcons.angle_left, color: tgPrimaryText),
//                   ),
//                   actions: [
//                     Row(
//                       children: [
//                         RatingBar.builder(
//                           initialRating: Provider.of<CommentSectionProvider>(context).averageRating,
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
//                           onRatingUpdate: (rating) {},
//                         ),
//                         SizedBox(width: 2),
//                         Text(
//                           Provider.of<CommentSectionProvider>(context)
//                               .averageRating
//                               .toStringAsFixed(1),
//                           style: TextStyle(color: Colors.white, fontSize: 14),
//                         ),
//                       ],
//                     ),
//                   ],
//                   flexibleSpace: FlexibleSpaceBar(
//                     title: Padding(
//                       padding: const EdgeInsets.only(right: 2),
//                       child: Text(
//                         data.businessProfileData?.businessName.toString() ?? 'Default Name',
//                         style: TextStyle(color: Colors.white, fontSize: 17),
//                       ),
//                     ),
//                     background: Image.network(
//                       data.businessProfileData?.profileImageUrl ??
//                           'https://upload.wikimedia.org/wikipedia/commons/4/45/MontreGousset001.jpg',
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 SliverToBoxAdapter(
//                   child: AdditionalInfoPage(),
//                 ),
//                 SliverPersistentHeader(
//                   delegate: _SliverAppBarDelegate(
//                     TabBar(
//                       controller: _tabController,
//                       isScrollable: true,
//                       labelColor: Colors.black87,
//                       unselectedLabelColor: secondaryColor20LightTheme,
//                       indicator: UnderlineTabIndicator(
//                           borderRadius: BorderRadius.all(Radius.circular(2)),
//                           borderSide: BorderSide(color: tgPrimaryColor)),
//                       tabs: [
//                         Tab(text: "Directions"),
//                         Tab(text: "Overview"),
//                         Tab(text: "Amenities"),
//                         Tab(text: "Reviews"),
//                         Tab(text: "Ask Your Community"),
//                       ],
//                     ),
//                   ),
//                   pinned: true,
//                 ),
//                 SliverToBoxAdapter(
//                   child: AutoScaleTabBarView(
//                     controller: _tabController,
//                     children: [
//                       MapScreenPage(),
//                       // OverviewPage(),
//                       Text("Overview"),
//                       AmenitiesGridView(),
//                       NewShowRewviewPage(),
//                       AskForCommunityWidget(
//                         uid: widget.uid,
//                         Questionid: "",
//                       ),
//                     ],
//                   ),
//                 ),
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
//   Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return Container(
//       color: Colors.white,
//       child: _tabBar,
//     );
//   }
// }
