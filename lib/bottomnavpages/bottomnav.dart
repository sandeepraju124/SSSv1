// ignore_for_file: prefer_const_constructors, use_super_parameters, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/User_Activity%20Section/display_user_activities.dart';

import 'package:sssv1/bottomnavpages/searchpage.dart';
import 'package:sssv1/providers/live_user_location.dart';
import 'package:sssv1/providers/user_provider.dart';
import 'package:sssv1/screens/NewUserProfile.dart';
import 'package:sssv1/screens/homepage.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:sssv1/screens/userprofile_test.dart';
import 'package:sssv1/utils/constants.dart';
import 'package:sssv1/utils/navigator.dart';

import '../chat/chatlist.dart';
import '../favorite_test.dart';
import '../homepage_new.dart';
import '../nearby_comments.dart';
import '../providers/BusinessCategoriesProviderNew.dart';
import '../providers/chat_provider.dart';
import '../providers/comments_provider_new.dart';
import '../providers/favourite_provider.dart';
import '../providers/home_popularnear_provider.dart';
import '../providers/home_restaurent_provider.dart';
import '../providers/nearby_comments_provider.dart';
import '../providers/user_review_provider.dart';
import '../test.dart';



class BottomNavPage extends StatefulWidget {
  // const BottomNavPage({Key? key}) : super(key: key);
  final int initialIndex;
  BottomNavPage({this.initialIndex = 0});

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    // MyHomePage(),
    HomePageNew(),
    SearchBarPage(),
    UserActivityScreen(),
    ProfilePage(),
  ];

  // @override
  // void initState() {
  //   super.initState();
  //   var liveLoc = Provider.of<LiveUserLocation>(context, listen: false);
  //   if (liveLoc.latitude == null) {
  //     liveLoc.getCurrentLocation();
  //   }

  //   var userprov = Provider.of<UserProvider>(context, listen: false);
  //   if (userprov.getUserData == null) {
  //     userprov.userProvider();
  //   }
  // }

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeData();
    });
  }


  void _initializeData() async {
    // Capture the provider instances at the start
    final user = await FirebaseAuth.instance.currentUser!;
    print("User id: ${user.uid}");
    var liveLoc = Provider.of<LiveUserLocation>(context, listen: false);
    var userprov = Provider.of<UserProvider>(context, listen: false);
    var nearbycomments = Provider.of<NearbyCommentProvider>(context, listen: false);
    var userComments = Provider.of<UserCommentsProvider>(context, listen: false);
    var userFavourites = Provider.of<FavouriteProvider>(context, listen: false);
    var userFeatured = Provider.of<HomeRestaurantListProvider>(context, listen: false);
    var userPopular = Provider.of<HomePopularListProvider>(context, listen: false);
    var categories = Provider.of<BusinessCategoriesProviderNew>(context, listen: false);
    var chat = Provider.of<ChatProvider>(context, listen: false);
     chat.fetchConversations(user.uid);

    // Fetch the user's location
    if (liveLoc.latitude == null) {
      bool locationFetched = await liveLoc.getCurrentLocation();
      if (locationFetched && mounted) {
        // Fetch comments only if location is successfully fetched
        if (nearbycomments.comments.isEmpty && !nearbycomments.isLoading) {
          await nearbycomments.fetchComments(liveLoc.latitude!, liveLoc.longitude!, 10000);
        }
        // if
        // Provider.of<HomeRestaurantListProvider>(context, listen: false).fetchFeatured(liveLoc.latitude!, liveLoc.longitude!,5000);
        if (userFeatured.FeaturedList.isEmpty && !userFeatured.isLoading) {
          await userFeatured.fetchFeatured(liveLoc.latitude!, liveLoc.longitude!,5000);
        }
        if (userPopular.PopularList.isEmpty && !userFeatured.isLoading) {
          await userPopular.fetchPopular(liveLoc.latitude!, liveLoc.longitude!,5000);
        }
        if (categories.allCategories.isEmpty && !categories.isLoading) {
          await categories.fetchCategoriesData();}
          chat.fetchConversations("KFwYUTlCQrT4RB2a8XLviFYUbU42");
          print("did");

        // if (chat.conversations.isEmpty) {
        //   print("........................");
        //   print(user.uid);
        //   // await chat.fetchConversations(user.uid);
        //   await chat.fetchConversations("KFwYUTlCQrT4RB2a8XLviFYUbU42");
        
        // }



      }

    }

    // Fetch user data if not already loaded
    if (userprov.getUserData == null && !userprov.isLoading) {
      userprov.userProvider();
    }

    // if (userComments.comments == null && !userComments.isLoading) {
    //   print("Fetching user comments");
    //   userComments.getUserComments(userprov.getUserData!.id);
    // }
    // userComments.getUserComments("Ygk9TDqaLTdqa1IaMvHH3zEX2M93");
    userComments.getUserComments(user.uid);
    userFavourites.getFavourites(user.uid);


  }


  @override
  Widget build(BuildContext context) {
    var data = Provider.of<LiveUserLocation>(context);
    return Scaffold(
      appBar: _currentIndex == 0 ? _buildAppBar(data) : null,
      body: _pages[_currentIndex],
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  
  PreferredSizeWidget _buildAppBar(LiveUserLocation data) {
    var userdata = Provider.of<UserProvider>(context);
    return AppBar(
      
      actions: [
        IconButton(
          icon: Icon(Icons.favorite_border, color: Colors.grey, size: 20,),
          onPressed: () {
            navigatorPush(context, FavoritesPage());
          },
        ),
        IconButton(
          icon: Icon(Icons.star, color: Colors.amber[700]),
          onPressed: () {
            navigatorPush(context, AllReviewsScreen());
          },
        ),
        IconButton(
          icon: Icon(Icons.refresh, color: Colors.grey, size: 19.6,),
          onPressed: () {
            // navigatorPush(context, AllReviewsScreen());
            data.getCurrentLocation();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Refreshing location...'),
                behavior: SnackBarBehavior.floating,
              ),
            );
          },
        ),
        IconButton(
          icon: Icon(Icons.chat_bubble_outline, color: Colors.grey, size: 20,),
          onPressed: () async {
            String? userId = await getUserId();
            print("User id: $userId");
            // navigatorPush(context, ChatListScreen(userId: '123',userType: 'customer',));
            navigatorPush(context, ChatListScreen(userId: userId!,));
          },
        ),
      ],
      leading: GestureDetector(
        onTap: () {
          navigatorPush(context, MyHomePage());
        },
        child: Container(
          margin: EdgeInsets.all(7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(color: Colors.white, width: 2),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  userdata.getUserData?.profile_image_url ?? defaultNetworkImage),
            ),
          ),
        ),
      ),
      title: GestureDetector(
        onTap: () {
          data.getCurrentLocation();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Refreshing location...'),
              behavior: SnackBarBehavior.floating,
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Current Address",
              style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  color:Colors.black54),
            ),
            SizedBox(height: 2),
            Row(
              children: [
                Expanded(
                  child: Text(
                    data.locationName ?? "Loading...",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                // Icon(Icons.refresh, size: 18, color: Colors.blue),
              ],
            ),
          ],
        ),
      ),
      backgroundColor:tgDarkPrimaryColor,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(15),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavBarItem(0, LineAwesomeIcons.home, "Home"),
              _buildNavBarItem(1, LineAwesomeIcons.search, "Search"),
              _buildNavBarItem(2, LineAwesomeIcons.accusoft, "Activity"),
              _buildNavBarItem(3, LineAwesomeIcons.user, "Profile"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavBarItem(int index, IconData icon, String label) {
    final isSelected = _currentIndex == index;
    return InkWell(
      onTap: () => setState(() => _currentIndex = index),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).primaryColor.withOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? tgDarkPrimaryColor : Colors.grey,
              size: 24,
            ),
            SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? tgDarkPrimaryColor : Colors.grey,
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
