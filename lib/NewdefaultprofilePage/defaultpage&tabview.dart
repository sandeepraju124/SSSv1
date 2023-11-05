// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_new, unused_element

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/Askcommunitypages/Askthecommunity.dart';
import 'package:sssv1/HousingServices/overview.dart';
import 'package:sssv1/NewdefaultprofilePage/Additionalinfo.dart';
import 'package:sssv1/providers/askcommunity_provider.dart';
import 'package:sssv1/providers/business_profile_provider.dart';
import 'package:sssv1/providers/comments_provider.dart';
import 'package:sssv1/screens/mapscreen.dart';
import 'package:sssv1/screens/postcomment.dart';
import 'package:sssv1/utils/constants.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:sssv1/widgets/amenities.dart';
import 'package:autoscale_tabbarview/autoscale_tabbarview.dart';
import 'package:sssv1/widgets/showcomment.dart';
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
  late TabController _tabController;
  late ScrollController _scrollController;
  late List<GlobalKey> _keys;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _scrollController = ScrollController();
    _keys = List<GlobalKey>.generate(5, (index) => GlobalKey());

    var data = Provider.of<BusinessProfileProvider>(context, listen: false);
    data.businessProfileProvider(widget.uid);

    var dataAsk = Provider.of<AskCommunityProvider>(context, listen: false);
    dataAsk.fetchAskCommunityData(widget.uid);

    var datacomments =
        Provider.of<CommentSectionProvider>(context, listen: false);

    datacomments.commentSectionProvider(widget.uid);

    _scrollController.addListener(() {
      if (_scrollController.offset >= 430) {
        _tabController.animateTo(
            1); // Change to the second tab when the scroll offset is greater than 200
      } else if (_scrollController.offset >= 630) {
        _tabController.animateTo(2);
      } else if (_scrollController.offset >= 830) {
        _tabController.animateTo(3);
      } else if (_scrollController.offset >= 1030) {
        _tabController.animateTo(4);
      } else if (_scrollController.offset >= 1230) {
        _tabController.animateTo(5);
      } else {
        // _tabController.animateTo(
        //     _tabController.index); // Change to the first tab otherwise
      }
    });
//     _tabController.addListener(() {
//   if (_tabController.indexIsChanging) {
//     _scrollTo(_keys[_tabController.index]);
//   }
// });
  }
//  void _scrollTo(GlobalKey key) {
//   final keyContext = key.currentContext;
//   if (keyContext != null) {
//     final box = keyContext.findRenderObject() as RenderBox;
//     RenderObject? ancestorRenderObject = _scrollController.position.context.findRenderObject();
//     _scrollController.animateTo(
//       box.localToGlobal(Offset.zero, ancestor: ancestorRenderObject).dy,
//       duration: Duration(milliseconds: 500),
//       curve: Curves.easeInOut,
//     );
//   }
// }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<BusinessProfileProvider>(context);

    // TabController _tabController = TabController(length: 5, vsync: this);

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
                    ///
                    controller: _tabController,

                    children: [
                      MapScreenPage(
                          // key: _keys[0],
                          ),
                      if (data.businessProfileData != null &&
                          data.businessProfileData!.subCategory ==
                              "housingrent")
                        OverviewPage(),
                      OverviewPage(),
                      AmenitiesGridView(
                          // key: _keys[2],
                          ),
                      PostComment(
                          businessUid: data.businessProfileData!.businessUid),
                      AskForCommunityWidget(uid: "")
                    ],
                  ),
                ),

                SliverToBoxAdapter(
                  // Replace with your additional information widget

                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child:
                        Container(color: Colors.white, child: OverviewPage()),
                  ),
                ),

                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Container(
                      height: 400,
                      color: Colors.white,
                      child: AmenitiesGridView(),
                    ),
                  ),
                ),

                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Container(
                        height: 400,
                        color: Colors.white,
                        child: PostComment(
                            businessUid:
                                data.businessProfileData!.businessUid)),
                  ),
                ),

                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Container(
                        color: Colors.white,
                        child: AskForCommunityWidget(uid: "")),
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
