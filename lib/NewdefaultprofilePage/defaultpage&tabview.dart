// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_new, unused_element, depend_on_referenced_packages

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/Askcommunity%20Section/Askthecommunity.dart';
import 'package:sssv1/HousingServices/overview.dart';
import 'package:sssv1/NewdefaultprofilePage/Additionalinfo.dart';
import 'package:sssv1/Reviews%20Section/new_showcomments.dart';
import 'package:sssv1/providers/askcommunity_provider.dart';
import 'package:sssv1/providers/business_profile_provider.dart';
import 'package:sssv1/providers/comments_provider.dart';
import 'package:sssv1/screens/mapscreen.dart';
import 'package:sssv1/utils/constants.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:sssv1/widgets/amenities.dart';
import 'package:autoscale_tabbarview/autoscale_tabbarview.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// import '../widgets/review_rating.dart';

class DefaultProfilePage extends StatefulWidget {
  const DefaultProfilePage({super.key, required this.uid});

  final String uid;

  @override
  State<DefaultProfilePage> createState() => _DefaultProfilePageState();
}

class _DefaultProfilePageState extends State<DefaultProfilePage>
    with TickerProviderStateMixin {
  // late List<GlobalKey> _keys;
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
    _tabController = TabController(length: 5, vsync: this);
    _scrollController = ScrollController();
    // _keys = List<GlobalKey>.generate(5, (index) => GlobalKey());

    var data = Provider.of<BusinessProfileProvider>(context, listen: false);
    data.businessProfileProvider(widget.uid);

    // var dataAsk = Provider.of<AskCommunityProvider>(context, listen: false);
    // dataAsk.fetchAskCommunityData(widget.uid);

    Future.delayed(Duration(seconds: 2), () {
      var dataAsk = Provider.of<AskCommunityProvider>(context, listen: false);
      dataAsk.fetchAskCommunityData(widget.uid);
    });

    var datacomments =
        Provider.of<CommentSectionProvider>(context, listen: false);
    datacomments.commentSectionProvider(widget.uid);

    // Future.microtask(() {
    //   var data = Provider.of<BusinessProfileProvider>(context, listen: false);
    //   data.businessProfileProvider(widget.uid);

    //   var dataAsk = Provider.of<AskCommunityProvider>(context, listen: false);
    //   dataAsk.fetchAskCommunityData(widget.uid);

    //   var datacomments =
    //       Provider.of<CommentSectionProvider>(context, listen: false);

    //   datacomments.commentSectionProvider(widget.uid);
    // });

    // _scrollController.addListener(() {
    //   if (_scrollController.offset >= 2000) {
    //     // _tabController.animateTo(1);

    //     // Change to the second tab when the scroll offset is greater than 200
    //     // } else if (_scrollController.offset >= 530) {     //////////600
    //     //   _tabController.animateTo(2);
    //     // } else if (_scrollController.offset >= 1230 &&
    //     //     _scrollController.offset < 1630) {                     /////////// 980
    //     //   _tabController.animateTo(3);
    //     // } else if (_scrollController.offset >= 1630) {          /////////1780
    //     //   _tabController.animateTo(4);
    //     // } else if (_scrollController.offset >= 600 &&
    //     //     _scrollController.offset < 900) {
    //     //   _tabController.animateTo(2);
    //     // } else if (_scrollController.offset >= 980) {
    //     //   _tabController.animateTo(3);
    //     // } else if (_scrollController.offset >= 1780) {
    //     //   _tabController.animateTo(4);
    //   } else {
    //     // _tabController.animateTo(
    //     //     _tabController.index); // Change to the first tab otherwise

    //     _tabController.animateTo(0);
    //   }
    // });
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        if (_tabController.index == 0) {
          _scrollController.animateTo(1 * 20,
              duration: Duration(seconds: 1), curve: Curves.ease);
        } else if (_tabController.index == 1) {
          _scrollController.animateTo(2 * 90,
              duration: Duration(seconds: 1), curve: Curves.ease);
        } else if (_tabController.index == 2) {
          _scrollController.animateTo(
            3 * 210,
            duration: Duration(seconds: 1),
            curve: Curves.ease,
          );
        } else if (_tabController.index == 3) {
          _scrollController.animateTo(4 * 212,
              duration: Duration(seconds: 1), curve: Curves.ease);
        } else if (_tabController.index == 4) {
          _scrollController.animateTo(5 * 280,
              duration: Duration(seconds: 1), curve: Curves.ease);
        } else if (_tabController.indexIsChanging) {
          _tabController.animateTo(0);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<BusinessProfileProvider>(context);

    // TabController _tabController = TabController(length: 5, vsync: this);

    return Scaffold(
      body: data.isLoading
          ? Center(
              child: CircularProgressIndicator(
              color: tgDarkPrimaryColor,
            ))
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
                  actions: [
                    Row(
                      children: [
                        RatingBar.builder(
                          initialRating:
                              Provider.of<CommentSectionProvider>(context)
                                  .averageRating,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                          itemSize: 12,
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber[700],
                            size: 20,
                          ),
                          onRatingUpdate: (rating) {
                            // print(rating);
                          },
                        ),
                        SizedBox(width: 2),
                        Text(
                          Provider.of<CommentSectionProvider>(context)
                              .averageRating
                              .toStringAsFixed(1),
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        )
                      ],
                    ),
                  ],
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
                      data.businessProfileData!.profileImage,
                      fit: BoxFit.cover,
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
                      // onTap: (index) {
                      //   _scrollController.animateTo(
                      //       index * MediaQuery.of(context).size.height,
                      //       duration: Duration(seconds: 1),
                      //       curve: Curves.ease);
                      // },
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
                        Tab(
                          text: "Ask Your Community",
                        )
                      ],
                    ),
                  ),
                  pinned: true,
                ),
                SliverToBoxAdapter(
                  child: AutoScaleTabBarView(
//////////////////////// FYI : this above Autoscaletabbarview is a third party package ////////

                    controller: _tabController,

                    children: [
                      MapScreenPage(
                          // key: _keys[0],
                          ),
                      if (data.businessProfileData != null &&
                          data.businessProfileData!.subCategory ==
                              "housingrent")
                        Container(
                          height: 7,
                        ),
                      if (data.businessProfileData == null ||
                          data.businessProfileData!.subCategory !=
                              "housingrent")
                        Container(
                          height: 7,
                        ),
                      Container(
                        height: 7,
                      ),
                      Container(
                        height: 7,
                      ),
                      Container(
                        height: 7,
                      ),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Container(
                        color: secondaryColor5LightTheme,
                        child: OverviewPage()),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Container(
                      height: 250,
                      color: secondaryColor5LightTheme,
                      child: AmenitiesGridView(),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Container(
                      height: 500,
                      color: secondaryColor5LightTheme,
                      child: NewShowRewviewPage(),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Container(
                        height: 600,
                        color: secondaryColor5LightTheme,
                        child: AskForCommunityWidget(
                          uid: '',
                          Questionid: "",
                        )),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Container(
                        height: 600,
                        color: secondaryColor5LightTheme,
                        child: Container()),
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
