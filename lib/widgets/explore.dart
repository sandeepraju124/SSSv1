import 'package:flutter/material.dart';
import 'package:sssv1/HousingServices/house_search.dart';
import 'package:sssv1/explore_test.dart';
import 'package:sssv1/utils/navigator.dart';
import 'package:sssv1/widgets/subcategory.dart';

class Explore extends StatelessWidget {
  Explore({Key? key}) : super(key: key);
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
          navigatorPush(context, Subcategory(keyy: "category", value: "Retail"))
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
      "name": "Automative",
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
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(13),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.26,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: categories[index]["onTap"] != null
                ? () => categories[index]["onTap"](context)
                : null,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11),
                image: DecorationImage(
                  image: AssetImage(categories[index]["image"]),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3),
                    BlendMode.darken,
                  ),
                ),
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    categories[index]["name"],
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
