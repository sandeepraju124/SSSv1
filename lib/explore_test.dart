import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sssv1/providers/sub_category_provider.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/utils/constants.dart';
import 'package:sssv1/utils/navigator.dart';
import 'package:sssv1/screens/SubCategoryList.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class SubcategoryTest extends StatefulWidget {
  final String keyy;
  final String value;

  SubcategoryTest({required this.keyy, required this.value});

  @override
  State<SubcategoryTest> createState() => _SubcategoryTestState();
}

class _SubcategoryTestState extends State<SubcategoryTest> {
  Map<String, String> categoryGifs = {
    'Indian Restaurant': 'images/subcategoryimages/indianres.gif',
    'bakeries': 'images/subcategoryimages/bakery.gif',
    'Restaurant': 'images/subcategoryimages/restaurant.gif',
    'Pizzeria': 'images/subcategoryimages/pizza.gif',
    'Grocery Store': 'images/subcategoryimages/grocery.gif',
    'Coffee Tea': 'images/subcategoryimages/coffee.gif'
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

    return Scaffold(
      backgroundColor: secondaryColor10LightTheme,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(LineAwesomeIcons.angle_left, color: Colors.white),
        ),
        title: Text(
          widget.value,
          style: TextStyle(color: Colors.white, fontSize: 18),
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
                itemCount: data.getUniqueSubcategoryData.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 24,
                  childAspectRatio: 3 / 4,
                ),
                itemBuilder: (BuildContext context, int index) {
                  String subcategory = data.getUniqueSubcategoryData[index];
                  print("subcategory: $subcategory");

                  return GestureDetector(
                    onTap: () {
                      navigatorPush(
                        context,
                        SubCategoryList(
                          keyy: "sub_category",
                          value: subcategory,
                        ),
                      );
                    },
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            flex: 4,
                            child: ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(15),
                              ),
                              child: categoryGifs[subcategory] != null
                                  ? Image.asset(
                                      categoryGifs[subcategory]!,
                                      fit: BoxFit.cover,
                                    )
                                  : Lottie.asset(
                                      "images/Default.json",
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                              decoration: BoxDecoration(
                                color: tgDarkPrimaryColor,
                                borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(15),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  subcategory,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
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
