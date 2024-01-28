// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/Services%20(top)%20of%20homepage%20section/icons.dart';
import 'package:sssv1/providers/service_provider.dart';
import 'package:sssv1/screens/SubCategoryList.dart';
import 'package:sssv1/utils/constants.dart';

class AllSubcategoriesPage extends StatelessWidget {
  final List<String> subcategories;

  AllSubcategoriesPage({Key? key, required this.subcategories})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<BusinessServicesProvider>(context);
    return Scaffold(
      backgroundColor: secondaryColor5LightTheme,
      appBar: AppBar(
        backgroundColor: tgDarkPrimaryColor,
        title: Text(
          'All Subcategories',
          style: TextStyle(fontSize: 17),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              LineAwesomeIcons.angle_left,
              size: 17,
            )),
      ),
      body: ListView.builder(
        itemCount: data.categoriesAndSubcategories.keys.length,
        itemBuilder: (context, index) {
          String category =
              data.categoriesAndSubcategories.keys.elementAt(index);
          List<String> subcategories =
              data.categoriesAndSubcategories[category]!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  " $category : ",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: secondaryColor60LightTheme),
                ),
              ),
              GridView.builder(
                // scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                // physics: PageScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, // number of items in a row
                ),
                itemCount: subcategories.length,
                itemBuilder: (context, index) {
                  String subcategory = subcategories[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SubCategoryList(subCat: subcategory);
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
                            getIconForSubcategory(subcategory),
                            size: 26,
                            color: Colors.teal.shade900,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          subcategory,
                          style: TextStyle(
                              color: Colors.black87, // replace with your color
                              fontSize: 12),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  );
                },
              ),
              Divider(
                indent: 7,
                endIndent: 7,
                color: const Color.fromARGB(255, 211, 222, 226),
                thickness: 1,
              ),
            ],
          );
        },
      ),
    );
  }
}
