import 'package:flutter/material.dart';
import 'package:sssv1/HousingServices/house_search.dart';

import 'package:sssv1/utils/navigator.dart';
import 'package:sssv1/widgets/subcategory.dart';

class Explore extends StatelessWidget {
  const Explore({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(13),
      child: Column(
        children: [
          // first row
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    // Http().fetchSubcategoryData("$baseUrl/category/food");
                    // await SubcategoryProvider().subCategoryProvider("retail");
                    // await subcategoryProvider.subCategoryProvider("retail");
                    // Navigators().navigatorPush(context, SubCategory());

                    // var data = Provider.of<SubcategoryProvider>(context);
                    //   var data = Provider.of<SubcategoryProvider>(context);
                    // data.subCategoryProvider("food");

                    Navigators().navigatorPush(
                        context,
                        Subcategory(
                          subCat: "food",
                        ));
                  },
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    height: 85,
                    // color: Colors.redAccent,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(
                          0.8), // Set a transparent background color
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      image: const DecorationImage(
                        image:
                            // AssetImage("images/food.gif"),
                            NetworkImage(
                                "https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=480&q=80"),
                        fit: BoxFit.cover,
                      ),
                      // color: Colors.red,
                      // borderRadius: BorderRadius.all(Radius.circular(11))
                      // color: Colors.red,
                    ),
                    child: const Align(
                        alignment: Alignment(-0.7, 0.5),
                        child: Text(
                          'Food',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
              ),
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  Navigators().navigatorPush(
                      context,
                      Subcategory(
                        subCat: "retail",
                      ));
                },
                child: Container(
                  margin: const EdgeInsets.all(5),
                  height: 85,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://www.fujitsu.com/global/imagesgig5/blog-4_tcm100-6517144_tcm100-2750236-32.jpg"),
                        fit: BoxFit.cover,
                      ),
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.all(Radius.circular(11))
                      // color: Colors.red,
                      ),
                  child: const Align(
                      alignment: Alignment(-0.7, 0.5),
                      child: Text(
                        'Retails',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              )),
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  // education
                  Navigators().navigatorPush(
                      context,
                      Subcategory(
                        subCat: "Housing",
                      ));
                },
                child: Container(
                  margin: const EdgeInsets.all(5),
                  height: 85,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://as1.ftcdn.net/v2/jpg/03/09/24/40/1000_F_309244030_75QJt5NP1UaekvnGOIN5NgzGM6PxgEYe.jpg"),
                        fit: BoxFit.cover,
                      ),
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.all(Radius.circular(11))
                      // color: Colors.red,
                      ),
                  child: const Align(
                      alignment: Alignment(-0.7, 0.5),
                      child: Text(
                        'housing',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ))
            ],
          ),
          // second row 2
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                  // education
                  Navigators().navigatorPush(
                      context,HouseSearch()
                      );
                },
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    height: 85,
                    // color: Colors.redAccent,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://www.kotak.com/content/dam/Kotak/product_card_images/how-credit-cards-enhance-your-shopping-experience.jpg"),
                          fit: BoxFit.cover,
                        ),
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(11))
                        // color: Colors.red,
                        ),
                    child: const Align(
                        alignment: Alignment(-0.7, 0.5),
                        child: Text(
                          'Shopping',
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                margin: const EdgeInsets.all(5),
                height: 85,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://images.unsplash.com/photo-1596462502278-27bfdc403348?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8&w=1000&q=80"),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.all(Radius.circular(11))
                    // color: Colors.red,
                    ),
                child: const Align(
                    alignment: Alignment(-0.7, 0.5),
                    child: Text(
                      'spa',
                      style: TextStyle(color: Colors.white),
                    )),
              )),
              Expanded(
                  child: Container(
                margin: const EdgeInsets.all(5),
                height: 85,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9dwH9zzlgn5ufXYM-1Kgt1tREr9VRQFxeIQ&usqp=CAU"),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.all(Radius.circular(11))
                    // color: Colors.red,
                    ),
                child: const Align(
                    alignment: Alignment(-0.7, 0.5),
                    child: Text(
                      'Meditation Centers',
                      style: TextStyle(color: Colors.white),
                    )),
              ))
            ],
          ),
          // 3rd row
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(5),
                  height: 85,
                  // color: Colors.redAccent,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://img.freepik.com/premium-photo/full-size-profile-side-photo-young-excited-girl-have-fun-dance-clubber-isolated-yellow-color-background_525549-8222.jpg?w=2000"),
                        fit: BoxFit.cover,
                      ),
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(11))
                      // color: Colors.red,
                      ),
                  child: const Align(
                      alignment: Alignment(-0.7, 0.5),
                      child: Text(
                        'Dance Schools',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ),
              Expanded(
                  child: Container(
                margin: const EdgeInsets.all(5),
                height: 85,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://t4.ftcdn.net/jpg/02/60/04/09/360_F_260040900_oO6YW1sHTnKxby4GcjCvtypUCWjnQRg5.jpg"),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.all(Radius.circular(11))
                    // color: Colors.red,
                    ),
                child: const Align(
                    alignment: Alignment(-0.7, 0.5),
                    child: Text(
                      'Doctors',
                      style: TextStyle(color: Colors.white),
                    )),
              )),
              Expanded(
                  child: Container(
                margin: const EdgeInsets.all(5),
                height: 85,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://www.shutterstock.com/image-photo/happy-wedding-couple-dancing-on-260nw-615424550.jpg"),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.all(Radius.circular(11))
                    // color: Colors.red,
                    ),
                child: const Align(
                    alignment: Alignment(-0.7, 0.5),
                    child: Text(
                      'Wedding planing',
                      style: TextStyle(color: Colors.white),
                    )),
              ))
            ],
          ),
          // 4th row
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(5),
                  height: 85,
                  // color: Colors.redAccent,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://s3.envato.com/files/f1718472-ff3e-4f8b-8159-b356d5510e5e/inline_image_preview.jpg"),
                        fit: BoxFit.cover,
                      ),
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(11))
                      // color: Colors.red,
                      ),
                  child: const Align(
                      alignment: Alignment(-0.7, 0.5),
                      child: Text(
                        'DJ',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ),
              Expanded(
                  child: Container(
                margin: const EdgeInsets.all(5),
                height: 85,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/modell.jpeg"),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.all(Radius.circular(11))
                    // color: Colors.red,
                    ),
                child: const Align(
                    alignment: Alignment(-0.7, 0.5),
                    child: Text(
                      'Model',
                      style: TextStyle(color: Colors.white),
                    )),
              )),
              Expanded(
                  child: Container(
                margin: const EdgeInsets.all(5),
                height: 85,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://as1.ftcdn.net/v2/jpg/03/53/54/12/1000_F_353541224_S3dKaxNcVj8LY214NfQDN3xFbEZflIN4.jpg"),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.all(Radius.circular(11))
                    // color: Colors.red,
                    ),
                child: const Align(
                    alignment: Alignment(-0.7, 0.5),
                    child: Text(
                      'swimming',
                      style: TextStyle(color: Colors.white),
                    )),
              ))
            ],
          ),
        ],
      ),
    );
  }
}
