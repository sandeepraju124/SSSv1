// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sssv1/providers/rescomments_provider.dart';
import 'package:sssv1/providers/restaurent_provider.dart';
import 'package:sssv1/providers/searchlist_provider.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/providers/user_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import './login/google_login_controller.dart';
import 'package:sssv1/firebase_options.dart';
import './login/redirection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<restaurentProvider>(
      create: (_) => restaurentProvider(),
    ),
    ChangeNotifierProvider<SearchlistProvider>(
      create: (_) => SearchlistProvider(),
    ),
    ChangeNotifierProvider<rescommentsProvider>(
      create: (_) => rescommentsProvider(),
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
  final restaurentProvider restaurentProv = restaurentProvider();

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
      // home: MyHomePage(),
      home: redirection(),
    );
  }
}
