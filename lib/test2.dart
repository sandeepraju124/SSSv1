import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:sssv1/providers/BusinessCategoriesProvider.dart';
import 'package:sssv1/providers/BusinessCategoriesProviderNew.dart';

//
// class CategoryScreen extends StatefulWidget {
//   @override
//   State<CategoryScreen> createState() => _CategoryScreenState();
// }
//
// class _CategoryScreenState extends State<CategoryScreen> {
//   late BusinessCategoriesProviderNew businessServicesProvider;
//
//   void initState() {
//     super.initState();
//     businessServicesProvider =
//         Provider.of<BusinessCategoriesProviderNew>(context, listen: false);
//     businessServicesProvider.fetchCategoriesData();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Categories')),
//       body: Consumer<BusinessCategoriesProviderNew>(
//         builder: (context, data, child) {
//           if (data.isLoading) {
//             return Center(child: CircularProgressIndicator());
//           } else if (data.priority1Categories.isEmpty) {
//             return Center(child: Text('No priority 1 categories found.'));
//           } else {
//             final priority1Items = data.priority1Categories;
//
//             return
//               // CategoryList();
//               Container(
//                 height: 100,
//                 child: ListView.builder(
//
//                   scrollDirection: Axis.horizontal,
//                   itemCount: priority1Items.length + 1,
//                   itemBuilder: (context, index) {
//                     final category = priority1Items.keys.elementAt(index);
//                     final subcategory = priority1Items[category]![0]['subcategory'];
//                     // return buildCategoryIcon(subcategory);
//                     return Padding(
//                       padding: const EdgeInsets.only(right: 16.0),
//                       child: Column(
//                         children: [
//                           CircleAvatar(
//                               radius: 30,
//                               backgroundColor: Colors.teal.shade100,
//                               child: buildCategoryIcon(subcategory)
//                             // Icon(categories[index]['icon'],
//                             //     size: 30, color: Colors.teal),
//                           ),
//                           SizedBox(height: 8),
//                           // Text(categories[index]['name']),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               );
//
//               GridView.builder(
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 4,
//               ),
//               itemCount: priority1Items.length + 1, // +1 for "View All"
//               itemBuilder: (context, index) {
//                 if (index == priority1Items.length) {
//                   return buildViewAllIcon(context);
//                 } else {
//                   final category = priority1Items.keys.elementAt(index);
//                   final subcategory = priority1Items[category]![0]['subcategory'];
//                   return buildCategoryIcon(subcategory);
//                 }
//               },
//             );
//
//           }
//         },
//       ),
//     );
//   }
//
//
//   Widget buildCategoryIcon(String subcategory) {
//     IconData icon;
//     switch (subcategory) {
//       case 'Barbers':
//         icon = Icons.content_cut;
//         break;
//       case 'Restaurant':
//         icon = Icons.restaurant;
//         break;
//       case 'Fast Food':
//         icon = Icons.fastfood;
//         break;
//       case 'Electricians':
//         icon = Icons.electrical_services;
//         break;
//       case 'Bars':
//         icon = Icons.local_bar;
//         break;
//       case 'Bookstore':
//         icon = Icons.book;
//         break;
//       case 'Clothing':
//         icon = Icons.shopping_bag;
//         break;
//       case 'Malls':
//         icon = Icons.store_mall_directory;
//         break;
//       default:
//         icon = Icons.category;
//         break;
//     }
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Icon(icon, size: 40),
//         SizedBox(height: 8),
//         Text(subcategory, textAlign: TextAlign.center),
//       ],
//     );
//   }
//
//   Widget buildViewAllIcon(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(context, MaterialPageRoute(builder: (context) => AllCategoriesScreen()));
//       },
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.view_list, size: 40),
//           SizedBox(height: 8),
//           Text('View All', textAlign: TextAlign.center),
//         ],
//       ),
//     );
//   }
// }
//
// class AllCategoriesScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('All Categories')),
//       body: Center(child: Text('All Categories List')),
//     );
//   }
// }
//
// class CategoryList extends StatelessWidget {
//
//   // final List<Map<String, dynamic>> categories = [
//   //   {'icon': Icons.restaurant, 'name': 'Restaurants'},
//   //   {'icon': Icons.local_bar, 'name': 'Bars'},
//   //   {'icon': Icons.coffee, 'name': 'Cafes'},
//   //   {'icon': Icons.shopping_cart, 'name': 'Shopping'},
//   //   {'icon': Icons.hotel, 'name': 'Hotels'},
//   //   {'icon': Icons.more_horiz, 'name': 'More'},
//   // ];
//
//   @override
//   Widget build(BuildContext context) {
//     var data = Provider.of<BusinessCategoriesProviderNew>(context);
//     final priority1Items = data.priority1Categories;
//
//     return Container(
//       height: 100,
//       child: ListView.builder(
//
//         scrollDirection: Axis.horizontal,
//         itemCount: priority1Items.length + 1,
//         itemBuilder: (context, index) {
//           final category = priority1Items.keys.elementAt(index);
//           final subcategory = priority1Items[category]![0]['subcategory'];
//           // return buildCategoryIcon(subcategory);
//           return Padding(
//             padding: const EdgeInsets.only(right: 16.0),
//             child: Column(
//               children: [
//                 CircleAvatar(
//                   radius: 30,
//                   backgroundColor: Colors.teal.shade100,
//                   child: buildCategoryIcon(subcategory)
//                   // Icon(categories[index]['icon'],
//                   //     size: 30, color: Colors.teal),
//                 ),
//                 SizedBox(height: 8),
//                 // Text(categories[index]['name']),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
//   Widget buildCategoryIcon(String subcategory) {
//     IconData icon;
//     switch (subcategory) {
//       case 'Barbers':
//         icon = Icons.content_cut;
//         break;
//       case 'Restaurant':
//         icon = Icons.restaurant;
//         break;
//       case 'Fast Food':
//         icon = Icons.fastfood;
//         break;
//       case 'Electricians':
//         icon = Icons.electrical_services;
//         break;
//       case 'Bars':
//         icon = Icons.local_bar;
//         break;
//       case 'Bookstore':
//         icon = Icons.book;
//         break;
//       case 'Clothing':
//         icon = Icons.shopping_bag;
//         break;
//       case 'Malls':
//         icon = Icons.store_mall_directory;
//         break;
//       default:
//         icon = Icons.category;
//         break;
//     }
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Icon(icon, size: 40),
//         SizedBox(height: 8),
//         Text(subcategory, textAlign: TextAlign.center),
//       ],
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/screens/SubCategoryList.dart';
import 'package:sssv1/utils/navigator.dart';
import 'package:sssv1/viewall_cat_new.dart';

