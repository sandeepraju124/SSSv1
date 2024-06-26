import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:sssv1/Services%20(top)%20of%20homepage%20section/icons.dart';
import 'package:sssv1/models/newbusinees_categories.dart';
import 'package:sssv1/screens/SubCategoryList.dart';
import 'package:sssv1/utils/constants.dart';

class AllSubcategoriesPage extends StatefulWidget {
  final Map<String, List<BeautySpa>> subcategories;

  AllSubcategoriesPage({Key? key, required this.subcategories})
      : super(key: key);

  @override
  State<AllSubcategoriesPage> createState() => _AllSubcategoriesPageState();
}

class _AllSubcategoriesPageState extends State<AllSubcategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor5LightTheme,
      appBar: AppBar(
        backgroundColor: tgDarkPrimaryColor,
        title: const Text(
          'All Subcategories',
          style: TextStyle(fontSize: 17),
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
        itemCount: widget.subcategories.length,
        itemBuilder: (context, index) {
          String categoryName = widget.subcategories.keys.elementAt(index);
          List<BeautySpa> subcategories = widget.subcategories[categoryName]!;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  " $categoryName: ",
                  style: TextStyle(
                    fontSize: 15.5,
                    fontWeight: FontWeight.w300,
                    color: secondaryColor60LightTheme,
                  ),
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, // number of items in a row
                  mainAxisSpacing: 11, // space between rows
                ),
                itemCount: subcategories.length,
                itemBuilder: (context, subIndex) {
                  BeautySpa subcategory = subcategories[subIndex];

                  return GestureDetector(
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
                            getIconForSubcategory(subcategory
                                .subcategory), // Use your function to get the icon
                            size: 26,
                            color: Colors.teal.shade900,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          subcategory.subcategory,
                          style: TextStyle(
                            color: Colors.black87, // replace with your color
                            fontSize: 10.1,
                          ),
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
