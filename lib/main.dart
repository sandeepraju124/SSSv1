// ignore_for_file: prefer_const_constructors, unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/Askcommunity%20Section/Askthecommunity.dart';
import 'package:sssv1/HousingServices/house_search.dart';
import 'package:sssv1/HousingServices/overview.dart';
import 'package:sssv1/HousingServices/test.dart';
import 'package:sssv1/NewdefaultprofilePage/defaultpage&tabview.dart';
import 'package:sssv1/Reviews%20Section/postcomment.dart';
import 'package:sssv1/User_Activity%20Section/user_activity_provider.dart';
import 'package:sssv1/firebase_options.dart';
import 'package:sssv1/providers/allbusinesses.dart';
import 'package:sssv1/providers/askcommunity_provider.dart';
import 'package:sssv1/providers/business_profile_provider.dart';
import 'package:sssv1/providers/comments_provider.dart';
import 'package:sssv1/providers/live_user_location.dart';
import 'package:sssv1/providers/restaurent_provider.dart';
import 'package:sssv1/providers/service_provider.dart';
import 'package:sssv1/providers/sub_category_list.dart';
import 'package:sssv1/providers/sub_category_provider.dart';
import 'package:sssv1/providers/test_provider.dart';
import 'package:sssv1/providers/user_provider.dart';
import 'package:sssv1/screens/NewUserProfile.dart';
import 'package:sssv1/screens/SubCategoryList.dart';
import 'package:sssv1/testing.dart';

import 'package:sssv1/widgets/amenities.dart';
import 'package:sssv1/widgets/category_grid.dart';
import 'package:sssv1/widgets/restaurent.dart';

import 'package:sssv1/widgets/subcategory.dart';

import 'login/google_signinPages/google_login_controller.dart';
import 'login/redirection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<SubcategoryProvider>(
      create: (_) => SubcategoryProvider(),
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
    ChangeNotifierProvider<AllBusinessListProvider>(
      create: (_) => AllBusinessListProvider(),
    ),
    ChangeNotifierProvider<GoogleSignInController>(
      create: (_) => GoogleSignInController(),
    ),
    ChangeNotifierProvider<RestaurantListProvider>(
      create: (_) => RestaurantListProvider(),
    ),
    ChangeNotifierProvider<UserProvider>(
      create: (_) => UserProvider(),
    ),
    ChangeNotifierProvider<LiveUserLocation>(
      create: (_) => LiveUserLocation(),
    ),
    ChangeNotifierProvider<UserActivityProvider>(
        create: (_) => UserActivityProvider()),
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
        primarySwatch: Colors.blue,
      ),
      // home: SearchLocationScreen(),
      // home:CommentSection(index: 1),
      // home: AskForCommunityUiTest(uid: "SWEFOO1111111111"),

      // home: DefaultProfilePage(uid: ""),
      home: redirection(),
    );
  }
}
