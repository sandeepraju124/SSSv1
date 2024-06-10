// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:flutter/material.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';
// import 'package:provider/provider.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:sssv1/Services%20(top)%20of%20homepage%20section/icons.dart';
// import 'package:sssv1/Services%20(top)%20of%20homepage%20section/showallsubcat.dart';
// import 'package:sssv1/providers/BusinessCategoriesProvider.dart';
// import 'package:sssv1/screens/SubCategoryList.dart';
// import 'package:sssv1/utils/constants.dart';

// class OurTopPick extends StatefulWidget {
//   const OurTopPick({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<OurTopPick> createState() => _OurTopPickState();
// }

// class _OurTopPickState extends State<OurTopPick> {
//   late BusinessCategoriesProvider businessServicesProvider;

//   @override
//   void initState() {
//     super.initState();
//     businessServicesProvider =
//         Provider.of<BusinessCategoriesProvider>(context, listen: false);
//     businessServicesProvider.fetchAllCategories();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<BusinessCategoriesProvider>(
//         builder: (ctx, businessServicesProvider, _) {
//       if (businessServicesProvider.isLoading) {
//         return Shimmer.fromColors(
//           baseColor: Colors.grey[300]!,
//           highlightColor: Colors.grey[100]!,
//           child: Container(
//             width: MediaQuery.of(context).size.width, // Use screen width
//             height: MediaQuery.of(context).size.height, // Use screen height
//             // height: double.infinity,
//             color: Colors.white,
//           ),
//         );
//       } else {
//         return Padding(
//           padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//           child: Container(
//             margin: const EdgeInsets.only(right: 8),
//             height: 200,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.black12, width: 1),
//               color: secondaryColor5LightTheme,
//               borderRadius: const BorderRadius.all(Radius.circular(10)),
//             ),
//             child: GridView.builder(
//               itemCount: businessServicesProvider.categories.length,
//                   // ? 8
//                   // : businessServicesProvider.subcategories.length,
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 4, // number of items in a row
//                 crossAxisSpacing: 10,
//                 mainAxisSpacing: 10,
//                 childAspectRatio: 1,
//               ),
//               itemBuilder: (ctx, i) {
//                 if (i == 7 &&
//                     businessServicesProvider.subcategories.length > 7) {
//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (context) {
//                         return AllSubcategoriesPage(
//                             subcategories:
//                                 businessServicesProvider.subcategories);
//                       }));
//                     },
//                     child: GridTile(
//                       child: Padding(
//                         padding: const EdgeInsets.only(top: 34),
//                         child: Center(
//                             child: Column(
//                           children: [
//                             Text(
//                               'View all',
//                               style: TextStyle(
//                                   fontSize: 13,
//                                   color: secondaryColor60LightTheme),
//                             ),
//                             Icon(
//                               LineAwesomeIcons.arrow_right,
//                               size: 10,
//                             ),
//                           ],
//                         )),
//                       ),
//                     ),
//                   );
//                 } else {
//                   return GridTile(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.push(context,
//                                 MaterialPageRoute(builder: (context) {
//                               return SubCategoryList(
//                                   keyy: "sub_category",
//                                   value: businessServicesProvider
//                                       .subcategories[i]);
//                             }));
//                           },
//                           child: Container(
//                             height: 40,
//                             width: 40, // Adjust the size as needed
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               shape: BoxShape.circle,
//                             ),
//                             child: Icon(
//                               // Replace with an icon based on subcategory if needed

//                               // LineAwesomeIcons.car, // Placeholder icon

