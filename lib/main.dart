// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sssv1/comments/commentpost.dart';
import 'package:sssv1/providers/askcommunity_provider.dart';
import 'package:sssv1/providers/business_profile_provider.dart';
import 'package:sssv1/providers/rescomments_provider.dart';
import 'package:sssv1/providers/sub_category_list.dart';
import 'package:sssv1/providers/sub_category_provider.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/providers/service_provider.dart';
import 'package:sssv1/providers/test_provider.dart';
import 'package:sssv1/providers/user_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sssv1/screens/Askthecommunity.dart';
import 'package:sssv1/screens/askcommunity_UI_test.dart';
import 'package:sssv1/widgets/restaurent.dart';
import 'package:sssv1/widgets/category_grid.dart';
import 'package:sssv1/widgets/subcategory.dart';

import './login/google_login_controller.dart';
import 'package:sssv1/firebase_options.dart';

import 'login/redirection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(providers: [

    ChangeNotifierProvider<testProvider>(
      create: (_) => testProvider(),
    ),
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
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  // final serviceProvider restaurentProv = serviceProvider();

  MyApp({Key? key}) : super(key: key);

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
      home: AskForCommunityUiTest(uid: "SWEFOO1234567890"),
      // home: redirection(),
      // home: CommentPost(),

      // home: ShowModalComment(),
      // home:UserProfile(),
      // // home: BottomNavPage(),
      // home: BottomNavPage(),
    );
  }
}
