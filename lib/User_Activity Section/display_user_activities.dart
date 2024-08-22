

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/NewdefaultprofilePage/defaultpage&tabview.dart';
import 'package:sssv1/User_Activity%20Section/user_activity_model.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import 'package:sssv1/User_Activity%20Section/user_activity_provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
// ignore: unused_import
import 'package:sssv1/models/askthecom_models.dart';
import 'package:sssv1/utils/constants.dart';
import 'package:intl/intl.dart';
import 'package:collection/collection.dart';
import 'package:sssv1/utils/navigator.dart';

import '../providers/user_review_provider.dart';

// import 'package:sssv1/User_Activity Section/user_activity_model.dart'
//     as user_activity;


class UserActivityScreen extends StatefulWidget {
  const UserActivityScreen({Key? key}) : super(key: key);

  @override
  _UserActivityScreenState createState() => _UserActivityScreenState();
}

class _UserActivityScreenState extends State<UserActivityScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    final String? userid = FirebaseAuth.instance.currentUser?.uid;
    Provider.of<UserActivityProvider>(context, listen: false)
        .userActivityProvider(userid);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Future<void> _handleRefresh() async {
  //   final String? userid = FirebaseAuth.instance.currentUser?.uid;
  //   await Provider.of<UserActivityProvider>(context, listen: false)
  //       .userActivityProvider(userid);
  // }
  Future<void> _handleRefresh() async {
    final String? userid = FirebaseAuth.instance.currentUser?.uid;
    await Provider.of<UserCommentsProvider>(context, listen: false)
        .getUserComments(userid!);
  }

  @override
  Widget build(BuildContext context) {
    var datacom = Provider.of<UserCommentsProvider>(context);
    var data = Provider.of<UserActivityProvider>(context);
    ////// For customize stars////

    Widget stars(int rating) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
            rating,
                (index) => Padding(
              padding: const EdgeInsets.only(right: 4, bottom: 7, top: 10),
              child: Container(
                width: 17,
                height: 17,
                decoration: BoxDecoration(
                    color: tgDarkPrimaryColor,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.black, width: 0.3)),
                child: Icon(
                  Icons.star,
                  color: Colors.white,
                  // color: Colors.amber[700],
                  size: 12,
                ),
              ),
            )),
      );
    }

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder:
            (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              backgroundColor: tgDarkPrimaryColor,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text("Your Activity",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    )),
                background: Image.asset(
                  "assets/6221846.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverPersistentHeader(
              delegate: _SliverAppBarDelegate(
                TabBar(
                  controller: _tabController,
                  labelColor: tgDarkPrimaryColor,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: tgDarkPrimaryColor,
                  tabs: [
                    Tab(
                      icon: Icon(
                        Icons.star_rounded,
                        size: 18.8,
                      ),
                      text: "Reviews",
                    ),
                    Tab(
                      icon: Icon(
                        Icons.help_outlined,
                        size: 20,
                      ),
                      text: "Questions",
                    ),
                    Tab(
                      icon: Icon(
                        Icons.forum_rounded,
                        size: 20,
                      ),
                      text: "Answers",
                    ),
                  ],
                ),
              ),
              pinned: true,
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          // color: tgDarkPrimaryColor,
          children: [
            // _buildActivityList(
            //     data.getUserActivityData?.comments ?? [], _buildReviewItem),
            _buildActivityList(
                datacom.comments, _buildReviewItem),
            _buildActivityList(data.getUserActivityData?.questions ?? [],
                _buildQuestionItem),
            _buildActivityList(
                data.getUserActivityData?.answers ?? [], _buildAnswerItem),
          ],
        ),
      )
    );
  }

  Widget _buildActivityList(
      List items, Widget Function(BuildContext, dynamic) itemBuilder) {
    return RefreshIndicator(
      color: tgPrimaryColor,
      onRefresh: _handleRefresh,
      child: items.isEmpty
          ? _buildEmptyState()
          : ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) =>
            itemBuilder(context, items[index]),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset("images/Activity.json", height: 180),
          Text(
            "There are currently no activities to display",
            style: TextStyle(fontSize: 13, color: secondaryColor40LightTheme),
          )
        ],
      ),
    );
  }

  Widget _buildReviewItem(BuildContext context, dynamic comment) {
    // print(comment);
    String capitalizeEachWord(String text) {
      if (text.isEmpty) return text;
      return text.split(' ').map((word) {
        if (word.isEmpty) return word;
        return word[0].toUpperCase() + word.substring(1).toLowerCase();
      }).join(' ');
    }

    return GestureDetector(
      // onTap: () => _navigateToBusinessProfile(context, comment.businessUid),
      onTap: () {
        navigatorPush(context, DefaultProfilePage(uid: comment.businessId));
      },
      child: Container(
        margin: EdgeInsets.all(7.2),
        padding: EdgeInsets.all(7.2),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.only(bottom: 10),
              leading: CircleAvatar(
                radius: 20,
                // backgroundColor: tgDarkPrimaryColor,
                backgroundColor: Colors.blueGrey.shade300,
                child: Text(
                  comment.businessName[0],
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              title: Text(
                capitalizeEachWord(comment.businessName),
                style: TextStyle(
                  fontSize: 14.3,
                  fontWeight: FontWeight.w600,
                  color: secondaryColor60LightTheme,
                  fontFamily: "poppins",
                  leadingDistribution: TextLeadingDistribution.even,
                ),
              ),
              subtitle: Row(
                children: [
                  _buildStarRating(comment.rating),
                  SizedBox(width: 8),
                  Text(
                    "${comment.rating.toStringAsFixed(1)}",
                    style: TextStyle(
                        fontSize: 12.3,
                        fontWeight: FontWeight.w600,
                        color: secondaryColor20LightTheme),
                  ),
                ],
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: secondaryColor40LightTheme,
                size: 12,
              ),
            ),
            Text(
              comment.comment,
              style: TextStyle(
                color: secondaryColor40LightTheme,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 4),
            Text(
              // "Reviewed on ${_formatDateTime(comment.createdAt)}",
              "Reviewed on ${formatCreatedAt(comment.createdAt)}",
              // "Reviewed on ${comment.createdAt}",
              style: TextStyle(
                color: secondaryColor20LightTheme,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionItem(BuildContext context, dynamic question) {
    return GestureDetector(
      onTap: () => _navigateToBusinessProfile(context, question.businessUid),
      child: Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: ListTile(
          title: Text(
            "Q: ${question.question}",
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              wordSpacing: 0.5,
              letterSpacing: -0.1,
              color: secondaryColor60LightTheme,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 7),
            child: Text(
              "Question posed to '${question.businessName}' \non ${_formatDateTime(question.qdetails.createdAt)}",
              style: TextStyle(
                color: secondaryColor20LightTheme,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAnswerItem(BuildContext context, dynamic answer) {
    var data = Provider.of<UserActivityProvider>(context);

    final Question? relatedQuestion = data.getUserActivityData?.questions
        .firstWhereOrNull((question) => question.answers
        .any((a) => a.adetails.answerid == answer.adetails.answerid));

    return GestureDetector(
      onTap: () => _navigateToBusinessProfile(
          context, relatedQuestion?.businessUid ?? ""),
      child: Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Q: ${relatedQuestion?.question ?? 'Related question not found'}",
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                wordSpacing: 0.5,
                letterSpacing: -0.1,
                color: secondaryColor60LightTheme,
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: secondaryColor40LightTheme,
                    fontSize: 12,
                  ),
                  children: [
                    TextSpan(
                      text: "Your response was: '",
                      style: TextStyle(fontSize: 11, fontFamily: 'RobotoMono'),
                    ),
                    TextSpan(
                      text: answer.answer,
                      style: TextStyle(
                        color: secondaryColor60LightTheme,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.4,
                      ),
                    ),
                    TextSpan(
                      text:
                      "'\n\nProvided for: '${answer.businessName}'\n on: ${_formatDateTime(answer.adetails.createdAt)}",
                      style: TextStyle(
                        fontSize: 10.2,
                        // fontFamily: 'RobotoMono',
                        fontWeight: FontWeight.w700,
                        color: secondaryColor40LightTheme,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStarRating(int rating) {
    // return Row(
    //   children: List.generate(
    //     5,
    //     (index) => Icon(
    //       index < rating ? Icons.star_rounded : Icons.star_border_rounded,
    //       size: 19,
    //       color: Colors.amber[700],
    //     ),
    //   ),
    // );
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
          rating,
              (index) => Padding(
            padding: const EdgeInsets.only(right: 4, bottom: 7, top: 10),
            child: Container(
              width: 17,
              height: 17,
              decoration: BoxDecoration(
                  color: tgDarkPrimaryColor,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Colors.black, width: 0.3)),
              child: Icon(
                Icons.star,
                color: Colors.white,
                // color: Colors.amber[700],
                size: 12,
              ),
            ),
          )),
    );
  }

  String _formatDateTime(DateTime dateTime) {
    final DateFormat formatter = DateFormat('MMM d, yyyy');
    return formatter.format(dateTime.toLocal());
  }

  void _navigateToBusinessProfile(BuildContext context, String businessUid) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DefaultProfilePage(uid: businessUid),
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
    return Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