//                               getIconForSubcategory(
//                                   businessServicesProvider.subcategories[i]),
//                               size: 26,
//                               // color: tgDarkPrimaryColor,
//                               // color: secondaryColor40LightTheme,
//                               color: Colors.teal.shade900,
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 8), // Spacing between icon and text
//                         Text(
//                           businessServicesProvider.subcategories[i],
//                           style: TextStyle(
//                               color: secondaryColor20LightTheme, fontSize: 12),
//                           textAlign: TextAlign.center,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ],
//                     ),
//                   );
//                 }
//               },
//             ),
//           ),
// //         return Padding(
// //           padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
// //           child: Container(
// //             height: 240,
// //             child: GridView.builder(
// //               itemCount: businessServicesProvider.subcategories.length > 7
// //                   ? 8
// //                   : businessServicesProvider.subcategories.length,
// //               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// //                 crossAxisCount: 4, // number of items in a row
// //                 crossAxisSpacing: 10,
// //                 mainAxisSpacing: 10,
// //                 childAspectRatio: 1,
// //               ),
// //               itemBuilder: (ctx, i) {
// //                 if (i == 7 &&
// //                     businessServicesProvider.subcategories.length > 7) {
// //                   return GestureDetector(
// //                     onTap: () {
// //                       Navigator.push(context,
// //                           MaterialPageRoute(builder: (context) {
// //                         return AllSubcategoriesPage(
// //                             subcategories:
// //                                 businessServicesProvider.subcategories);
// //                       }));
// //                     },
// //                     child: GridTile(
// //                       child: Center(
// //                           child: Text(
// //                         'View all',
// //                         style: TextStyle(fontSize: 13),
// //                       )),
// //                     ),
// //                   );
// //                 } else {
// //                   return GridTile(
// //                     child: Column(
// //                       mainAxisAlignment: MainAxisAlignment.center,
// //                       children: [
// //                         GestureDetector(
// //                           onTap: () {
// //                             Navigator.push(context,
// //                                 MaterialPageRoute(builder: (context) {
// //                               return SubCategoryList(
// //                                   subCat: businessServicesProvider
// //                                       .subcategories[i]);
// //                             }));
// //                           },
// //                           child: Container(
// //                             height: 40,
// //                             width: 40, // Adjust the size as needed
// //                             decoration: BoxDecoration(
// //                               color: Colors.white,
// //                               shape: BoxShape.circle,
// //                             ),
// //                             child: Icon(
// //                               // Replace with an icon based on subcategory if needed
// //                               // LineAwesomeIcons.car, // Placeholder icon
// //                               getIconForSubcategory(
// //                                   businessServicesProvider.subcategories[i]),
// //                               size: 26,
// //                               // color: tgDarkPrimaryColor,
// //                               // color: secondaryColor40LightTheme,
// //                               color: Colors.teal.shade900,
// //                             ),
// //                           ),
// //                         ),
// //                         SizedBox(height: 8), // Spacing between icon and text
// //                         Text(
// //                           businessServicesProvider.subcategories[i],
// //                           style: TextStyle(
// //                               color: secondaryColor20LightTheme, fontSize: 12),
// //                           textAlign: TextAlign.center,
// //                           overflow: TextOverflow.ellipsis,
// //                         ),
// //                       ],
// //                     ),
// //                   );
// //                 }
// //               },
// //             ),
// //           ),
// //         );
// //       }
// //     });
// //   }
// // }
//         );
//       }
//     });
//   }
// }

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:sssv1/Services%20(top)%20of%20homepage%20section/icons.dart';
// import 'package:sssv1/Services%20(top)%20of%20homepage%20section/showallsubcat.dart';
// import 'package:sssv1/providers/BusinessCategoriesProvider.dart';
// import 'package:sssv1/utils/constants.dart';

// class OurtoppickPage extends StatefulWidget {
//   const OurtoppickPage({super.key});

//   @override
//   State<OurtoppickPage> createState() => _OurtoppickPageState();
// }

