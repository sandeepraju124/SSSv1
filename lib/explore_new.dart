import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sssv1/utils/navigator.dart';

import 'HousingServices/house_search.dart';
import 'explore_test.dart';

class ExploreNew extends StatelessWidget {
  // Explore({Key? key}) : super(key: key);
  final String keyy = "category";

  final List<Map<String, dynamic>> categories = [
    {
      "name": "Food & Restaurants",
      "image": "images/foodexplore.jpg",
      "onTap": (BuildContext context) => navigatorPush(
          context, ModernCategoryView(keyy: "category", value: "Food"))
    },
    {
      "name": "Arts & Entertainment",
      "image": "images/category/Entertainment.jpg",
      "onTap": (BuildContext context) =>
          navigatorPush(context, ModernCategoryView(keyy: "category", value: "Retail"))
    },
    {
      "name": "Real Estate & Housing",
      "image": "images/category/Affordable-Housing-Project.jpg",
      "onTap": (BuildContext context) =>
          navigatorPush(context, const HouseSearch())
    },
    {
      "name": "Beauty & Spa's",
      "image": "images/category/beauty-8388873_1280.jpg",
      "onTap": null
    },
    {
      "name": "Automotive",
      "image": "images/category/carrepair1.jpg",
      "onTap": null
    },
    {
      "name": "Night Life",
      "image": "images/category/nightlife-in-havelock-island.jpg",
      "onTap": null
    },
    {
      "name": "Shopping",
      "image": "images/category/shopping.jpg",
      "onTap": null
    },
    {
      "name": "Health & Medical",
      "image": "images/category/medical.jpg",
      "onTap": null
    },
    {
      "name": "Hotels & Travel",
      "image": "images/category/hotel.jpeg",
      "onTap": null
    },
    {
      "name": "Education",
      "image": "images/category/education.avif",
      "onTap": null
    },
    {"name": "Pets", "image": "images/category/pets.jpg", "onTap": null},
    // {"name": "Professional Services", "image": "images/category/Professional_Services.jpg", "onTap": null},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return InkWell(
            onTap: category["onTap"] != null ? () => category["onTap"](context) : null,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: AssetImage(category["image"]),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3),
                    BlendMode.darken,
                  ),
                ),
              ),
              child: Stack(
                children: [
                  // Darker gradient overlay
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.7),
                          Colors.black.withOpacity(0.3),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                  // Text widget
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        category["name"],
                        // textAlign: TextAlign.center,
                        // textAlign: TextAlign.,
                        style: TextStyle(
                          color: Colors.white,
                          // fontWeight: FontWeight.bold,
                          // fontSize: 16,
                          fontSize: 10,
                          shadows: [
                            Shadow(
                              blurRadius: 3.0,
                              color: Colors.black,
                              offset: Offset(1.0, 1.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        staggeredTileBuilder: (int index) {
          // Adjust the size of each tile to match the pattern in the image
          if (index == 0) {
            return StaggeredTile.count(2, 2);
          } else if (index == 1) {
            return StaggeredTile.count(2, 1);
          } else if (index == 2) {
            return StaggeredTile.count(1, 2);
          } else if (index == 3) {
            return StaggeredTile.count(2, 1);
          } else {
            return StaggeredTile.count(1, 1);
          }
        },
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
    );
  }
}