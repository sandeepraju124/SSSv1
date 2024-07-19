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
                              // return AllSubcategoriesPage(
                              //   subcategories: allSubcategories,
                              // );
                              return AllSubcategoriesPage();
                            }));
                          },
                          // ignore: prefer_const_constructors
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

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:sssv1/Services%20(top)%20of%20homepage%20section/icons.dart';
// import 'package:sssv1/Services%20(top)%20of%20homepage%20section/showallsubcat.dart';
// import 'package:sssv1/models/newbusinees_categories.dart';
// import 'package:sssv1/providers/BusinessCategoriesProvider.dart';
// import 'package:sssv1/screens/SubCategoryList.dart';
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
//           return _buildShimmerEffect();
//         } else if (businessServicesProvider.categories.isEmpty) {
//           return Center(child: Text("No categories available"));
//         } else {
//           final categoryModel = businessServicesProvider.categories[0];
//           final priorityOneSubcategories =
//               _getPriorityOneSubcategories(categoryModel);
//           final allSubcategories = _getAllSubcategories(categoryModel);

//           return _buildCategoriesGrid(
//               priorityOneSubcategories, allSubcategories);
//         }
//       },
//     );
//   }

//   Widget _buildShimmerEffect() {
//     return Shimmer.fromColors(
//       baseColor: Colors.grey[300]!,
//       highlightColor: Colors.grey[100]!,
//       child: Container(
//         width: MediaQuery.of(context).size.width,
//         height: 220,
//         color: Colors.white,
//       ),
//     );
//   }

//   List<BeautySpa> _getPriorityOneSubcategories(
//       BusinessCategories categoryModel) {
//     return [
//       ...categoryModel.beautySpas.where((subcat) => subcat.priority == 1),
//       ...categoryModel.education.where((subcat) => subcat.priority == 1),
//       ...categoryModel.food.where((subcat) => subcat.priority == 1),
//       ...categoryModel.homeServices.where((subcat) => subcat.priority == 1),
//       ...categoryModel.nightlife.where((subcat) => subcat.priority == 1),
//       ...categoryModel.retail.where((subcat) => subcat.priority == 1),
//       ...categoryModel.shopping.where((subcat) => subcat.priority == 1),
//     ];
//   }

//   Map<String, List<BeautySpa>> _getAllSubcategories(
//       BusinessCategories categoryModel) {
//     return {
//       'Beauty & Spas': categoryModel.beautySpas,
//       'Education': categoryModel.education,
//       'Food': categoryModel.food,
//       'Home Services': categoryModel.homeServices,
//       'Nightlife': categoryModel.nightlife,
//       'Retail': categoryModel.retail,
//       'Shopping': categoryModel.shopping,
//     };
//   }

//   Widget _buildCategoriesGrid(List<BeautySpa> priorityOneSubcategories,
//       Map<String, List<BeautySpa>> allSubcategories) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(6, 0, 10, 10),
//       child: Container(
//         height: 280,
//         margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
//         decoration: BoxDecoration(
//           color: secondaryColor10LightTheme,
//           borderRadius: BorderRadius.circular(15),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.1),
//               spreadRadius: 2,
//               blurRadius: 5,
//               offset: Offset(0, 3),
//             ),
//           ],
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Text(
//                 "Our Top Picks",
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.teal.shade900,
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 180, // Fixed height for the grid
//               child: GridView.builder(
//                 // padding: const EdgeInsets.all(16),
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 4,
//                   crossAxisSpacing: 8.0,
//                   mainAxisSpacing: 8.0,
//                   childAspectRatio: 1.04,
//                 ),
//                 itemCount: priorityOneSubcategories.length > 7
//                     ? 8
//                     : priorityOneSubcategories.length,
//                 itemBuilder: (ctx, index) {
//                   if (index == 7 && priorityOneSubcategories.length > 7) {
//                     return _buildViewAllTile();
//                   } else {
//                     return _buildCategoryTile(priorityOneSubcategories[index]);
//                   }
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildViewAllTile() {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(context,
//             MaterialPageRoute(builder: (context) => AllSubcategoriesPage()));
//       },
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             padding: EdgeInsets.all(8),
//             decoration: BoxDecoration(
//               // color: Colors.teal.shade50,
//               shape: BoxShape.circle,
//             ),
//             child: Icon(
//               Icons.navigate_next_rounded,
//               color: Colors.teal.shade900,
//               size: 24,
//             ),
//           ),
//           SizedBox(height: 8),
//           Text(
//             'View All',
//             style: TextStyle(
//               fontSize: 12,
//               fontWeight: FontWeight.w500,
//               color: Colors.teal.shade900,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildCategoryTile(BeautySpa subcategory) {
//     IconData subcategoryIcon = getIconForSubcategory(subcategory.subcategory);
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(context, MaterialPageRoute(builder: (context) {
//           return SubCategoryList(
//             keyy: "sub_category",
//             value: subcategory.subcategory,
//           );
//         }));
//       },
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             padding: EdgeInsets.all(8),
//             decoration: BoxDecoration(
//               // color: Color.fromARGB(255, 120, 172, 170),
//               color: tgLightPrimaryColor,
//               shape: BoxShape.circle,
//             ),
//             child: Icon(
//               subcategoryIcon,
//               size: 21,
//               color: Colors.teal.shade900,
//             ),
//           ),
//           SizedBox(height: 8),
//           Text(
//             subcategory.subcategory,
//             style: TextStyle(
//                 fontSize: 12,
//                 fontWeight: FontWeight.w500,
//                 // color: Colors.teal.shade900,
//                 color: secondaryColor40LightTheme),
//             textAlign: TextAlign.center,
//             maxLines: 2,
//             overflow: TextOverflow.ellipsis,
//           ),
//         ],
//       ),
//     );
//   }
// }
