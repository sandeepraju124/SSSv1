// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_new, unused_element

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/NewdefaultprofilePage/Additionalinfo.dart';
import 'package:sssv1/providers/business_profile_provider.dart';
import 'package:sssv1/screens/mapscreen.dart';
import 'package:sssv1/utils/constants.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:sssv1/widgets/Askthecommunity.dart';
import 'package:sssv1/widgets/amenities.dart';
import 'package:sssv1/widgets/review_rating.dart';

// import '../widgets/review_rating.dart';

class TestApp extends StatefulWidget {
  final String uid;
  const TestApp({super.key, required this.uid});

  @override
  State<TestApp> createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<BusinessProfileProvider>(context);

    TabController _tabController = TabController(length: 5, vsync: this);

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: tgPrimaryColor,
            expandedHeight: 200.0,
            floating: true,
            pinned: true,
            leading: IconButton(
                onPressed: () {},
                icon: Icon(
                  LineAwesomeIcons.angle_left,
                  color: tgPrimaryText,
                )),
            flexibleSpace: FlexibleSpaceBar(
              title: Padding(
                padding: const EdgeInsets.only(right: 2),
                child: Text(
                  "Hub Restaurant",
                  style: TextStyle(color: Colors.white, fontSize: 17),
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
                  Tab(text: "Details"),
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
          SliverFillRemaining(
            child: TabBarView(
              controller: _tabController,
              children: [
                MapScreenPage(),
                AskForCommunityWidget(uid: widget.uid),
                AmenitiesGridView(),
                MapScreenPage(),
              ],
            ),
          ),
          SliverToBoxAdapter(
              child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child:
                  Text(" We can deploy rest of the shit here as our liking "),
            ),
          ) // Replace with your additional information widget
              )
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
