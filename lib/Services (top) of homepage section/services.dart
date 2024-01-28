// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sssv1/Services%20(top)%20of%20homepage%20section/icons.dart';
import 'package:sssv1/Services%20(top)%20of%20homepage%20section/showallsubcat.dart';
import 'package:sssv1/providers/service_provider.dart';
import 'package:sssv1/screens/SubCategoryList.dart';
import 'package:sssv1/utils/constants.dart';

class Services extends StatefulWidget {
  const Services({
    Key? key,
  }) : super(key: key);

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  late BusinessServicesProvider businessServicesProvider;

  @override
  void initState() {
    super.initState();
    businessServicesProvider =
        Provider.of<BusinessServicesProvider>(context, listen: false);
    businessServicesProvider.fetchAllServices();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BusinessServicesProvider>(
        builder: (ctx, businessServicesProvider, _) {
      if (businessServicesProvider.isLoading) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: MediaQuery.of(context).size.width, // Use screen width
            height: MediaQuery.of(context).size.height, // Use screen height
            // height: double.infinity,
            color: Colors.white,
          ),
        );
      } else {
        return Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Container(
            margin: const EdgeInsets.only(right: 8),
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12, width: 1),
              color: secondaryColor5LightTheme,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: GridView.builder(
              itemCount: businessServicesProvider.subcategories.length > 7
                  ? 8
                  : businessServicesProvider.subcategories.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, // number of items in a row
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              itemBuilder: (ctx, i) {
                if (i == 7 &&
                    businessServicesProvider.subcategories.length > 7) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return AllSubcategoriesPage(
                            subcategories:
                                businessServicesProvider.subcategories);
                      }));
                    },
                    child: GridTile(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 34),
                        child: Center(
                            child: Column(
                          children: [
                            Text(
                              'View all',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: secondaryColor60LightTheme),
                            ),
                            Icon(
                              LineAwesomeIcons.arrow_right,
                              size: 10,
                            ),
                          ],
                        )),
                      ),
                    ),
                  );
                } else {
                  return GridTile(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return SubCategoryList(
                                  subCat: businessServicesProvider
                                      .subcategories[i]);
                            }));
                          },
                          child: Container(
                            height: 40,
                            width: 40, // Adjust the size as needed
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              // Replace with an icon based on subcategory if needed

                              // LineAwesomeIcons.car, // Placeholder icon

                              getIconForSubcategory(
                                  businessServicesProvider.subcategories[i]),
                              size: 26,
                              // color: tgDarkPrimaryColor,
                              // color: secondaryColor40LightTheme,
                              color: Colors.teal.shade900,
                            ),
                          ),
                        ),
                        SizedBox(height: 8), // Spacing between icon and text
                        Text(
                          businessServicesProvider.subcategories[i],
                          style: TextStyle(
                              color: secondaryColor20LightTheme, fontSize: 12),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
//         return Padding(
//           padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//           child: Container(
//             height: 240,
//             child: GridView.builder(
//               itemCount: businessServicesProvider.subcategories.length > 7
//                   ? 8
//                   : businessServicesProvider.subcategories.length,
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
//                       child: Center(
//                           child: Text(
//                         'View all',
//                         style: TextStyle(fontSize: 13),
//                       )),
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
//                                   subCat: businessServicesProvider
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
//         );
//       }
//     });
//   }
// }
        );
      }
    });
  }
}