import 'Services (top) of homepage section/showallsubcat.dart';

class CategoryScreen extends StatefulWidget {
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<BusinessCategoriesProviderNew>(context, listen: false).fetchCategoriesData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Categories')),
      body: Consumer<BusinessCategoriesProviderNew>(
        builder: (context, data, child) {
          if (data.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (data.priority1Categories.isEmpty) {
            return Center(child: Text('No priority 1 categories found.'));
          } else {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('Top Categories',
                        // style: Theme.of(context).textTheme.headline6
                    ),
                  ),
                  CategoryList(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('All Categories',
                        // style: Theme.of(context).textTheme.headline6
                    ),
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.all(16),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: data.priority1Categories.length + 1,
                    itemBuilder: (context, index) {
                      if (index == data.priority1Categories.length) {
                        return buildViewAllIcon(context);
                      } else {
                        final category = data.priority1Categories.keys.elementAt(index);
                        final subcategory = data.priority1Categories[category]![0]['subcategory'];
                        return buildCategoryIcon(subcategory);
                      }
                    },
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget buildCategoryIcon(String subcategory) {
    IconData icon = getCategoryIcon(subcategory);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.teal.shade100,
          child: Icon(icon, size: 30, color: Colors.teal),
        ),
        SizedBox(height: 8),
        Text(subcategory, textAlign: TextAlign.center, maxLines: 2, overflow: TextOverflow.ellipsis),
      ],
    );
  }

  Widget buildViewAllIcon(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(builder: (context) => AllCategoriesScreen()));
        navigatorPush(context, AllSubcategoriesPageNew());
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.teal.shade100,
            child: Icon(Icons.view_list, size: 30, color: Colors.teal),
          ),
          SizedBox(height: 8),
          Text('View All', textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

// class CategoryList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<BusinessCategoriesProviderNew>(
//       builder: (context, data, child) {
//         final priority1Items = data.priority1Categories;
//         return Container(
//           height: 100,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: priority1Items.length,
//             itemBuilder: (context, index) {
//               final category = priority1Items.keys.elementAt(index);
//               final subcategory = priority1Items[category]![0]['subcategory'];
//               return Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                 child: Column(
//                   children: [
//                     CircleAvatar(
//                       radius: 30,
//                       backgroundColor: Colors.teal.shade100,
//                       child: Icon(getCategoryIcon(subcategory), size: 30, color: Colors.teal),
//                     ),
//                     SizedBox(height: 8),
//                     Text(subcategory, textAlign: TextAlign.center),
//                   ],
//                 ),
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }

class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<BusinessCategoriesProviderNew>(
      builder: (context, data, child) {
        final priority1Items = data.priority1Categories;
        return Container(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: priority1Items.length + 1, // +1 for the "View All" icon
            itemBuilder: (context, index) {
              if (index == priority1Items.length) {
                // This is the last item, so we'll show the "View All" icon
                return GestureDetector(
                  onTap: (){
                    navigatorPush(context, AllSubcategoriesPageNew());
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.teal.shade100,
                          child: Icon(Icons.more_horiz, size: 30, color: Colors.teal),
                        ),
                        SizedBox(height: 8),
                        Text('View All', textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                );
              } else {
                final category = priority1Items.keys.elementAt(index);
                final subcategory = priority1Items[category]![0]['subcategory'];
                return GestureDetector(
                  onTap: (){
                    print(subcategory);
                    navigatorPush(context, SubCategoryList(keyy: "sub_category",value: subcategory,));

                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.teal.shade100,
                          child: Icon(getCategoryIcon(subcategory), size: 30, color: Colors.teal),
                        ),
                        SizedBox(height: 8),
                        Text(subcategory, textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        );
      },
    );
  }
}

IconData getCategoryIcon(String subcategory) {
  switch (subcategory.toLowerCase()) {
    case 'barbers':
      return Icons.content_cut;
    case 'restaurant':
      return Icons.restaurant;
    case 'fast food':
      return Icons.fastfood;
    case 'electricians':
      return Icons.electrical_services;
    case 'bars':
      return Icons.local_bar;
    case 'bookstore':
      return Icons.book;
    case 'clothing':
      return Icons.shopping_bag;
    case 'malls':
      return Icons.store_mall_directory;
    default:
      return Icons.category;
  }
}

class AllCategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('All Categories')),
      body: Center(child: Text('All Categories List')),
    );
  }
}
