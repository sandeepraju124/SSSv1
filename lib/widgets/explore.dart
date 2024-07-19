// // ignore_for_file: prefer_const_constructors, must_be_immutable

// import 'package:flutter/material.dart';
// import 'package:sssv1/HousingServices/house_search.dart';
// import 'package:sssv1/explore_test.dart';

// import 'package:sssv1/utils/navigator.dart';
// import 'package:sssv1/widgets/subcategory.dart';

// class Explore extends StatelessWidget {
//   Explore({
//     Key? key,
//   }) : super(key: key);
//   String keyy = "category";

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(13),
//       child: Column(
//         children: [
//           // first row
//           Row(
//             children: [
//               Expanded(
//                 child: GestureDetector(
//                   onTap: () {
//                     navigatorPush(
//                         context,
//                         SubcategoryTest(
//                           keyy: keyy, //category
//                           value: "Food",
//                         )
//                         // Subcategory(
//                         //   keyy: keyy, //category
//                         //   value: "Food",
//                         // )
//                         );
//                   },
//                   child: Container(
//                     margin: const EdgeInsets.all(5),
//                     height: 85,
//                     // color: Colors.redAccent,
//                     decoration: BoxDecoration(
//                       color: Colors.grey.withOpacity(
//                           0.8), // Set a transparent background color
//                       borderRadius: BorderRadius.circular(10),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.5),
//                           spreadRadius: 2,
//                           blurRadius: 10,
//                           offset:
//                               const Offset(0, 3), // changes position of shadow
//                         ),
//                       ],
//                       image: const DecorationImage(
//                         image: AssetImage("images/foodexplore.jpg"),
//                         // NetworkImage(
//                         //     "https://img.freepik.com/free-photo/served-christmas-table-setting-dark-tones-with-golden-deco_1220-6601.jpg?w=826&t=st=1705147003~exp=1705147603~hmac=ea3bf112afe8869891fbb0856f8d0801bc8a6f00538ecf7766acc4a7d0701cbc"),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     child: const Align(
//                         alignment: Alignment(-0.7, 0.5),
//                         child: Padding(
//                           padding: EdgeInsets.all(8.0),
//                           child: Text(
//                             'Food & Restaurants',
//                             style: TextStyle(
//                               color: Colors.white,
//                             ),
//                           ),
//                         )),
//                   ),
//                 ),
//               ),
//               Expanded(
//                   child: GestureDetector(
//                 onTap: () {
//                   navigatorPush(
//                       context,
//                       Subcategory(
//                         keyy: keyy,
//                         value: "Retail",
//                       ));
//                 },
//                 child: Container(
//                   margin: const EdgeInsets.all(5),
//                   height: 85,
//                   decoration: BoxDecoration(
//                       image: DecorationImage(
//                         image: AssetImage("images/nophotocommingsoon.jpg"),
//                         // NetworkImage(
//                         //     "https://img.freepik.com/free-photo/view-3d-cinema-elements_23-2150720756.jpg?t=st=1705147196~exp=1705150796~hmac=064111f14d03c4314f5407fab892108b6641c5fb89ad888566e46278f4704719&w=826"),
//                         fit: BoxFit.cover,
//                         colorFilter: ColorFilter.mode(
//                           Colors.black.withOpacity(
//                               0.1), // Adjust the opacity to make it darker or lighter
//                           BlendMode.darken,
//                         ),
//                       ),
//                       color: Colors.blueAccent,
//                       borderRadius: BorderRadius.all(Radius.circular(11))
//                       // color: Colors.red,
//                       ),
//                   child: const Align(
//                       alignment: Alignment(-0.7, 0.5),
//                       child: Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: Text(
//                           'Arts & Entertainment',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       )),
//                 ),
//               )),
//               Expanded(
//                   child: GestureDetector(
//                 onTap: () {
//                   navigatorPush(context, const HouseSearch());
//                 },
//                 child: Container(
//                   margin: const EdgeInsets.all(5),
//                   height: 85,
//                   decoration: BoxDecoration(
//                       image: DecorationImage(
//                         image: AssetImage("images/nophotocommingsoon.jpg"),
//                         // NetworkImage(
//                         //     "https://img.freepik.com/free-photo/mumbai-skyline-skyscrapers-construction_469504-21.jpg?w=826&t=st=1705152816~exp=1705153416~hmac=f4da6cd129c0f74553a92836c8a8cac0e9767c0360a8815e1a4dcfad6bd4b90b"),
//                         fit: BoxFit.cover,
//                         colorFilter: ColorFilter.mode(
//                           Colors.black.withOpacity(
//                               0.2), // Adjust the opacity to make it darker or lighter
//                           BlendMode.darken,
//                         ),
//                       ),
//                       color: Colors.deepPurple,
//                       borderRadius: BorderRadius.all(Radius.circular(11))
//                       // color: Colors.red,
//                       ),
//                   child: const Align(
//                       alignment: Alignment(-0.7, 0.5),
//                       child: Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: Text(
//                           'Real Estate & Housing',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       )),
//                 ),
//               ))
//             ],
//           ),

