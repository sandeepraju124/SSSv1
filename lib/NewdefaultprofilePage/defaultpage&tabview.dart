// // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_new, unused_element, depend_on_referenced_packages

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: unused_import
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sssv1/Askcommunity%20Section/Askthecommunity.dart';
import 'package:sssv1/NewdefaultprofilePage/Additionalinfo.dart';
import 'package:sssv1/providers/askcommunity_provider.dart';
import 'package:sssv1/providers/business_profile_provider.dart';
import 'package:sssv1/providers/comments_provider.dart';
import 'package:sssv1/providers/service_provider.dart';
import 'package:sssv1/screens/mapscreen.dart';
import 'package:sssv1/utils/constants.dart';
import 'package:sssv1/widgets/amenities.dart';
import 'package:autoscale_tabbarview/autoscale_tabbarview.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../Reviews Section/show_fewcomments.dart';
import '../chat/chatlist.dart';
import '../providers/chat_provider.dart';
import '../providers/comments_provider_new.dart';
import '../providers/favourite_provider.dart';
import '../utils/navigator.dart';


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
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    print(widget.uid);
    sendProfileVisit(widget.uid);
    _tabController = TabController(length: 5, vsync: this);
    _scrollController = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchData();
    });

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        _scrollToTab(_tabController.index);
      }
    });
  }

  Future<void> fetchData() async {
    try {
      await Provider.of<BusinessProfileProvider>(context, listen: false)
          .businessProfileProvider(widget.uid);
      await Provider.of<AskCommunityProvider>(context, listen: false)
          .fetchAskCommunityData(widget.uid);
      await Provider.of<CommentSectionProviderNew>(context, listen: false)
          .getComments(widget.uid);
      await Provider.of<ServicesProvider>(context, listen: false)
          .getMongoBusinessData(widget.uid);
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      // Handle the error here
      print('Error fetching data: $e');
    }
  }

  Future<void> sendProfileVisit(String businessId) async {
    String? userId = await getUserId();
    final String url = 'https://supernova1137.azurewebsites.net/provile_visit';

    // Constructing the request body
    Map<String, dynamic> requestBody = {
      'user_id': userId,
      'business_id': businessId,
    };

    try {
      // Sending the POST request
      await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json', // Set the content type to JSON
        },
        body: jsonEncode(requestBody), // Encode the request body as JSON
      );
    } catch (e) {
      // Handle exceptions
      print('Error occurred: $e');
    }
  }

  void _scrollToTab(int index) {
    switch (index) {
      case 0:
        _scrollController.animateTo(1 * 30,
            duration: const Duration(seconds: 1), curve: Curves.ease);
        break;
      case 1:
        _scrollController.animateTo(2 * 60,
            duration: const Duration(seconds: 1), curve: Curves.ease);
        break;
      case 2:
        _scrollController.animateTo(3 * 280,
            duration: const Duration(seconds: 1), curve: Curves.ease);
        break;
      case 3:
        _scrollController.animateTo(4 * 300,
            duration: const Duration(seconds: 1), curve: Curves.ease);
        break;
      case 4:
        _scrollController.animateTo(5 * 370,
            duration: const Duration(seconds: 1), curve: Curves.ease);
        break;
      default:
        _tabController.animateTo(0);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    var data = Provider.of<BusinessProfileProvider>(context);
    var servicesData = Provider.of<ServicesProvider>(context);
    final fav = Provider.of<FavouriteProvider>(context, listen: false);
    var chat = Provider.of<ChatProvider>(context);
    String chatId = chat.getConversationId(user!.uid, widget.uid);
    print(widget.uid);
    print(chatId);
   
    // var fav = Provider.of<FavouriteProvider>(context);
    String businessId = data.businessProfileData?.businessUid ?? '';
    // bool isLiked = fav.favourite.any((favourite) =>
    //     favourite.businessId == data.businessProfileData?.businessUid);
    // int? favouriteId =
    //     fav.favourite.firstWhere((favourite) =>
    //             favourite.businessId == data.businessProfileData?.businessUid,
    //             orElse: () => FavouriteModels(
    //               favouriteId: 0,
    //               businessId: '',
    //               businessName: '',
    //               businessProfileImageUrl: '',
    //               createdAt: '',
    //               subCategory: '',
    //               userId: '',
    //               userName: '',
    //             ))
    //         .favouriteId;
    // final business = data.PopularList[index];
    final isLiked = fav.isFavourite(businessId);
    final favouriteId = fav.getFavouriteId(businessId);


    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.chat_bubble_outline, color: Colors.white, size: 18,),
        label: Text('Chat', style: TextStyle(color: Colors.white,)),
        backgroundColor: Colors.teal,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: () async{
          String? userId = await getUserId();
          navigatorPush(context, ChatScreen(userId: userId!,businessId: widget.uid, conversationId: chatId,));
        },
      ),

      body: _isLoading
          ? _buildShimmerLoading()
          : CustomScrollView(
              controller: _scrollController,
              slivers: <Widget>[
                _buildSliverAppBar(data, isLiked, favouriteId),
                SliverToBoxAdapter(
                  child: AdditionalInfoPage(),
                ),
                _buildSliverPersistentHeader(),
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
                      child: Text("overview"),
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
                      color: Colors.white70,
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
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

 
//   Widget _buildShimmerLoading() {
//   return Shimmer.fromColors(
//     baseColor: Colors.grey[300]!,
//     highlightColor: Colors.grey[100]!,
//     child: CustomScrollView(
//       slivers: [
//         SliverAppBar(
//           backgroundColor: tgPrimaryColor,
//           expandedHeight: 200.0,
//           floating: true,
//           pinned: true,
//           leading: const Icon(
//             Icons.keyboard_arrow_left_rounded,
//             color: tgPrimaryText,
//             size: 24,
//           ),
//           flexibleSpace: FlexibleSpaceBar(
//             title: Padding(
//               padding: const EdgeInsets.only(right: 16),
//               child: Container(
//                 width: 150,
//                 height: 20,
//                 color: Colors.white,
//               ),
//             ),
//             background: Stack(
//               fit: StackFit.expand,
//               children: [
//                 Container(
//                   color: Colors.grey,
//                 ),
//                 Positioned.fill(
//                   child: DecoratedBox(
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                         begin: Alignment.topCenter,
//                         end: Alignment.bottomCenter,
//                         colors: [
//                           Colors.black.withOpacity(0.3),
//                           Colors.black.withOpacity(0.7),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         SliverToBoxAdapter(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   width: 200,
//                   height: 20,
//                   color: Colors.white,
//                 ),
//                 const SizedBox(height: 16),
//                 Container(
//                   width: 150,
//                   height: 20,
//                   color: Colors.white,
//                 ),
//                 const SizedBox(height: 16),
//                 Row(
//                   children: [
//                     Container(
//                       width: 80,
//                       height: 20,
//                       color: Colors.white,
//                     ),
//                     const SizedBox(width: 16),
//                     Container(
//                       width: 80,
//                       height: 20,
//                       color: Colors.white,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//         _buildSliverPersistentHeader(),
//         SliverToBoxAdapter(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   width: double.infinity,
//                   height: 100,
//                   color: Colors.white,
//                 ),
//                 const SizedBox(height: 16),
//                 Container(
//                   width: double.infinity,
//                   height: 100,
//                   color: Colors.white,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }
Widget _buildShimmerLoading() {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: tgPrimaryColor,
          expandedHeight: 200.0,
          floating: true,
          pinned: true,
          leading: const Icon(
            Icons.keyboard_arrow_left_rounded,
            color: tgPrimaryText,
            size: 24,
          ),
          flexibleSpace: FlexibleSpaceBar(
            title: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Container(
                width: 150,
                height: 20,
                color: Colors.white,
              ),
            ),
            background: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  color: Colors.grey,
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
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 200,
                  height: 20,
                  color: Colors.white,
                ),
                const SizedBox(height: 16),
                Container(
                  width: 150,
                  height: 20,
                  color: Colors.white,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Container(
                      width: 80,
                      height: 20,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 16),
                    Container(
                      width: 80,
                      height: 20,
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        _buildSliverPersistentHeader(),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 100,
                  color: Colors.white,
                ),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  height: 100,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

  Widget _buildSliverAppBar(
      BusinessProfileProvider data, bool isLiked, int? favouriteId) {
        final fav = Provider.of<FavouriteProvider>(context, listen: false);
        
    String BuinessId = data.businessProfileData?.businessUid ?? '';
    return SliverAppBar(
      backgroundColor: tgPrimaryColor,
      expandedHeight: 200.0,
      floating: true,
      pinned: true,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(
          Icons.keyboard_arrow_left_rounded,
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
                initialRating:
                    Provider.of<CommentSectionProvider>(context).averageRating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                itemSize: 16,
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (_) {},
              ),
              const SizedBox(width: 4),
              Text(
                Provider.of<CommentSectionProvider>(context)
                    .averageRating
                    .toStringAsFixed(1),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13.7,
                  fontWeight: FontWeight.w200,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 7, bottom: 10),
                child: LikeButton(
                  isLiked: isLiked,
                  circleColor: CircleColor(
                    start: Color(0xff00ddff),
                    end: Color(0xff0099cc),
                  ),
                  bubblesColor: BubblesColor(
                    dotPrimaryColor: Color(0xff33b5e5),
                    dotSecondaryColor: Color(0xff0099cc),
                  ),
                  likeBuilder: (bool isLiked) {
                    return Icon(
                      Icons.favorite,
                      color: isLiked ? Colors.pink : Colors.white,
                      size: 20,
                    );
                  },
                

                  onTap: (bool isLiked) async {
                    if (!isLiked) {
                      // print("add to favourite");
                      fav.addFavourite(context, BuinessId);
                    } else {
                      if (favouriteId != null) {
                        // print("remove from favourite");
                        bool isDeleted = await fav.deleteFavourite(favouriteId);
                        if (isDeleted) {
                          // print("deleted");
                          showSnackBar(context, "Removed from favourites");
                        } else {
                          print("not deleted");
                        }
                      }
                    }
                    return !isLiked;
                  },
                ),
              )
            ],
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        title: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: data.isLoading
              ? Container(
                  width: 150,
                  height: 20,
                  color: Colors.white,
                )
              : GestureDetector(
                  onTap: () {
                    print(data.businessProfileData!.businessUid);
                    showSnackBar(context, data.businessProfileData!.businessUid);
                  },
                  child: Text(
                    data.businessProfileData?.businessName?.toString() ??
                        'Default Name',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      shadows: [
                        Shadow(
                          blurRadius: 3.0,
                          color: Colors.black54,
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
          ],
        ),
      ),
    );
  }

  Widget _buildSliverPersistentHeader() {
    return SliverPersistentHeader(
      delegate: _SliverAppBarDelegate(
        TabBar(
          controller: _tabController,
          isScrollable: true,
          labelColor: Colors.black87,
          unselectedLabelColor: secondaryColor20LightTheme,
          indicator: UnderlineTabIndicator(
            borderRadius: BorderRadius.all(Radius.circular(2)),
            borderSide: BorderSide(color: tgPrimaryColor),
          ),
          tabs: const [
            Tab(text: "Directions"),
            Tab(text: "Overview"),
            Tab(text: "Amenities"),
            Tab(text: "Reviews"),
            Tab(text: "Ask Your Community"),
          ],
        ),
      ),
      pinned: true,
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
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: _tabBar,
    );
  }
}