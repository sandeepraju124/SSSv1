import 'package:flutter/material.dart';
import 'package:sssv1/providers/rescomments_provider.dart';
import 'package:sssv1/providers/restaurent_provider.dart';
import 'package:sssv1/providers/searchlist_provider.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/screens/homepage.dart';
import 'package:sssv1/screens/profile.dart';


void main() {

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<restaurentProvider>(
      create: (_) => restaurentProvider(),
    ),
    ChangeNotifierProvider<SearchlistProvider>(
      create: (_) => SearchlistProvider(),
    ),
    ChangeNotifierProvider<rescommentsProvider>(
      create: (_) => rescommentsProvider(),
    )
  ], child:  MyApp()));
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
      home: MyHomePage(),
      // home: const profile(),
    );
  }
}
