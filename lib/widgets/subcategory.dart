// // ignore_for_file: must_be_immutable, prefer_const_constructors

// import "package:flutter/foundation.dart";
// import "package:flutter/material.dart";
// import "package:sssv1/providers/sub_category_provider.dart";
// import 'package:provider/provider.dart';
// import "package:sssv1/utils/constants.dart";
// import "package:sssv1/utils/navigator.dart";
// import 'package:sssv1/screens/SubCategoryList.dart';

// class Subcategory extends StatefulWidget {
//   final String subCat;

//   Subcategory({Key? key, required this.subCat}) : super(key: key);
//   @override
//   State<Subcategory> createState() => _SubcategoryState();
// }

// class _SubcategoryState extends State<Subcategory> {
//   Map<String, String> categoryGifs = {
//     'Indian Restaurant': 'images/subcategoryimages/indianres.gif',
//     'bakeries': 'images/subcategoryimages/bakery.gif',
//     'restaurant': 'images/subcategoryimages/restaurant.gif',
//     'Pizzeria': 'images/subcategoryimages/pizza.gif',
//     'Grocery Store': 'images/subcategoryimages/grocery.gif',
//     'Coffee & Tea': 'images/subcategoryimages/coffee.gif'
//     // Add more categories and their corresponding GIF image paths here
//   };

//   @override
//   void initState() {
//     super.initState();
//     var data = Provider.of<SubcategoryProvider>(context, listen: false);
//     data.subCategoryProvider(widget.subCat);
//     // print("init called");
//   }

//   @override
//   Widget build(BuildContext context) {
//     // print("build");
//     var data = Provider.of<SubcategoryProvider>(context);
//     // print('loading1 ${data.isLoading}');
//     // data.subCategoryProvider(widget.subCat);
//     // print('loading2 ${data.isLoading}');

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           widget.subCat,
//           style: TextStyle(color: Colors.white),
//         ),
//         // backgroundColor: Color.fromARGB(255, 78, 155, 151),
//         backgroundColor: tgAccentColor,
//       ),
//       body: data.isLoading
//           ? Center(
//               child: Image.asset("images/loading.gif"),
//             )
//           :
//           // data.isLoading  ? Center(child: CircularProgressIndicator()) :
//           Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: GridView.builder(
//                 itemCount: data.subcategoryData?.subcategories.length,
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 20,
//                   mainAxisSpacing: 20,
//                   // childAspectRatio: 170 / 250,
//                   childAspectRatio: 150 / 230,
//                 ),
//                 itemBuilder: (BuildContext context, int index) {
//                   final category = data.subcategoryData!.subcategories[index];
//                   // print(category);

//                   final gifImage = categoryGifs[category] ?? 'images/food.gif';

//                   return SizedBox(
//                     // height: 220,
//                     // width: 150,
//                     // color: Colors.amber,
//                     child: GestureDetector(
//                       onTap: () {
//                         Navigators().navigatorPush(
//                             context,
//                             SubCategoryList(
//                               subCat: category
//                             ),);
//                         // print(data.subcategoryData!.subcategories[int]);
//                         // print("clicked");
//                       },
//                       child: Column(children: [
//                         Expanded(
//                           flex: 78,
//                           child: Stack(
//                             children: [
//                               Container(
//                                 decoration: BoxDecoration(
//                                     color: Colors.cyanAccent,
//                                     borderRadius: BorderRadius.circular(10),
//                                     image: const DecorationImage(
//                                         image: AssetImage(
//                                           "images/darkback2.jpg",
//                                         ),
//                                         fit: BoxFit.cover),),
//                               ),
//                               Align(
//                                 alignment: Alignment.center,
//                                 child: Container(
//                                     height: 85,
//                                     width: 85,
//                                     // color: Colors.lightGreen,
//                                     decoration: BoxDecoration(
//                                       color: Colors.black38,
//                                       borderRadius: BorderRadius.circular(100),
//                                       image: const DecorationImage(
//                                         image: AssetImage(gifImage),
//                                         fit: BoxFit.fill,
//                                       ),
//                                       // shape: BoxShape.circle
//                                     )),
//                               )
//                             ],
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 13,
//                         ),
//                         Expanded(
//                           flex: 22,
//                           child: Container(
//                             width: double.infinity,
//                             decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(10),
//                                 border: Border.all(color: tgPrimaryColor)),
//                             child: Center(
//                                 child: Text(
//                               category,
//                               style: const TextStyle(color: Colors.black54),
//                             )),
//                           ),
//                         )
//                       ]),
//                     ),
//                   );
//                 },
//               ),
//             ),
//     );
//   }
// }