// class _OurtoppickPageState extends State<OurtoppickPage> {
//   late BusinessCategoriesProvider businessServicesProvider;
//   @override
//   void initState() {
//     super.initState();
//     businessServicesProvider =
//         Provider.of<BusinessCategoriesProvider>(context, listen: false);
//     businessServicesProvider.fetchAllCategories();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<BusinessCategoriesProvider>(
//       builder: (ctx, businessServicesProvider, _) {
//         if (businessServicesProvider.isLoading) {
//           return Shimmer.fromColors(
//             baseColor: Colors.grey[300]!,
//             highlightColor: Colors.grey[100]!,
//             child: Container(
//               width: MediaQuery.of(context).size.width, // Use screen width
//               height: MediaQuery.of(context).size.height, // Use screen height
//               // height: double.infinity,
//               color: Colors.white,
//             ),
//           );
//         } else {
//           final categoryModel = businessServicesProvider.categories[0];
//           return Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               margin: const EdgeInsets.only(right: 8),
//               height: 220,
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.black12, width: 1),
//                 color: secondaryColor5LightTheme,
//                 borderRadius: const BorderRadius.all(Radius.circular(10)),
//               ),
//               child: Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: GridView.builder(
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 4,
//                     crossAxisSpacing: 8.0,
//                     mainAxisSpacing: 13.0,
//                     // childAspectRatio: 2 / 1.7,
//                   ),
//                   itemCount: categoryModel.categories.length > 7
//                       ? 8
//                       : categoryModel.categories.length,
//                   itemBuilder: (ctx, index) {
//                     if (index == 7 && categoryModel.categories.length > 7) {
//                       return GridTile(
//                         child: GestureDetector(
//                           onTap: () {
//                             Navigator.push(context,
//                                 MaterialPageRoute(builder: (context) {
//                               return AllSubcategoriesPage(
//                                   // subcategories: categoryModel.categories.values
//                                   //     .expand((i) => i)
//                                   //     .toList()
//                                   );
//                             }));
//                           },
//                           child: Center(
//                             child: Text(
//                               'View All',
//                               style: TextStyle(fontSize: 14.0),
//                             ),
//                           ),
//                         ),
//                       );
//                     } else {
//                       final categoryEntry =
//                           categoryModel.categories.entries.elementAt(index);
//                       IconData categoryIcon =
//                           getIconForCategory(categoryEntry.key);
//                       return GridTile(
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: GestureDetector(
//                             onTap: () {
//                               Navigator.push(context,
//                                   MaterialPageRoute(builder: (context) {
//                                 return AllSubcategoriesPage(); // Pass the subcategories of the selected category
//                               }));
//                             },
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Container(
//                                   height: 40,
//                                   width: 40,
//                                   decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     shape: BoxShape.circle,
//                                   ),
//                                   child: Icon(
//                                     categoryIcon,
//                                     size: 24.0,
//                                     color: Colors.teal.shade900,
//                                   ),
//                                 ),
//                                 SizedBox(height: 5),
//                                 Expanded(
//                                   child: Text(
//                                     categoryEntry.key,
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w300,
//                                       fontSize: 11.5,
//                                       overflow: TextOverflow.ellipsis,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     }
//                   },
//                 ),
//               ),
//             ),
//           );
//         }
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sssv1/Services%20(top)%20of%20homepage%20section/icons.dart';
import 'package:sssv1/Services%20(top)%20of%20homepage%20section/showallsubcat.dart';
import 'package:sssv1/models/newbusinees_categories.dart';
import 'package:sssv1/models/subcatrgorylist_model.dart';
import 'package:sssv1/providers/BusinessCategoriesProvider.dart';
import 'package:sssv1/screens/SubCategoryList.dart';
import 'package:sssv1/utils/constants.dart';

class OurtoppickPage extends StatefulWidget {
  const OurtoppickPage({super.key});

  @override
  State<OurtoppickPage> createState() => _OurtoppickPageState();
}

class _OurtoppickPageState extends State<OurtoppickPage> {
  late BusinessCategoriesProvider businessServicesProvider;

  @override
  void initState() {
    super.initState();
    businessServicesProvider =
        Provider.of<BusinessCategoriesProvider>(context, listen: false);
    businessServicesProvider.fetchAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BusinessCategoriesProvider>(
      builder: (ctx, businessServicesProvider, _) {
        if (businessServicesProvider.isLoading) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
            ),
          );
        } else if (businessServicesProvider.categories.isEmpty) {
          return Center(child: Text("No categories available"));
        } else {
          final categoryModel = businessServicesProvider.categories[0];

          // Filter subcategories with priority 1
          final priorityOneSubcategories = <BeautySpa>[];
          final allSubcategories = <String, List<BeautySpa>>{};

          priorityOneSubcategories.addAll(categoryModel.beautySpas
              .where((subcat) => subcat.priority == 1)
              .toList());
          priorityOneSubcategories.addAll(categoryModel.education
              .where((subcat) => subcat.priority == 1)
              .toList());
          priorityOneSubcategories.addAll(categoryModel.food
              .where((subcat) => subcat.priority == 1)
              .toList());
          priorityOneSubcategories.addAll(categoryModel.homeServices
              .where((subcat) => subcat.priority == 1)
              .toList());
          priorityOneSubcategories.addAll(categoryModel.nightlife
              .where((subcat) => subcat.priority == 1)
              .toList());
          priorityOneSubcategories.addAll(categoryModel.retail
              .where((subcat) => subcat.priority == 1)
              .toList());
          priorityOneSubcategories.addAll(categoryModel.shopping
              .where((subcat) => subcat.priority == 1)
              .toList());

          allSubcategories['Beauty & Spas'] = categoryModel.beautySpas;
          allSubcategories['Education'] = categoryModel.education;
          allSubcategories['Food'] = categoryModel.food;
          allSubcategories['Home Services'] = categoryModel.homeServices;
          allSubcategories['Nightlife'] = categoryModel.nightlife;
          allSubcategories['Retail'] = categoryModel.retail;
          allSubcategories['Shopping'] = categoryModel.shopping;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: const EdgeInsets.only(right: 8),
              height: 220,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12, width: 1),
                color: secondaryColor5LightTheme,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 13.0,
                  ),
                  itemCount: priorityOneSubcategories.length > 7
                      ? 8
                      : priorityOneSubcategories.length,
                  itemBuilder: (ctx, index) {
                    if (index == 7 && priorityOneSubcategories.length > 7) {
                      return GridTile(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return AllSubcategoriesPage(
                                subcategories: allSubcategories,
                              );
                            }));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 27),
                            child: Center(
                              child: Column(
                                children: [
                                  Text(
                                    'View All',
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.arrow_right,
                                    size: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      final subcategory = priorityOneSubcategories[index];
                      IconData subcategoryIcon =
                          getIconForSubcategory(subcategory.subcategory);

                      return GridTile(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            // onTap: () {
                            //   Navigator.push(context,
                            //       MaterialPageRoute(builder: (context) {
                            //     return AllSubcategoriesPage(subcategories: {
                            //       subcategory.subcategory: [subcategory]
                            //     });
                            //   }));
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    subcategoryIcon,
                                    size: 24.0,
                                    color: Colors.teal.shade900,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Expanded(
                                  child: Text(
                                    subcategory.subcategory,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 11.5,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