//           // second row 2

//           Row(
//             children: [
//               Expanded(
//                 child: GestureDetector(
//                   onTap: () {
//                     // education
//                   },
//                   child: Container(
//                     margin: const EdgeInsets.all(5),
//                     height: 85,
//                     // color: Colors.redAccent,
//                     decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: AssetImage("images/nophotocommingsoon.jpg"),
//                           // NetworkImage(
//                           //     "https://img.freepik.com/free-photo/young-beautiful-woman-having-face-massage-relaxing-spa_1150-3124.jpg?w=826&t=st=1705148796~exp=1705149396~hmac=c85f8f4dd8c07b08011e526a15d5ae88f2d07a710a0a03b239817d176a2e307f"),
//                           fit: BoxFit.cover,
//                           colorFilter: ColorFilter.mode(
//                             Colors.black.withOpacity(
//                                 0.3), // Adjust the opacity to make it darker or lighter
//                             BlendMode.darken,
//                           ),
//                         ),
//                         color: Colors.red,
//                         borderRadius: BorderRadius.all(Radius.circular(11))
//                         // color: Colors.red,
//                         ),
//                     child: const Align(
//                         alignment: Alignment(-0.7, 0.5),
//                         child: Padding(
//                           padding: EdgeInsets.all(8.0),
//                           child: Text(
//                             "Beauty & Spa's",
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         )),
//                   ),
//                 ),
//               ),
//               Expanded(
//                   child: Container(
//                 margin: const EdgeInsets.all(5),
//                 height: 85,
//                 decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage("images/nophotocommingsoon.jpg"),
//                       // NetworkImage(
//                       //     "https://brightonpanelworks.com.au/wp-content/uploads/2022/05/mechanic-in-overalls-repairing-car-in-auto-repair-2021-08-29-22-51-18-utc-1-1080x675.jpg"),
//                       fit: BoxFit.cover,
//                       colorFilter: ColorFilter.mode(
//                         Colors.black.withOpacity(
//                             0.3), // Adjust the opacity to make it darker or lighter
//                         BlendMode.darken,
//                       ),
//                     ),
//                     color: Colors.blueAccent,
//                     borderRadius: BorderRadius.all(Radius.circular(11))
//                     // color: Colors.red,
//                     ),
//                 child: const Align(
//                     alignment: Alignment(-0.7, 0.5),
//                     child: Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text(
//                         'Automative',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     )),
//               )),
//               Expanded(
//                   child: Container(
//                 margin: const EdgeInsets.all(5),
//                 height: 85,
//                 decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage("images/nophotocommingsoon.jpg"),
//                       // NetworkImage(
//                       //     "https://img.freepik.com/premium-photo/people-enjoying-party_53876-32853.jpg?w=826"),
//                       fit: BoxFit.cover,
//                       colorFilter: ColorFilter.mode(
//                         Colors.black.withOpacity(
//                             0.2), // Adjust the opacity to make it darker or lighter
//                         BlendMode.darken,
//                       ),
//                     ),
//                     color: Colors.deepPurple,
//                     borderRadius: BorderRadius.all(Radius.circular(11))
//                     // color: Colors.red,
//                     ),
//                 child: const Align(
//                     alignment: Alignment(-0.7, 0.5),
//                     child: Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text(
//                         'Night Life',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     )),
//               ))
//             ],
//           ),
//           // 3rd row
//           Row(
//             children: [
//               Expanded(
//                 child: GestureDetector(
//                   onTap: () {},
//                   child: Container(
//                     margin: const EdgeInsets.all(5),
//                     height: 85,
//                     // color: Colors.redAccent,
//                     decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: AssetImage("images/nophotocommingsoon.jpg"),
//                           // NetworkImage(
//                           //     "https://img.freepik.com/free-photo/female-friends-out-shopping-together_53876-25041.jpg?w=826&t=st=1705149348~exp=1705149948~hmac=b6d873ace3791d96af33ee5aa883844bab728060680e138cb604a9dffd1f1cdd"),
//                           fit: BoxFit.cover,
//                           colorFilter: ColorFilter.mode(
//                             Colors.black.withOpacity(
//                                 0.3), // Adjust the opacity to make it darker or lighter
//                             BlendMode.darken,
//                           ),
//                         ),
//                         color: Colors.red,
//                         borderRadius: BorderRadius.all(Radius.circular(11))
//                         // color: Colors.red,
//                         ),
//                     child: const Align(
//                         alignment: Alignment(-0.7, 0.5),
//                         child: Padding(
//                           padding: EdgeInsets.all(8.0),
//                           child: Text(
//                             'Shopping',
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         )),
//                   ),
//                 ),
//               ),
//               Expanded(
//                   child: Container(
//                 margin: const EdgeInsets.all(5),
//                 height: 85,
//                 decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage("images/nophotocommingsoon.jpg"),
//                       // NetworkImage(
//                       //     "https://img.freepik.com/free-photo/medical-banner-with-doctor-wearing-goggles_23-2149611193.jpg?w=826&t=st=1705149984~exp=1705150584~hmac=568b242a91f3be0b575b157adb4c6dedb4615cadabbd1bbbcdc0260677c0d1eb"),
//                       fit: BoxFit.cover,
//                       colorFilter: ColorFilter.mode(
//                         Colors.black.withOpacity(
//                             0.3), // Adjust the opacity to make it darker or lighter
//                         BlendMode.darken,
//                       ),
//                     ),
//                     color: Colors.blueAccent,
//                     borderRadius: BorderRadius.all(Radius.circular(11))
//                     // color: Colors.red,
//                     ),
//                 child: const Align(
//                     alignment: Alignment(-0.7, 0.5),
//                     child: Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text(
//                         'Health & Medical',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     )),
//               )),
//               Expanded(
//                   child: Container(
//                 margin: const EdgeInsets.all(5),
//                 height: 85,
//                 decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage("images/nophotocommingsoon.jpg"),
//                       // NetworkImage(
//                       //     "https://img.freepik.com/free-photo/urban-city-architecture_649448-5343.jpg?w=826&t=st=1705149947~exp=1705150547~hmac=f815260218c081a8e67cc7d6ea64735607dd30fec1594893eca29a485099f2e4"),
//                       fit: BoxFit.cover,
//                       colorFilter: ColorFilter.mode(
//                         Colors.black.withOpacity(
//                             0.2), // Adjust the opacity to make it darker or lighter
//                         BlendMode.darken,
//                       ),
//                     ),
//                     color: Colors.deepPurple,
//                     borderRadius: BorderRadius.all(Radius.circular(11))
//                     // color: Colors.red,
//                     ),
//                 child: const Align(
//                     alignment: Alignment(-0.7, 0.5),
//                     child: Text(
//                       'Hotels & Travel',
//                       style: TextStyle(color: Colors.white),
//                     )),
//               ))
//             ],
//           ),
//           // 4th row
//           Row(
//             children: [
//               Expanded(
//                 child: Container(
//                   margin: const EdgeInsets.all(5),
//                   height: 85,
//                   // color: Colors.redAccent,
//                   decoration: BoxDecoration(
//                       image: DecorationImage(
//                         image: AssetImage("images/nophotocommingsoon.jpg"),
//                         // NetworkImage(
//                         //     "https://img.freepik.com/free-photo/city-committed-education-collage-concept_23-2150062222.jpg?w=826&t=st=1705149453~exp=1705150053~hmac=777122c6aec29b4a6dacf11e9098e9011dc6cb6866c42166c77d311e294efd32"),
//                         fit: BoxFit.cover,
//                         colorFilter: ColorFilter.mode(
//                           Colors.black.withOpacity(
//                               0.2), // Adjust the opacity to make it darker or lighter
//                           BlendMode.darken,
//                         ),
//                       ),
//                       color: Colors.red,
//                       borderRadius: BorderRadius.all(Radius.circular(11))
//                       // color: Colors.red,
//                       ),
//                   child: const Align(
//                       alignment: Alignment(-0.7, 0.5),
//                       child: Text(
//                         'Education',
//                         style: TextStyle(color: Colors.white),
//                       )),
//                 ),
//               ),
//               Expanded(
//                 child: Container(
//                   margin: const EdgeInsets.all(5),
//                   height: 85,
//                   decoration: BoxDecoration(
//                       image: DecorationImage(
//                         // image: AssetImage("images/modell.jpeg"),

//                         image: AssetImage("images/nophotocommingsoon.jpg"),
//                         // NetworkImage(
//                         //     "https://img.freepik.com/free-photo/cute-pet-collage-isolated_23-2150007407.jpg?w=740&t=st=1705149510~exp=1705150110~hmac=23ed8c8dbf1277fba3d1423799a6a764b07d63d203cb8a7c0b8b12c2356ded36"),
//                         // fit: BoxFit.cover,
//                         colorFilter: ColorFilter.mode(
//                           Colors.black.withOpacity(
//                               0.1), // Adjust the opacity to make it darker or lighter
//                           BlendMode.darken,
//                         ),
//                       ),
//                       color: Colors.blueAccent,
//                       borderRadius: BorderRadius.all(Radius.circular(11))
//                       // color: Colors.red,
//                       ),
//                   child: const Align(
//                       alignment: Alignment(-0.7, 0.5),
//                       child: Text(
//                         'Pets',
//                         style: TextStyle(color: Colors.white),
//                       )),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

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
          context, SubcategoryTest(keyy: "category", value: "Food"))
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
