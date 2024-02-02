// ignore_for_file: prefer_const_constructors

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
  String keyy;
  String value;

  Subcategory({required this.keyy, required this.value});

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
    var data = Provider.of<businessProvider>(context, listen: false);
    data.getBusinessProvider(widget.keyy, widget.value); 
  }


  @override
  Widget build(BuildContext context) {
    var data = Provider.of<businessProvider>(context);
    // List _uniqueSubCategories = data.getUniqueSubcategoryData;
    return Scaffold(
      backgroundColor: secondaryColor10LightTheme,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(LineAwesomeIcons.angle_left)),
        title: Text(
          widget.value,
          style: TextStyle(color: Colors.white, fontSize: 17.2),
        ),
        backgroundColor: tgAccentColor,
      ),
      body: data.isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: tgDarkPrimaryColor,
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(15.0),
              child: GridView.builder(
                // itemCount: data.subcategoryData?.subcategories.length,
                // itemCount: data.getBusinessData.length,
                itemCount: data.getUniqueSubcategoryData.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 150 / 230,
                ),
                itemBuilder: (BuildContext context, int index) {
                  // String category = data.getBusinessData[index]!.subCategory;
                  String subcategory = data.getUniqueSubcategoryData[index];
                  // print(category);

                  final gifImage = categoryGifs[subcategory] ?? 'images/food.gif';

                  return SizedBox(
                    child: GestureDetector(
                      onTap: () {
                        Navigators().navigatorPush(
                          context,
                          SubCategoryList(
                            keyy: "sub_category",
                            value: subcategory,
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
                                  subcategory,
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
