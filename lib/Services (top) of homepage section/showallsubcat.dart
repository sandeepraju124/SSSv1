// import 'package:flutter/material.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';
// import 'package:sssv1/Services%20(top)%20of%20homepage%20section/icons.dart';
// import 'package:sssv1/models/newbusinees_categories.dart';
// import 'package:sssv1/screens/SubCategoryList.dart';
// import 'package:sssv1/utils/constants.dart';

// class AllSubcategoriesPage extends StatefulWidget {
//   final Map<String, List<BeautySpa>> subcategories;

//   AllSubcategoriesPage({Key? key, required this.subcategories})
//       : super(key: key);

//   @override
//   State<AllSubcategoriesPage> createState() => _AllSubcategoriesPageState();
// }

// class _AllSubcategoriesPageState extends State<AllSubcategoriesPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: secondaryColor5LightTheme,
//       appBar: AppBar(
//         backgroundColor: tgDarkPrimaryColor,
//         title: const Text(
//           'All Subcategories',
//           style: TextStyle(fontSize: 17),
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
//         itemCount: widget.subcategories.length,
//         itemBuilder: (context, index) {
//           String categoryName = widget.subcategories.keys.elementAt(index);
//           List<BeautySpa> subcategories = widget.subcategories[categoryName]!;

//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   " $categoryName: ",
//                   style: TextStyle(
//                     fontSize: 15.5,
//                     fontWeight: FontWeight.w300,
//                     color: secondaryColor60LightTheme,
//                   ),
//                 ),
//               ),
//               GridView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 4, // number of items in a row
//                   mainAxisSpacing: 11, // space between rows
//                 ),
//                 itemCount: subcategories.length,
//                 itemBuilder: (context, subIndex) {
//                   BeautySpa subcategory = subcategories[subIndex];

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
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                           height: 40,
//                           width: 40,
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             shape: BoxShape.circle,
//                           ),
//                           child: Icon(
//                             getIconForSubcategory(subcategory
//                                 .subcategory), // Use your function to get the icon
//                             size: 26,
//                             color: Colors.teal.shade900,
//                           ),
//                         ),
//                         SizedBox(height: 8),
//                         Text(
//                           subcategory.subcategory,
//                           style: TextStyle(
//                             color: Colors.black87, // replace with your color
//                             fontSize: 10.1,
//                           ),
//                           textAlign: TextAlign.center,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ],
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

// ignore_for_file: prefer_const_constructors

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

class _AllSubcategoriesPageState extends State<AllSubcategoriesPage> {
  Map<String, List<Subcategory>> _categories = {};

  @override
  void initState() {
    super.initState();
    fetchAllCategories();
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
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      print(e);
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

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  top: 15,
                ),
                child: Text(
                  "$categoryName:",
                  style: TextStyle(
                    fontSize: 15.5,
                    fontWeight: FontWeight.w500,
                    color: secondaryColor60LightTheme,
                  ),
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 11,
                ),
                itemCount: subcategories.length,
                itemBuilder: (context, subIndex) {
                  Subcategory subcategory = subcategories[subIndex];

                  return GestureDetector(
                    // onTap: () {
                    //   // Handle on tap
                    //   print(" $categoryName > ${subcategory.subcategory}");
                    //   // CustomOnboardingService
                    //   navigatorPush(
                    //       context,
                    //       CustomOnboardingService(
                    //         category: categoryName,
                    //         Subcategory: subcategory.subcategory,
                    //       ));
                    // },
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            getIconForSubcategory(subcategory.subcategory),
                            size: 26,
                            color: Colors.teal.shade900,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          subcategory.subcategory,
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 11,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  );
                },
              ),
              const Divider(
                indent: 7,
                endIndent: 7,
                color: Color.fromARGB(255, 211, 222, 226),
                thickness: 1,
              ),
            ],
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
