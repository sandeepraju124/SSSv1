// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:sssv1/providers/allbusinesses.dart';
import 'package:sssv1/screens/postcomment.dart';
import 'package:sssv1/screens/search.dart';
import 'package:sssv1/screens/test.dart';
import 'package:sssv1/widgets/showcomment.dart';
import 'package:sssv1/providers/askcommunity_provider.dart';
import 'package:sssv1/providers/business_profile_provider.dart';
import 'package:sssv1/providers/comments_provider.dart';
import 'package:sssv1/providers/restaurent_provider.dart';
import 'package:sssv1/providers/sub_category_list.dart';
import 'package:sssv1/providers/sub_category_provider.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/providers/service_provider.dart';
import 'package:sssv1/providers/test_provider.dart';
import 'package:sssv1/providers/user_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sssv1/widgets/Askthecommunity.dart';
import 'package:sssv1/widgets/restaurent.dart';
import 'package:sssv1/widgets/category_grid.dart';
import 'package:sssv1/widgets/review_rating.dart';
import 'package:sssv1/widgets/subcategory.dart';
import 'package:sssv1/widgets/test.dart';

import './login/google_login_controller.dart';
import 'package:sssv1/firebase_options.dart';

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
      // home: RealEstateProfile(),
      // home:CommentSection(index: 1),
      // home: AskForCommunityUiTest(uid: "SWEFOO1111111111"),
      home: redirection(),
      // home: LocationTest(),

      // home: Test(),
      // home:UserProfile(),
      // // home: BottomNavPage(),
      // home: BottomNavPage(),
    );
  }
}