// // ignore_for_file: must_be_immutable, prefer_const_constructors

// import "package:flutter/material.dart";
// import "package:sssv1/providers/sub_category_provider.dart";
// import 'package:provider/provider.dart';
// import "package:sssv1/utils/constants.dart";
// import "package:sssv1/utils/navigator.dart";
// import 'package:sssv1/screens/SubCategoryList.dart';

// class Subcategory extends StatefulWidget {
//   String subCat;
//   Subcategory({super.key, required this.subCat});

//   @override
//   State<Subcategory> createState() => _SubcategoryState();
// }

// class _SubcategoryState extends State<Subcategory> {
//   @override
//   void initState() {
//     super.initState();
//     var data = Provider.of<SubcategoryProvider>(context, listen: false);
//     data.subCategoryProvider(widget.subCat);
//     // print("init called");
//   }

//   @override
//   Widget build(BuildContext context) {
//     // print("build");
//     var data = Provider.of<SubcategoryProvider>(context);
//     // print('loading1 ${data.isLoading}');
//     // data.subCategoryProvider(widget.subCat);
//     // print('loading2 ${data.isLoading}');

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           widget.subCat,
//           style: TextStyle(color: Colors.white),
//         ),
//         // backgroundColor: Color.fromARGB(255, 78, 155, 151),
//         backgroundColor: tgAccentColor,
//       ),
//       body: data.isLoading
//           ? Center(
//               child: Image.asset("images/loading.gif"),
//             )
//           :
//           // data.isLoading  ? Center(child: CircularProgressIndicator()) :
//           Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: GridView.builder(
//                 itemCount: data.subcategoryData?.subcategories.length,
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 20,
//                   mainAxisSpacing: 20,
//                   // childAspectRatio: 170 / 250,
//                   childAspectRatio: 150 / 230,
//                 ),
//                 itemBuilder: (BuildContext context, int int) {
//                   return SizedBox(
//                     // height: 220,
//                     // width: 150,
//                     // color: Colors.amber,
//                     child: GestureDetector(
//                       onTap: () {
//                         Navigators().navigatorPush(
//                             context,
//                             SubCategoryList(
//                               subCat: data.subcategoryData!.subcategories[int]
//                                   .toString(),
//                             ));
//                         // print(data.subcategoryData!.subcategories[int]);
//                         // print("clicked");
//                       },
//                       child: Column(children: [
//                         Expanded(
//                           flex: 78,
//                           child: Stack(
//                             children: [
//                               Container(
//                                 decoration: BoxDecoration(
//                                     color: Colors.cyanAccent,
//                                     borderRadius: BorderRadius.circular(10),
//                                     image: const DecorationImage(
//                                         image: AssetImage(
//                                           "images/darkback2.jpg",
//                                         ),
//                                         fit: BoxFit.cover)),
//                               ),
//                               Align(
//                                 alignment: Alignment.center,
//                                 child: Container(
//                                     height: 85,
//                                     width: 85,
//                                     // color: Colors.lightGreen,
//                                     decoration: BoxDecoration(
//                                       color: Colors.black38,
//                                       borderRadius: BorderRadius.circular(100),
//                                       image: const DecorationImage(
//                                         image: AssetImage("images/food.gif"),
//                                         fit: BoxFit.fill,
//                                       ),
//                                       // shape: BoxShape.circle
//                                     )),
//                               )
//                             ],
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 13,
//                         ),
//                         Expanded(
//                           flex: 22,
//                           child: Container(
//                             width: double.infinity,
//                             decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(10),
//                                 border: Border.all(color: tgPrimaryColor)),
//                             child: Center(
//                                 child: Text(
//                               data.subcategoryData!.subcategories[int]
//                                   .toString(),
//                               style: const TextStyle(color: Colors.black54),
//                             )),
//                           ),
//                         )
//                       ]),
//                     ),
//                   );
//                 },
//               ),
//             ),
//     );
//   }
// }

