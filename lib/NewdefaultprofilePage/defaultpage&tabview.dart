// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_new, unused_element

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/Askcommunitypages/Askthecommunity.dart';
import 'package:sssv1/HousingServices/overview.dart';
import 'package:sssv1/NewdefaultprofilePage/Additionalinfo.dart';
import 'package:sssv1/providers/askcommunity_provider.dart';
import 'package:sssv1/providers/business_profile_provider.dart';
import 'package:sssv1/providers/comments_provider.dart';
import 'package:sssv1/screens/mapscreen.dart';
import 'package:sssv1/utils/constants.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:sssv1/widgets/Askthecommunity.dart';
import 'package:sssv1/widgets/amenities.dart';
import 'package:autoscale_tabbarview/autoscale_tabbarview.dart';
// import 'package:sssv1/widgets/review_rating.dart';

// import '../widgets/review_rating.dart';

class DefaultProfilePage extends StatefulWidget {
  final String uid;
  const DefaultProfilePage({super.key, required this.uid});

  @override
  State<DefaultProfilePage> createState() => _DefaultProfilePageState();
}

class _DefaultProfilePageState extends State<DefaultProfilePage>
    with TickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var data = Provider.of<BusinessProfileProvider>(context, listen: false);
    data.businessProfileProvider(widget.uid);

    var dataAsk = Provider.of<AskCommunityProvider>(context, listen: false);
    dataAsk.askCommunityProvider(widget.uid);

    var datacomments =
        Provider.of<CommentSectionProvider>(context, listen: false);

    datacomments.commentSectionProvider(widget.uid);
    ScrollController _scrollController = ScrollController();
    TabController _tabController = TabController(length: 5, vsync: this);

    _scrollController.addListener(() {
      final tabPositions = <double>[
        0.0, // First tab's starting position
        // Calculate the positions for the other tabs based on your content
        // Adjust these values based on your content layout
        200.0, // Directions
        400.0, // Overview
        600.0, // Amenities
        800.0, // Ask community
        1000.0, // More
      ];

      for (int i = 0; i < tabPositions.length - 1; i++) {
        if (_scrollController.offset >= tabPositions[i] &&
            _scrollController.offset < tabPositions[i + 1]) {
          _tabController.index = i;
          break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<BusinessProfileProvider>(context);

    TabController _tabController = TabController(length: 5, vsync: this);
    ScrollController _scrollController = ScrollController();

    return Scaffold(
      body: data.isLoading
          ? Center(
              child: Image.asset("images/loading.gif"),
            )
          : CustomScrollView(
              controller: _scrollController,
              slivers: <Widget>[
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
                      )),
                  flexibleSpace: FlexibleSpaceBar(
                    title: Padding(
                      padding: const EdgeInsets.only(right: 2),
                      child: data.isLoading
                          ? Center(
                              child: Text(""),
                            )
                          : Text(
                              // "Hub Restaurant",
                              data.businessProfileData!.businessName.toString(),

                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            ),
                    ),
                    background: Image.network(
                      'https://th.bing.com/th/id/OIP.9Go9irZlGjlgtkYpdlX03gAAAA?pid=ImgDet&rs=1',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // Divider(
                //   color: Colors.blueGrey,
                //   thickness: .7,
                // ),

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
                        Tab(text: "Ask community"),
                        Tab(
                          text: "More",
                        )
                      ],
                    ),
                  ),
                  pinned: true,
                ),
                SliverToBoxAdapter(
                  child: AutoScaleTabBarView(
//////////////////////// FYI : this above Autoscaletabbarview is a third party package ////////
                    ///
                    controller: _tabController,
                    children: [
                      MapScreenPage(),
                      if (data.businessProfileData!.subCategory ==
                          "housingrent")
                        OverviewPage(),
                      OverviewPage(),
                      AmenitiesGridView(),
                      AskForCommunityWidget(uid: ""),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  //     child: Center(
                  //   child: Padding(
                  //     padding: const EdgeInsets.symmetric(vertical: 350),
                  //     child: Text(
                  //         " We can deploy rest of the shit here as our liking "),
                  //   ),
                  // ) // Replace with your additional information widget

                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Container(
                      color: Colors.white,
                      child: OverviewPage(),
                    ),
                  ),
                ),

                //   SliverToBoxAdapter(
                //     child: Padding(
                //       padding: const EdgeInsets.symmetric(vertical: 16),
                //       child: Container(
                //         color: Colors.white,
                //         child: OverviewPage(),
                //       ),
                //     ),
                //   ),

                //   SliverToBoxAdapter(
                //     child: Padding(
                //       padding: const EdgeInsets.symmetric(vertical: 16),
                //       child: Container(
                //         color: Colors.white,
                //         child: OverviewPage(),
                //       ),
                //     ),
                //   ),
                //   SliverToBoxAdapter(
                //     child: Padding(
                //       padding: const EdgeInsets.symmetric(vertical: 16),
                //       child: Container(
                //         color: Colors.white,
                //         child: OverviewPage(),
                //       ),
                //     ),
                //   )
              ],
            ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
