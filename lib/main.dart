// ignore_for_file: prefer_const_constructors, unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/Askcommunity%20Section/Askthecommunity.dart';
import 'package:sssv1/HousingServices/house_list.dart';
import 'package:sssv1/HousingServices/house_search.dart';
import 'package:sssv1/HousingServices/overview.dart';
import 'package:sssv1/HousingServices/test.dart';
import 'package:sssv1/NewdefaultprofilePage/defaultpage&tabview.dart';
import 'package:sssv1/NewdefaultprofilePage/defaulttest.dart';
import 'package:sssv1/NewdefaultprofilePage/operating_hours_display.dart';
import 'package:sssv1/Reviews%20Section/postcomment.dart';
import 'package:sssv1/Services%20(top)%20of%20homepage%20section/ourtoppick.dart';
import 'package:sssv1/User_Activity%20Section/user_activity_provider.dart';
import 'package:sssv1/firebase_options.dart';
import 'package:sssv1/providers/BusinessCategoriesProviderNew.dart';
import 'package:sssv1/providers/chat_provider.dart';
import 'package:sssv1/providers/comments_provider_new.dart';
import 'package:sssv1/providers/favourite_provider.dart';
import 'package:sssv1/providers/home_popularnear_provider.dart';
import 'package:sssv1/providers/nearby_comments_provider.dart';
import 'package:sssv1/providers/user_review_provider.dart';
import 'package:sssv1/restaurent_center.dart';
import 'package:sssv1/providers/Housedata_Provider.dart';
import 'package:sssv1/providers/allbusinesses.dart';
import 'package:sssv1/providers/askcommunity_provider.dart';
import 'package:sssv1/providers/business_profile_provider.dart';
import 'package:sssv1/providers/comments_provider.dart';
import 'package:sssv1/providers/live_user_location.dart';
import 'package:sssv1/providers/home_restaurent_provider.dart';
import 'package:sssv1/providers/BusinessCategoriesProvider.dart';
import 'package:sssv1/providers/service_provider.dart';
import 'package:sssv1/providers/sub_category_list.dart';
import 'package:sssv1/providers/sub_category_provider.dart';
import 'package:sssv1/providers/test_provider.dart';
import 'package:sssv1/providers/user_provider.dart';
import 'package:sssv1/screens/NewUserProfile.dart';
import 'package:sssv1/screens/SubCategoryList.dart';
import 'package:sssv1/screens/userprofile_test.dart';
import 'package:sssv1/test.dart';
import 'package:sssv1/test2.dart';
import 'package:sssv1/widgets/Categories.dart';

import 'package:sssv1/widgets/amenities.dart';
import 'package:sssv1/widgets/category_grid.dart';
import 'package:sssv1/widgets/restaurent.dart';

import 'package:sssv1/widgets/subcategory.dart';

import 'Reviews Section/showall_reviews_test.dart';
import 'chat/chatlist.dart';
import 'favorite_test.dart';
import 'login/google_signinPages/google_login_controller.dart';
import 'login/redirection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<businessProvider>(
      create: (_) => businessProvider(),
    ),
    ChangeNotifierProvider<SubcategoryListProvider>(
      create: (_) => SubcategoryListProvider(),
    ),
    ChangeNotifierProvider<BusinessProfileProvider>(
      create: (_) => BusinessProfileProvider(),
    ),
    ChangeNotifierProvider<AskCommunityProvider>(
      create: (_) => AskCommunityProvider(),
    ),
    ChangeNotifierProvider<CommentSectionProvider>(
      create: (_) => CommentSectionProvider(),
    ),
    ChangeNotifierProvider<CommentSectionProviderNew>(
      create: (_) => CommentSectionProviderNew(),
    ),
    ChangeNotifierProvider<GoogleSignInController>(
      create: (_) => GoogleSignInController(),
    ),
    ChangeNotifierProvider<HomeRestaurantListProvider>(
      create: (_) => HomeRestaurantListProvider(),
    ),
    ChangeNotifierProvider<UserProvider>(
      create: (_) => UserProvider(),
    ),
    ChangeNotifierProvider<ServicesProvider>(
      create: (_) => ServicesProvider(),
    ),
    ChangeNotifierProvider<NearbyCommentProvider>(
      create: (_) => NearbyCommentProvider(),
    ),
    ChangeNotifierProvider<FavouriteProvider>(
      create: (_) => FavouriteProvider(),
    ),
    ChangeNotifierProvider<UserCommentsProvider>(
      create: (_) => UserCommentsProvider(),
    ),
    ChangeNotifierProvider<LiveUserLocation>(
      create: (_) => LiveUserLocation(),
    ),
    ChangeNotifierProvider<HomePopularListProvider>(
      create: (_) => HomePopularListProvider(),
    ),
    ChangeNotifierProvider<ChatProvider>(
      create: (_) => ChatProvider(),
    ),
    ChangeNotifierProvider<BusinessCategoriesProviderNew>(
      create: (_) => BusinessCategoriesProviderNew(),
    ),
    ChangeNotifierProvider<UserActivityProvider>(
        create: (_) => UserActivityProvider()),
    ChangeNotifierProvider<BusinessCategoriesProvider>(
        create: (_) => BusinessCategoriesProvider()),
    ChangeNotifierProvider<HouseProvider>(create: (context) => HouseProvider()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  // final serviceProvider restaurentProv = serviceProvider();

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      // home: SearchLocationScreen(),
      // home:CommentSection(index: 1),
      // home: AskForCommunityUiTest(uid: "SWEFOO1111111111"),
      // home: DefaultProfilePage(uid: ""),
      home: redirection(), //this is default
      // home:ChatScreen(
      //   businessId: "hfhfhhfh",
      //   // conversationId: "A1B2C3D4E5F67890AABBCCDD",
      //   conversationId: "nI63HUrLNBQk77aEHY",
      //   userId: "raju",
      // ),
      // home:test2()
      // home: ProfilePage(),
      // home: DefaultProfilePageTest(uid: 'FIOPLKJJNVVFD45790',),
    );
  }
}


// "Every setback is a lesson in disguise; while we didn’t reach the goal this time, we’ve grown stronger, smarter, and more resilient for the journey ahead."