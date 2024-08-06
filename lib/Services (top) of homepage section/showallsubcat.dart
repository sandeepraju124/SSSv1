// // ignore_for_file: prefer_const_constructors

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';
// import 'package:http/http.dart' as http;
// import 'package:sssv1/Services%20(top)%20of%20homepage%20section/icons.dart';
// import 'package:sssv1/screens/SubCategoryList.dart';
// import 'package:sssv1/utils/constants.dart';

// class AllSubcategoriesPage extends StatefulWidget {
//   const AllSubcategoriesPage({super.key});

//   @override
//   State<AllSubcategoriesPage> createState() => _AllSubcategoriesPageState();
// }

// class _AllSubcategoriesPageState extends State<AllSubcategoriesPage> {
//   Map<String, List<Subcategory>> _categories = {};

//   @override
//   void initState() {
//     super.initState();
//     fetchAllCategories();
//   }

//   Future<void> fetchAllCategories() async {
//     try {
//       var response = await http.get(Uri.parse('$baseUrl/business_categories'));
//       if (response.statusCode == 200) {
//         var decodedResponse = json.decode(response.body);
//         Map<String, List<Subcategory>> categories = {};

//         for (var category in decodedResponse) {
//           category.forEach((key, value) {
//             if (key != "_id") {
//               categories[key] = List<Subcategory>.from(
//                   value.map((item) => Subcategory.fromJson(item)));
//             }
//           });
//         }

//         setState(() {
//           _categories = categories;
//         });
//       } else {
//         throw Exception('Failed to load categories');
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: secondaryColor5LightTheme,
//       appBar: AppBar(
//         backgroundColor: tgDarkPrimaryColor,
//         title: const Text(
//           'All Sub-Categories',
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//         ),
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(
//             LineAwesomeIcons.angle_left,
//             size: 17,
//           ),
//         ),
//       ),
//       body: ListView.builder(
//         itemCount: _categories.keys.length,
//         itemBuilder: (context, index) {
//           String categoryName = _categories.keys.elementAt(index);
//           List<Subcategory> subcategories = _categories[categoryName]!;

//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(
//                   left: 15,
//                   top: 15,
//                 ),
//                 child: Text(
//                   "$categoryName:",
//                   style: TextStyle(
//                     fontSize: 15.5,
//                     fontWeight: FontWeight.w500,
//                     color: secondaryColor60LightTheme,
//                   ),
//                 ),
//               ),
//               GridView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 4,
//                   mainAxisSpacing: 11,
//                 ),
//                 itemCount: subcategories.length,
//                 itemBuilder: (context, subIndex) {
//                   Subcategory subcategory = subcategories[subIndex];

//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (context) {
//                         return SubCategoryList(
//                           keyy: "sub_category",
//                           value: subcategory.subcategory,
//                         );
//                       }));
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.only(top: 22),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Material(
//                             elevation: 0.8,
//                             shape: const CircleBorder(),
//                             child: CircleAvatar(
//                               radius: 20,
//                               backgroundColor: Colors.white,
//                               child: Icon(
//                                 getIconForSubcategory(subcategory.subcategory),
//                                 size: 24.0,
//                                 color: Colors.teal.shade900,
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: 8),
//                           Text(
//                             subcategory.subcategory,
//                             style: TextStyle(
//                                 color: Colors.black87,
//                                 fontSize: 11,
//                                 fontWeight: FontWeight.w400),
//                             textAlign: TextAlign.center,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//               const Divider(
//                 indent: 7,
//                 endIndent: 7,
//                 color: Color.fromARGB(255, 211, 222, 226),
//                 thickness: 1,
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

// class Subcategory {
//   final int priority;
//   final String subcategory;

//   Subcategory({required this.priority, required this.subcategory});

// // ignore_for_file: prefer_const_constructors

// ignore_for_file: prefer_const_constructors

//   factory Subcategory.fromJson(Map<String, dynamic> json) {
//     return Subcategory(
//       priority: json['priority'],
//       subcategory: json['subcategory'],
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:sssv1/Services%20(top)%20of%20homepage%20section/icons.dart';
import 'package:sssv1/screens/SubCategoryList.dart';
import 'package:sssv1/utils/constants.dart';

class AllSubcategoriesPage extends StatefulWidget {
  const AllSubcategoriesPage({super.key});

  @override
  State<AllSubcategoriesPage> createState() => _AllSubcategoriesPageState();
}

class _AllSubcategoriesPageState extends State<AllSubcategoriesPage>
    with SingleTickerProviderStateMixin {
  Map<String, List<Subcategory>> _categories = {};
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    fetchAllCategories();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> fetchAllCategories() async {
    try {
      var response = await http.get(Uri.parse('$baseUrl/business_categories'));
      if (response.statusCode == 200) {
        var decodedResponse = json.decode(response.body);
        Map<String, List<Subcategory>> categories = {};

        for (var category in decodedResponse) {
          category.forEach((key, value) {
            if (key != "_id") {
              categories[key] = List<Subcategory>.from(
                  value.map((item) => Subcategory.fromJson(item)));
            }
          });
        }

        setState(() {
          _categories = categories;
        });

        _controller.forward();
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      // print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor5LightTheme,
      appBar: AppBar(
        backgroundColor: tgDarkPrimaryColor,
        title: const Text(
          'All Sub-Categories',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            LineAwesomeIcons.angle_left,
            size: 17,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: _categories.keys.length,
        itemBuilder: (context, index) {
          String categoryName = _categories.keys.elementAt(index);
          List<Subcategory> subcategories = _categories[categoryName]!;

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$categoryName:",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: secondaryColor60LightTheme,
                  ),
                ),
                SizedBox(height: 23),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, // Number of columns
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 15,
                    childAspectRatio: 0.9,
                  ),
                  itemCount: subcategories.length,
                  itemBuilder: (context, subIndex) {
                    Subcategory subcategory = subcategories[subIndex];
                    return FadeTransition(
                      opacity: _controller.drive(
                        CurveTween(curve: Curves.fastOutSlowIn),
                      ),
                      child: ScaleTransition(
                        scale: _controller.drive(
                          CurveTween(curve: Curves.fastOutSlowIn),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return SubCategoryList(
                                keyy: "sub_category",
                                value: subcategory.subcategory,
                              );
                            }));
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Material(
                                elevation: 0.8,
                                shape: const CircleBorder(),
                                child: CircleAvatar(
                                  radius: 21,
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    getIconForSubcategory(
                                        subcategory.subcategory),
                                    size: 20,
                                    color: Colors.teal.shade900,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                subcategory.subcategory,
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                if (index < _categories.keys.length - 1)
                  Divider(
                    color: Colors.grey.shade400,
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Subcategory {
  final int priority;
  final String subcategory;

  Subcategory({required this.priority, required this.subcategory});

  factory Subcategory.fromJson(Map<String, dynamic> json) {
    return Subcategory(
      priority: json['priority'],
      subcategory: json['subcategory'],
    );
  }
}