// ignore_for_file: must_be_immutable, prefer_const_constructors

import "package:flutter/material.dart";
import "package:sssv1/providers/sub_category_provider.dart";
import 'package:provider/provider.dart';
import "package:sssv1/utils/constants.dart";
import "package:sssv1/utils/navigator.dart";
import 'package:sssv1/screens/SubCategoryList.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class Subcategory extends StatefulWidget {
  String subCat;

  Subcategory({super.key, required this.subCat});

  @override
  State<Subcategory> createState() => _SubcategoryState();
}

class _SubcategoryState extends State<Subcategory> {
  Map<String, String> categoryGifs = {
    'Indian Restaurant': 'images/subcategoryimages/indianres.gif',
    'bakeries': 'images/subcategoryimages/bakery.gif',
    'restaurant': 'images/subcategoryimages/restaurant.gif',
    'Pizzeria': 'images/subcategoryimages/pizza.gif',
    'Grocery Store': 'images/subcategoryimages/grocery.gif',
    'Coffee & Tea': 'images/subcategoryimages/coffee.gif'
    // Add more categories and their corresponding GIF image paths here
  };

  @override
  void initState() {
    super.initState();
    var data = Provider.of<SubcategoryProvider>(context, listen: false);
    data.subCategoryProvider(widget.subCat);
  }

  // Future<void> saveBusinessDetails(
  //     String businessName, String businessUid) async {
  //   await FirebaseFirestore.instance.collection("businessdetails").add({
  //     "businessName": businessName,
  //     "businessUid": businessUid,
  //     "subcategory": widget.subCat,
  //     // Add more details here as needed
  //   });
  // }

  // print(businessdetails) {
  //   // TODO: implement print
  //   throw UnimplementedError();
  // }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<SubcategoryProvider>(context);

    return Scaffold(
      backgroundColor: secondaryColor10LightTheme,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(LineAwesomeIcons.angle_left)),
        title: Text(
          widget.subCat,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: tgAccentColor,
      ),
      body: data.isLoading
          ? Center(
              child: Image.asset("images/loading.gif"),
            )
          : Padding(
              padding: const EdgeInsets.all(15.0),
              child: GridView.builder(
                itemCount: data.subcategoryData?.subcategories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 150 / 230,
                ),
                itemBuilder: (BuildContext context, int index) {
                  final category = data.subcategoryData!.subcategories[index];
                  // print(category);

                  final gifImage = categoryGifs[category] ?? 'images/food.gif';

                  return SizedBox(
                    child: GestureDetector(
                      onTap: () {
                        Navigators().navigatorPush(
                          context,
                          SubCategoryList(
                            subCat: category,
                          ),
                        );

                        // saveBusinessDetails(category, "businessUid");
                      },
                      child: Column(
                        children: [
                          Expanded(
                            flex: 78,
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.cyanAccent,
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: AssetImage('images/darkback.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    height: 115,
                                    width: 115,
                                    decoration: BoxDecoration(
                                      color: Colors.black38,
                                      borderRadius: BorderRadius.circular(80),
                                      image: DecorationImage(
                                        image: AssetImage(gifImage),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 13,
                          ),
                          Expanded(
                            flex: 22,
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: tgPrimaryColor),
                              ),
                              child: Center(
                                child: Text(
                                  category,
                                  style: const TextStyle(color: Colors.black54),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
