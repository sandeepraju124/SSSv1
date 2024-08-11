import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sssv1/providers/BusinessCategoriesProvider.dart';
import 'package:sssv1/providers/BusinessCategoriesProviderNew.dart';
import 'package:sssv1/screens/SubCategoryList.dart';
import 'package:sssv1/utils/constants.dart';
import 'package:sssv1/utils/navigator.dart';

import 'Services (top) of homepage section/icons.dart';

class AllSubcategoriesPageNew extends StatefulWidget {
  @override
  State<AllSubcategoriesPageNew> createState() => _AllSubcategoriesPageNewState();
}

class _AllSubcategoriesPageNewState extends State<AllSubcategoriesPageNew> with SingleTickerProviderStateMixin {
  Map<String, List<Subcategory>> _categories = {};
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _controller.forward();

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
    var data = Provider.of<BusinessCategoriesProviderNew>(context);
    return Scaffold(
      backgroundColor: secondaryColor5LightTheme,
      appBar: AppBar(
        backgroundColor: tgDarkPrimaryColor,
        title: const Text(
          'Select your Business Category',
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
        // itemCount: _categories.keys.length,
        itemCount: data.allCategories.keys.length,
        itemBuilder: (context, index) {
          String categoryName = data.allCategories.keys.elementAt(index);
          // List<Subcategory> subcategories = _categories[categoryName]!;
          List<Subcategory> subcategories = data.allCategories[categoryName]!;

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
                          // Handle on tap
                          print(" $categoryName > ${subcategory.subcategory}");
                          navigatorPush(context, SubCategoryList(
                            keyy: "sub_category",
                            value: subcategory.subcategory,
                          ));
                          // CustomOnboardingService
                          // navigatorPush(
                          //     context,
                          //     CustomOnboardingService(
                          //       category: categoryName,
                          //       Subcategory: subcategory.subcategory,
                          //     ));
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
                      ),
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


// class AllSubcategoriesPageNew extends StatefulWidget {
//   @override
//   State<AllSubcategoriesPageNew> createState() => _AllSubcategoriesPageNewState();
// }
//
// class _AllSubcategoriesPageNewState extends State<AllSubcategoriesPageNew> {
//
//   @override
//   Widget build(BuildContext context) {
//     // var data = Provider.of<BusinessCategoriesProviderNew>(context);
//     return Consumer<BusinessCategoriesProviderNew>(
//         builder: (ctx, data, _) {
//           if (data.isLoading) {
//             return Shimmer.fromColors(
//               baseColor: Colors.grey[300]!,
//               highlightColor: Colors.grey[100]!,
//               child: Container(
//                 width: MediaQuery
//                     .of(context)
//                     .size
//                     .width,
//                 height: MediaQuery
//                     .of(context)
//                     .size
//                     .height,
//                 color: Colors.white,
//               ),
//             );
//           } else if (data.allCategories.isEmpty) {
//             return Center(child: Text("No categories available"));
//           } else {
//             return ListView.builder(
//               // itemCount: _categories.keys.length,
//                 itemCount: data.allCategories.keys.length,
//                 itemBuilder: (context, index) {
//                   String categoryName = data.allCategories.keys.elementAt(
//                       index);
//                   // List<Subcategory> subcategories = _categories[categoryName]!;
//                   List<Subcategory> subcategories = data
//                       .allCategories[categoryName]!;
//
//                   return Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(
//                           left: 15,
//                           top: 15,
//                         ),
//                         child: Text(
//                           "$categoryName:",
//                           style: TextStyle(
//                             fontSize: 15.5,
//                             fontWeight: FontWeight.w500,
//                             color: secondaryColor60LightTheme,
//                           ),
//                         ),
//                       ),
//                       GridView.builder(
//                         shrinkWrap: true,
//                         physics: const NeverScrollableScrollPhysics(),
//                         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 4,
//                           mainAxisSpacing: 11,
//                         ),
//                         itemCount: subcategories.length,
//                         itemBuilder: (context, subIndex) {
//                           Subcategory subcategory = subcategories[subIndex];
//
//                           return GestureDetector(
//                             onTap: () {
//                               // Handle on tap
//                               print(" $categoryName > ${subcategory
//                                   .subcategory}");
//                               navigatorPush(context, SubCategoryList(
//                                 keyy: "sub_category",
//                                 value: subcategory.subcategory,
//                               ));
//                               // CustomOnboardingService
//                               // navigatorPush(
//                               //     context,
//                               //     CustomOnboardingService(
//                               //       category: categoryName,
//                               //       Subcategory: subcategory.subcategory,
//                               //     ));
//                             },
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Container(
//                                   height: 40,
//                                   width: 40,
//                                   decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     shape: BoxShape.circle,
//                                   ),
//                                   child: Icon(
//                                     getIconForSubcategory(
//                                         subcategory.subcategory),
//                                     size: 26,
//                                     color: Colors.teal.shade900,
//                                   ),
//                                 ),
//                                 SizedBox(height: 8),
//                                 Text(
//                                   subcategory.subcategory,
//                                   style: TextStyle(
//                                       color: Colors.black87,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w400),
//                                   textAlign: TextAlign.center,
//                                   overflow: TextOverflow.ellipsis,
//                                 ),
//                               ],
//                             ),
//                           );
//                         },
//                       ),
//                       const Divider(
//                         indent: 7,
//                         endIndent: 7,
//                         color: Color.fromARGB(255, 211, 222, 226),
//                         thickness: 1,
//                       ),
//                     ],
//                   );
//                 });
//           }
//         });
//   }
// }
