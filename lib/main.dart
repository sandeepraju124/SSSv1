// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sssv1/providers/rescomments_provider.dart';
import 'package:sssv1/providers/searchlist_provider.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/providers/service_provider.dart';
import 'package:sssv1/providers/user_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sssv1/screens/bottomnav.dart';
import './login/google_login_controller.dart';
import 'package:sssv1/firebase_options.dart';

import 'login/redirection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<serviceProvider>(
      create: (_) => serviceProvider(),
    ),
    ChangeNotifierProvider<SearchlistProvider>(
      create: (_) => SearchlistProvider(),
    ),
    ChangeNotifierProvider<commentsProvider>(
      create: (_) => commentsProvider(),
    ),
    ChangeNotifierProvider<UserProvider>(
      create: (_) => UserProvider(),
    ),
    ChangeNotifierProvider<GoogleSignInController>(
      create: (_) => GoogleSignInController(),
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  final serviceProvider restaurentProv = serviceProvider();

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
      // home: CategoryGrid(),
      home: redirection(),
      // home: BottomNavPage(),
    );
  }
}
