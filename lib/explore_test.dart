// // // // // ignore_for_file: prefer_const_constructors

// // // // import 'package:flutter/material.dart';
// // // // import 'package:lottie/lottie.dart';
// // // // import 'package:sssv1/providers/sub_category_provider.dart';
// // // // import 'package:provider/provider.dart';
// // // // import 'package:sssv1/utils/constants.dart';
// // // // import 'package:sssv1/utils/navigator.dart';
// // // // import 'package:sssv1/screens/SubCategoryList.dart';
// // // // import 'package:line_awesome_flutter/line_awesome_flutter.dart';

// // // // class SubcategoryTest extends StatefulWidget {
// // // //   final String keyy;
// // // //   final String value;

// // // //   SubcategoryTest({required this.keyy, required this.value});

// // // //   @override
// // // //   State<SubcategoryTest> createState() => _SubcategoryTestState();
// // // // }

// // // // class _SubcategoryTestState extends State<SubcategoryTest> {
// // // //   Map<String, String> categoryGifs = {
// // // //     'Indian Restaurant': 'images/subcategoryimages/indianres.gif',
// // // //     'bakeries': 'images/subcategoryimages/bakery.gif',
// // // //     'Restaurant': 'images/subcategoryimages/restaurant.gif',
// // // //     'Pizzeria': 'images/subcategoryimages/pizza.gif',
// // // //     'Grocery Store': 'images/subcategoryimages/grocery.gif',
// // // //     'Coffee Tea': 'images/subcategoryimages/coffee.gif'
// // // //   };

// // // //   @override
// // // //   void initState() {
// // // //     super.initState();
// // // //     var data = Provider.of<businessProvider>(context, listen: false);
// // // //     data.getBusinessProvider(widget.keyy, widget.value);
// // // //   }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     var data = Provider.of<businessProvider>(context);

// // // //     return Scaffold(
// // // //       backgroundColor: secondaryColor10LightTheme,
// // // //       appBar: AppBar(
// // // //         leading: IconButton(
// // // //           onPressed: () {
// // // //             Navigator.of(context).pop();
// // // //           },
// // // //           icon: Icon(LineAwesomeIcons.angle_left, color: Colors.white),
// // // //         ),
// // // //         title: Text(
// // // //           widget.value,
// // // //           style: TextStyle(color: Colors.white, fontSize: 18),
// // // //         ),
// // // //         backgroundColor: tgAccentColor,
// // // //       ),
// // // //       body: data.isLoading
// // // //           ? Center(
// // // //               child: CircularProgressIndicator(
// // // //                 color: tgDarkPrimaryColor,
// // // //               ),
// // // //             )
// // // //           : Padding(
// // // //               padding: const EdgeInsets.all(15.0),
// // // //               child: GridView.builder(
// // // //                 itemCount: data.getUniqueSubcategoryData.length,
// // // //                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// // // //                   crossAxisCount: 2,
// // // //                   crossAxisSpacing: 20,
// // // //                   mainAxisSpacing: 24,
// // // //                   childAspectRatio: 3 / 4,
// // // //                 ),
// // // //                 itemBuilder: (BuildContext context, int index) {
// // // //                   String subcategory = data.getUniqueSubcategoryData[index];
// // // //                   // print("subcategory: $subcategory");

// // // //                   return GestureDetector(
// // // //                     onTap: () {
// // // //                       navigatorPush(
// // // //                         context,
// // // //                         SubCategoryList(
// // // //                           keyy: "sub_category",
// // // //                           value: subcategory,
// // // //                         ),
// // // //                       );
// // // //                     },
// // // //                     child: Card(
// // // //                       color: Colors.white,
// // // //                       shape: RoundedRectangleBorder(
// // // //                         borderRadius: BorderRadius.circular(15),
// // // //                       ),
// // // //                       elevation: 6,
// // // //                       child: Column(
// // // //                         crossAxisAlignment: CrossAxisAlignment.stretch,
// // // //                         children: [
// // // //                           Expanded(
// // // //                             flex: 4,
// // // //                             child: ClipRRect(
// // // //                               borderRadius: BorderRadius.vertical(
// // // //                                 top: Radius.circular(15),
// // // //                               ),
// // // //                               child: categoryGifs[subcategory] != null
// // // //                                   ? Image.asset(
// // // //                                       categoryGifs[subcategory]!,
// // // //                                       fit: BoxFit.cover,
// // // //                                     )
// // // //                                   : Lottie.asset(
// // // //                                       "images/Default.json",
// // // //                                       fit: BoxFit.cover,
// // // //                                     ),
// // // //                             ),
// // // //                           ),
// // // //                           Expanded(
// // // //                             flex: 2,
// // // //                             child: Container(
// // // //                               padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
// // // //                               decoration: BoxDecoration(
// // // //                                 color: tgDarkPrimaryColor,
// // // //                                 borderRadius: BorderRadius.vertical(
// // // //                                   bottom: Radius.circular(15),
// // // //                                 ),
// // // //                               ),
// // // //                               child: Center(
// // // //                                 child: Text(
// // // //                                   subcategory,
// // // //                                   style: TextStyle(
// // // //                                     color: Colors.white,
// // // //                                     fontSize: 14,
// // // //                                     fontWeight: FontWeight.bold,
// // // //                                   ),
// // // //                                 ),
// // // //                               ),
// // // //                             ),
// // // //                           ),
// // // //                         ],
// // // //                       ),
// // // //                     ),
// // // //                   );
// // // //                 },
// // // //               ),
// // // //             ),
// // // //     );
// // // //   }
// // // // }

// // // import 'package:flutter/material.dart';
// // // import 'package:provider/provider.dart';
// // // import 'package:sssv1/providers/sub_category_provider.dart';
// // // import 'package:sssv1/utils/constants.dart';
// // // import 'package:sssv1/utils/navigator.dart';
// // // import 'package:sssv1/screens/SubCategoryList.dart';
// // // import 'package:line_awesome_flutter/line_awesome_flutter.dart';

// // // class SubcategoryTest extends StatefulWidget {
// // //   final String keyy;
// // //   final String value;

// // //   SubcategoryTest({required this.keyy, required this.value});

// // //   @override
// // //   State<SubcategoryTest> createState() => _SubcategoryTestState();
// // // }

// // // class _SubcategoryTestState extends State<SubcategoryTest> {
// // //   Map<String, String> categoryImages = {
// // //     'Indian Restaurant': 'images/subcategoryimages/indianres.jpg',
// // //     'bakeries': 'images/subcategoryimages/bakery.jpg',
// // //     'Restaurant': 'images/subcategoryimages/restaurant.jpg',
// // //     'Pizzeria': 'images/subcategoryimages/pizza.jpg',
// // //     'Grocery Store': 'images/subcategoryimages/grocery.jpg',
// // //     'Coffee Tea': 'images/subcategoryimages/coffee.jpg'
// // //   };

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     var data = Provider.of<businessProvider>(context, listen: false);
// // //     data.getBusinessProvider(widget.keyy, widget.value);
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     var data = Provider.of<businessProvider>(context);

// // //     return Scaffold(
// // //       backgroundColor: secondaryColor10LightTheme,
// // //       appBar: AppBar(
// // //         leading: IconButton(
// // //           onPressed: () => Navigator.of(context).pop(),
// // //           icon: Icon(LineAwesomeIcons.angle_left, color: Colors.white),
// // //         ),
// // //         title: Text(
// // //           widget.value,
// // //           style: TextStyle(color: Colors.white, fontSize: 18),
// // //         ),
// // //         backgroundColor: tgAccentColor,
// // //       ),
// // //       body: data.isLoading
// // //           ? Center(
// // //               child: CircularProgressIndicator(color: tgDarkPrimaryColor),
// // //             )
// // //           : ListView.builder(
// // //               itemCount: data.getUniqueSubcategoryData.length,
// // //               itemBuilder: (context, index) {
// // //                 String subcategory = data.getUniqueSubcategoryData[index];
// // //                 return Padding(
// // //                   padding: const EdgeInsets.symmetric(
// // //                       vertical: 8.0, horizontal: 16.0),
// // //                   child: GestureDetector(
// // //                     onTap: () {
// // //                       navigatorPush(
// // //                         context,
// // //                         SubCategoryList(
// // //                           keyy: "sub_category",
// // //                           value: subcategory,
// // //                         ),
// // //                       );
// // //                     },
// // //                     child: Hero(
// // //                       tag: subcategory,
// // //                       child: Material(
// // //                         elevation: 8.0,
// // //                         borderRadius: BorderRadius.circular(12.0),
// // //                         child: Container(
// // //                           height: 200,
// // //                           decoration: BoxDecoration(
// // //                             borderRadius: BorderRadius.circular(12.0),
// // //                             image: DecorationImage(
// // //                               image: AssetImage(categoryImages[subcategory] ??
// // //                                   'images/default.jpg'),
// // //                               fit: BoxFit.cover,
// // //                             ),
// // //                           ),
// // //                           child: Container(
// // //                             decoration: BoxDecoration(
// // //                               borderRadius: BorderRadius.circular(12.0),
// // //                               gradient: LinearGradient(
// // //                                 begin: Alignment.topCenter,
// // //                                 end: Alignment.bottomCenter,
// // //                                 colors: [
// // //                                   Colors.transparent,
// // //                                   Colors.black.withOpacity(0.7)
// // //                                 ],
// // //                               ),
// // //                             ),
// // //                             child: Align(
// // //                               alignment: Alignment.bottomLeft,
// // //                               child: Padding(
// // //                                 padding: const EdgeInsets.all(16.0),
// // //                                 child: Text(
// // //                                   subcategory,
// // //                                   style: TextStyle(
// // //                                     color: Colors.white,
// // //                                     fontSize: 24,
// // //                                     fontWeight: FontWeight.bold,
// // //                                   ),
// // //                                 ),
// // //                               ),
// // //                             ),
// // //                           ),
// // //                         ),
// // //                       ),
// // //                     ),
// // //                   ),
// // //                 );
// // //               },
// // //             ),
// // //     );
// // //   }
// // // }

// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// // import 'package:sssv1/providers/sub_category_provider.dart';
// // import 'package:sssv1/utils/constants.dart';
// // import 'package:sssv1/utils/navigator.dart';
// // import 'package:sssv1/screens/SubCategoryList.dart';
// // import 'package:line_awesome_flutter/line_awesome_flutter.dart';

// // class SubcategoryBubbles extends StatefulWidget {
// //   final String keyy;
// //   final String value;

// //   SubcategoryBubbles({required this.keyy, required this.value});

// //   @override
// //   State<SubcategoryBubbles> createState() => _SubcategoryBubblesState();
// // }

// // class _SubcategoryBubblesState extends State<SubcategoryBubbles> {
// //   @override
// //   void initState() {
// //     super.initState();
// //     var data = Provider.of<businessProvider>(context, listen: false);
// //     data.getBusinessProvider(widget.keyy, widget.value);
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     var data = Provider.of<businessProvider>(context);

// //     return Scaffold(
// //       backgroundColor: secondaryColor10LightTheme,
// //       appBar: AppBar(
// //         leading: IconButton(
// //           onPressed: () => Navigator.of(context).pop(),
// //           icon: Icon(LineAwesomeIcons.angle_left, color: Colors.white),
// //         ),
// //         title: Text(
// //           widget.value,
// //           style: TextStyle(color: Colors.white, fontSize: 18),
// //         ),
// //         backgroundColor: tgAccentColor,
// //       ),
// //       body: data.isLoading
// //           ? Center(
// //               child: CircularProgressIndicator(color: tgDarkPrimaryColor),
// //             )
// //           : Flow(
// //               delegate: BubbleFlowDelegate(),
// //               children: data.getUniqueSubcategoryData.map((subcategory) {
// //                 return GestureDetector(
// //                   onTap: () {
// //                     navigatorPush(
// //                       context,
// //                       SubCategoryList(
// //                         keyy: "sub_category",
// //                         value: subcategory,
// //                       ),
// //                     );
// //                   },
// //                   child: Container(
// //                     width: 120,
// //                     height: 120,
// //                     decoration: BoxDecoration(
// //                       shape: BoxShape.circle,
// //                       color: Colors.primaries[
// //                           data.getUniqueSubcategoryData.indexOf(subcategory) %
// //                               Colors.primaries.length],
// //                     ),
// //                     child: Center(
// //                       child: Text(
// //                         subcategory,
// //                         textAlign: TextAlign.center,
// //                         style: TextStyle(
// //                             color: Colors.white, fontWeight: FontWeight.bold),
// //                       ),
// //                     ),
// //                   ),
// //                 );
// //               }).toList(),
// //             ),
// //     );
// //   }
// // }

// // class BubbleFlowDelegate extends FlowDelegate {
// //   @override
// //   void paintChildren(FlowPaintingContext context) {
// //     double x = 0;
// //     double y = 0;
// //     for (int i = 0; i < context.childCount; i++) {
// //       final size = context.getChildSize(i)!;
// //       context.paintChild(
// //         i,
// //         transform: Matrix4.translationValues(x, y, 0),
// //       );
// //       if (x + size.width > context.size.width) {
// //         x = 0;
// //         y += size.height;
// //       } else {
// //         x += size.width * 0.8; // Overlap bubbles slightly
// //       }
// //     }
// //   }

// //   @override
// //   bool shouldRepaint(covariant FlowDelegate oldDelegate) => false;
// // }

// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// // import 'package:sssv1/providers/sub_category_provider.dart';
// // import 'package:sssv1/utils/constants.dart';
// // import 'package:sssv1/utils/navigator.dart';
// // import 'package:sssv1/screens/SubCategoryList.dart';
// // import 'package:line_awesome_flutter/line_awesome_flutter.dart';
// // import 'package:vector_math/vector_math_64.dart' show Vector3;

// // class SubcategoryCube extends StatefulWidget {
// //   final String keyy;
// //   final String value;

// //   SubcategoryCube({required this.keyy, required this.value});

// //   @override
// //   State<SubcategoryCube> createState() => _SubcategoryCubeState();
// // }

// // class _SubcategoryCubeState extends State<SubcategoryCube>
// //     with SingleTickerProviderStateMixin {
// //   late AnimationController _controller;
// //   Vector3 _rotation = Vector3.zero();

// //   @override
// //   void initState() {
// //     super.initState();
// //     var data = Provider.of<businessProvider>(context, listen: false);
// //     data.getBusinessProvider(widget.keyy, widget.value);
// //     _controller =
// //         AnimationController(vsync: this, duration: Duration(milliseconds: 5000))
// //           ..repeat();
// //   }

// //   @override
// //   void dispose() {
// //     _controller.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     var data = Provider.of<businessProvider>(context);

// //     return Scaffold(
// //       backgroundColor: secondaryColor10LightTheme,
// //       appBar: AppBar(
// //         leading: IconButton(
// //           onPressed: () => Navigator.of(context).pop(),
// //           icon: Icon(LineAwesomeIcons.angle_left, color: Colors.white),
// //         ),
// //         title: Text(
// //           widget.value,
// //           style: TextStyle(color: Colors.white, fontSize: 18),
// //         ),
// //         backgroundColor: tgAccentColor,
// //       ),
// //       body: data.isLoading
// //           ? Center(
// //               child: CircularProgressIndicator(color: tgDarkPrimaryColor),
// //             )
// //           : Center(
// //               child: GestureDetector(
// //                 onPanUpdate: (details) {
// //                   setState(() {
// //                     _rotation.y += details.delta.dx * 0.01;
// //                     _rotation.x += details.delta.dy * 0.01;
// //                   });
// //                 },
// //                 child: AnimatedBuilder(
// //                   animation: _controller,
// //                   builder: (context, child) {
// //                     return Transform(
// //                       transform: Matrix4.identity()
// //                         ..setEntry(3, 2, 0.001)
// //                         ..rotateX(_rotation.x)
// //                         ..rotateY(_rotation.y),
// //                       alignment: Alignment.center,
// //                       child: Cube(
// //                         subcategories: data.getUniqueSubcategoryData
// //                             .take(6)
// //                             .map((dynamic item) => item.toString())
// //                             .toList(),
// //                       ),
// //                     );
// //                   },
// //                 ),
// //               ),
// //             ),
// //     );
// //   }
// // }

// // class Cube extends StatelessWidget {
// //   final List<String> subcategories;

// //   Cube({required this.subcategories});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Stack(
// //       children: [
// //         // Front face
// //         Transform(
// //           transform: Matrix4.identity()..translate(0.0, 0.0, 150.0),
// //           child: _buildFace(
// //               subcategories.isNotEmpty ? subcategories[0] : 'N/A', Colors.red),
// //         ),
// //         // Back face
// //         Transform(
// //           transform: Matrix4.identity()
// //             ..translate(0.0, 0.0, -150.0)
// //             ..rotateX(3.14),
// //           child: _buildFace(
// //               subcategories.length > 1 ? subcategories[1] : 'N/A', Colors.blue),
// //         ),
// //         // Left face
// //         Transform(
// //           transform: Matrix4.identity()
// //             ..translate(-150.0, 0.0, 0.0)
// //             ..rotateY(-1.57),
// //           child: _buildFace(subcategories.length > 2 ? subcategories[2] : 'N/A',
// //               Colors.green),
// //         ),
// //         // Right face
// //         Transform(
// //           transform: Matrix4.identity()
// //             ..translate(150.0, 0.0, 0.0)
// //             ..rotateY(1.57),
// //           child: _buildFace(subcategories.length > 3 ? subcategories[3] : 'N/A',
// //               Colors.yellow),
// //         ),
// //         // Top face
// //         Transform(
// //           transform: Matrix4.identity()
// //             ..translate(0.0, -150.0, 0.0)
// //             ..rotateX(-1.57),
// //           child: _buildFace(subcategories.length > 4 ? subcategories[4] : 'N/A',
// //               Colors.orange),
// //         ),
// //         // Bottom face
// //         Transform(
// //           transform: Matrix4.identity()
// //             ..translate(0.0, 150.0, 0.0)
// //             ..rotateX(1.57),
// //           child: _buildFace(subcategories.length > 5 ? subcategories[5] : 'N/A',
// //               Colors.purple),
// //         ),
// //       ],
// //     );
// //   }

// //   Widget _buildFace(String subcategory, Color color) {
// //     return GestureDetector(
// //       onTap: () {
// //         // Handle navigation here
// //       },
// //       child: Container(
// //         width: 300,
// //         height: 300,
// //         color: color,
// //         child: Center(
// //           child: Text(
// //             subcategory,
// //             style: TextStyle(
// //                 color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// // import 'package:sssv1/providers/sub_category_provider.dart';
// // import 'package:sssv1/utils/constants.dart';
// // import 'package:sssv1/utils/navigator.dart';
// // import 'package:sssv1/screens/SubCategoryList.dart';
// // import 'package:line_awesome_flutter/line_awesome_flutter.dart';
// // import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// // import 'package:carousel_slider/carousel_slider.dart';

// // class EnhancedSubcategoryView extends StatefulWidget {
// //   final String keyy;
// //   final String value;

// //   EnhancedSubcategoryView({required this.keyy, required this.value});

// //   @override
// //   State<EnhancedSubcategoryView> createState() =>
// //       _EnhancedSubcategoryViewState();
// // }

// // class _EnhancedSubcategoryViewState extends State<EnhancedSubcategoryView> {
// //   Map<String, String> categoryImages = {
// //     'Indian Restaurant': 'images/subcategoryimages/indianres.jpg',
// //     'bakeries': 'images/subcategoryimages/bakery.jpg',
// //     'Restaurant': 'images/subcategoryimages/restaurant.jpg',
// //     'Pizzeria': 'images/subcategoryimages/pizza.jpg',
// //     'Grocery Store': 'images/subcategoryimages/grocery.jpg',
// //     'Coffee Tea': 'images/subcategoryimages/coffee.jpg'
// //   };

// //   @override
// //   void initState() {
// //     super.initState();
// //     var data = Provider.of<businessProvider>(context, listen: false);
// //     data.getBusinessProvider(widget.keyy, widget.value);
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     var data = Provider.of<businessProvider>(context);

// //     return Scaffold(
// //       backgroundColor: secondaryColor10LightTheme,
// //       appBar: AppBar(
// //         leading: IconButton(
// //           onPressed: () => Navigator.of(context).pop(),
// //           icon: Icon(LineAwesomeIcons.angle_left, color: Colors.white),
// //         ),
// //         title: Text(
// //           widget.value,
// //           style: TextStyle(color: Colors.white, fontSize: 18),
// //         ),
// //         backgroundColor: tgAccentColor,
// //       ),
// //       body: data.isLoading
// //           ? Center(child: CircularProgressIndicator(color: tgDarkPrimaryColor))
// //           : Column(
// //               children: [
// //                 // Carousel for featured categories
// //                 if (data.getUniqueSubcategoryData.isNotEmpty)
// //                   CarouselSlider(
// //                     options: CarouselOptions(
// //                       height: 200.0,
// //                       enlargeCenterPage: true,
// //                       autoPlay: true,
// //                       aspectRatio: 16 / 9,
// //                       autoPlayCurve: Curves.fastOutSlowIn,
// //                       enableInfiniteScroll: true,
// //                       autoPlayAnimationDuration: Duration(milliseconds: 800),
// //                       viewportFraction: 0.8,
// //                     ),
// //                     items: data.getUniqueSubcategoryData
// //                         .take(5)
// //                         .map((subcategory) {
// //                       return Builder(
// //                         builder: (BuildContext context) {
// //                           return Container(
// //                             width: MediaQuery.of(context).size.width,
// //                             margin: EdgeInsets.symmetric(horizontal: 5.0),
// //                             decoration: BoxDecoration(
// //                               borderRadius: BorderRadius.circular(10),
// //                               image: DecorationImage(
// //                                 image: AssetImage(categoryImages[subcategory] ??
// //                                     'images/default.jpg'),
// //                                 fit: BoxFit.cover,
// //                               ),
// //                             ),
// //                             child: Container(
// //                               decoration: BoxDecoration(
// //                                 borderRadius: BorderRadius.circular(10),
// //                                 gradient: LinearGradient(
// //                                   begin: Alignment.topCenter,
// //                                   end: Alignment.bottomCenter,
// //                                   colors: [
// //                                     Colors.transparent,
// //                                     Colors.black.withOpacity(0.7)
// //                                   ],
// //                                 ),
// //                               ),
// //                               child: Center(
// //                                 child: Text(
// //                                   subcategory,
// //                                   style: TextStyle(
// //                                       fontSize: 20.0,
// //                                       color: Colors.white,
// //                                       fontWeight: FontWeight.bold),
// //                                 ),
// //                               ),
// //                             ),
// //                           );
// //                         },
// //                       );
// //                     }).toList(),
// //                   ),
// //                 SizedBox(height: 20),
// //                 // Masonry grid for remaining categories
// //                 Expanded(
// //                   child: data.getUniqueSubcategoryData.length > 5
// //                       ? MasonryGridView.count(
// //                           crossAxisCount: 2,
// //                           mainAxisSpacing: 4,
// //                           crossAxisSpacing: 4,
// //                           itemCount: data.getUniqueSubcategoryData.length - 5,
// //                           itemBuilder: (context, index) {
// //                             String subcategory =
// //                                 data.getUniqueSubcategoryData[index + 5];
// //                             return AnimatedTile(
// //                               subcategory: subcategory,
// //                               image: categoryImages[subcategory] ??
// //                                   'images/default.jpg',
// //                               onTap: () {
// //                                 navigatorPush(
// //                                   context,
// //                                   SubCategoryList(
// //                                     keyy: "sub_category",
// //                                     value: subcategory,
// //                                   ),
// //                                 );
// //                               },
// //                             );
// //                           },
// //                         )
// //                       : Center(child: Text("No additional subcategories")),
// //                 ),
// //               ],
// //             ),
// //     );
// //   }
// // }

// // class AnimatedTile extends StatefulWidget {
// //   final String subcategory;
// //   final String image;
// //   final VoidCallback onTap;

// //   AnimatedTile(
// //       {required this.subcategory, required this.image, required this.onTap});

// //   @override
// //   _AnimatedTileState createState() => _AnimatedTileState();
// // }

// // class _AnimatedTileState extends State<AnimatedTile>
// //     with SingleTickerProviderStateMixin {
// //   late AnimationController _controller;
// //   late Animation<double> _scaleAnimation;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _controller = AnimationController(
// //       vsync: this,
// //       duration: Duration(milliseconds: 200),
// //     );
// //     _scaleAnimation = Tween<double>(begin: 1, end: 1.05).animate(_controller);
// //   }

// //   @override
// //   void dispose() {
// //     _controller.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return GestureDetector(
// //       onTapDown: (_) => _controller.forward(),
// //       onTapUp: (_) => _controller.reverse(),
// //       onTapCancel: () => _controller.reverse(),
// //       onTap: widget.onTap,
// //       child: ScaleTransition(
// //         scale: _scaleAnimation,
// //         child: Container(
// //           height: (widget.subcategory.length % 3 + 2) * 60.0, // Varying heights
// //           decoration: BoxDecoration(
// //             borderRadius: BorderRadius.circular(10),
// //             image: DecorationImage(
// //               image: AssetImage(widget.image),
// //               fit: BoxFit.cover,
// //             ),
// //           ),
// //           child: Container(
// //             decoration: BoxDecoration(
// //               borderRadius: BorderRadius.circular(10),
// //               gradient: LinearGradient(
// //                 begin: Alignment.topCenter,
// //                 end: Alignment.bottomCenter,
// //                 colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
// //               ),
// //             ),
// //             child: Center(
// //               child: Text(
// //                 widget.subcategory,
// //                 style:
// //                     TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
// //                 textAlign: TextAlign.center,
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:sssv1/providers/sub_category_provider.dart';
// import 'package:sssv1/utils/constants.dart';
// import 'package:sssv1/utils/navigator.dart';
// import 'package:sssv1/screens/SubCategoryList.dart';
// import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

// class ModernCategoryView extends StatefulWidget {
//   final String keyy;
//   final String value;

//   ModernCategoryView({required this.keyy, required this.value});

//   @override
//   _ModernCategoryViewState createState() => _ModernCategoryViewState();
// }

// class _ModernCategoryViewState extends State<ModernCategoryView> {
//   late TextEditingController _searchController;

//   @override
//   void initState() {
//     super.initState();
//     _searchController = TextEditingController();
//     var data = Provider.of<businessProvider>(context, listen: false);
//     data.getBusinessProvider(widget.keyy, widget.value);
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var data = Provider.of<businessProvider>(context);

//     return Scaffold(
//       body: CustomScrollView(
//         slivers: <Widget>[
//           SliverAppBar(
//             backgroundColor: tgPrimaryColor,
//             expandedHeight: 200.0,
//             floating: false,
//             pinned: true,
//             automaticallyImplyLeading: true,
//             leading: IconButton(
//               icon: Icon(Icons.keyboard_arrow_left_rounded),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//             flexibleSpace: FlexibleSpaceBar(
//               title: Text(
//                 widget.value,
//                 style: TextStyle(fontSize: 16.0),
//               ),
//               background: Image.asset(
//                 'images/foodexplore.jpg',
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           // SliverToBoxAdapter(
//           //   child: Padding(
//           //     padding: const EdgeInsets.all(16.0),
//           //     child: TextField(
//           //       controller: _searchController,
//           //       decoration: InputDecoration(
//           //         hintText: 'Search categories...',
//           //         prefixIcon: Icon(Icons.search),
//           //         border: OutlineInputBorder(
//           //           borderRadius: BorderRadius.circular(30),
//           //         ),
//           //       ),
//           //       onChanged: (value) {
//           //         // Implement search functionality here
//           //       },
//           //     ),
//           //   ),
//           // ),
//           SliverPadding(
//             padding: const EdgeInsets.all(16.0),
//             sliver: data.isLoading
//                 ? SliverFillRemaining(
//                     child: Center(
//                       child: CircularProgressIndicator(
//                         color: tgDarkPrimaryColor,
//                       ),
//                     ),
//                   )
//                 : AnimationLimiter(
//                     child: SliverGrid(
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2,
//                         childAspectRatio: 1.0,
//                         crossAxisSpacing: 10.0,
//                         mainAxisSpacing: 10.0,
//                       ),
//                       delegate: SliverChildBuilderDelegate(
//                         (BuildContext context, int index) {
//                           return AnimationConfiguration.staggeredGrid(
//                             position: index,
//                             duration: const Duration(milliseconds: 375),
//                             columnCount: 2,
//                             child: ScaleAnimation(
//                               child: FadeInAnimation(
//                                 child: CategoryCard(
//                                   category:
//                                       data.getUniqueSubcategoryData[index],
//                                   onTap: () {
//                                     navigatorPush(
//                                       context,
//                                       SubCategoryList(
//                                         keyy: "sub_category",
//                                         value: data
//                                             .getUniqueSubcategoryData[index],
//                                       ),
//                                     );
//                                   },
//                                 ),
//                               ),
//                             ),
//                           );
//                         },
//                         childCount: data.getUniqueSubcategoryData.length,
//                       ),
//                     ),
//                   ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CategoryCard extends StatelessWidget {
//   final String category;
//   final VoidCallback onTap;

//   CategoryCard({required this.category, required this.onTap});

//   // @override
//   // Widget build(BuildContext context) {
//   //   return GestureDetector(
//   //     onTap: onTap,
//   //     child: Card(

//   //       elevation: 4,
//   //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//   //       child: SizedBox(
//   //         height: 200,
//   //         child: Container(
//   //           decoration: BoxDecoration(
//   //             borderRadius: BorderRadius.circular(15),
//   //             gradient: LinearGradient(
//   //               begin: Alignment.topLeft,
//   //               end: Alignment.bottomRight,
//   //               colors: [
//   //                 const Color.fromARGB(255, 106, 197, 188),
//   //                 Colors.teal.shade600,
//   //               ],
//   //             ),
//   //           ),
//   //           child: Center(
//   //             child: Text(
//   //               category,
//   //               style: TextStyle(
//   //                 color: Colors.white,
//   //                 fontWeight: FontWeight.w600,
//   //                 fontSize: 16,
//   //               ),
//   //               textAlign: TextAlign.center,
//   //             ),
//   //           ),
//   //         ),
//   //       ),
//   //     ),
//   //   );
//   // }

//   // @override
//   // Widget build(BuildContext context) {
//   //   return GestureDetector(
//   //     onTap: onTap,
//   //     child: Card(
//   //       elevation: 2,
//   //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//   //       child: AspectRatio(
//   //         aspectRatio: 4, // Adjusted aspect ratio for smaller size
//   //         child: Container(
//   //           decoration: BoxDecoration(
//   //             borderRadius: BorderRadius.circular(12),
//   //             gradient: LinearGradient(
//   //               begin: Alignment.topLeft,
//   //               end: Alignment.bottomRight,
//   //               colors: [
//   //                 // Colors.lightBlue.shade200,
//   //                 // Colors.lightGreen.shade300,
//   //                 tgLightPrimaryColor,

//   //                 secondaryColor20LightTheme,
//   //               ],
//   //             ),
//   //           ),
//   //           child: Stack(
//   //             children: [
//   //               Positioned(
//   //                 top: 8,
//   //                 right: 8,
//   //                 child: Icon(
//   //                   Icons.category,
//   //                   color: Colors.white.withOpacity(0.3),
//   //                   size: 30,
//   //                 ),
//   //               ),
//   //               Center(
//   //                 child: Column(
//   //                   mainAxisAlignment: MainAxisAlignment.center,
//   //                   children: [
//   //                     Icon(
//   //                       Icons.restaurant_menu_rounded,
//   //                       color: tgDarkPrimaryColor,
//   //                       size: 40,
//   //                     ),
//   //                     SizedBox(height: 8),
//   //                     Text(
//   //                       category,
//   //                       style: TextStyle(
//   //                         color: Colors.white,
//   //                         fontWeight: FontWeight.w600,
//   //                         fontSize: 14,
//   //                       ),
//   //                       textAlign: TextAlign.center,
//   //                     ),
//   //                   ],
//   //                 ),
//   //               ),
//   //             ],
//   //           ),
//   //         ),
//   //       ),
//   //     ),
//   //   );
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2, // Number of columns
//         childAspectRatio: 3 / 2, // Aspect ratio for each item
//         mainAxisSpacing: 10,
//         crossAxisSpacing: 10,
//       ),
//       itemCount: itemCount, // The number of items
//       itemBuilder: (context, index) {
//         return GestureDetector(
//           onTap: () {
//             // Handle tap event
//           },
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12),
//               gradient: LinearGradient(
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//                 colors: [
//                   Colors.lightBlue.shade200,
//                   Colors.lightGreen.shade300,
//                 ],
//               ),
//             ),
//             child: Stack(
//               children: [
//                 Positioned(
//                   top: 8,
//                   right: 8,
//                   child: Icon(
//                     Icons.category,
//                     color: Colors.white.withOpacity(0.3),
//                     size: 30,
//                   ),
//                 ),
//                 Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(
//                         Icons.restaurant_menu_rounded,
//                         color: Colors.teal,
//                         size: 40,
//                       ),
//                       SizedBox(height: 8),
//                       Text(
//                         'Category $index',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.w600,
//                           fontSize: 14,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/providers/sub_category_provider.dart';
import 'package:sssv1/utils/constants.dart';
import 'package:sssv1/utils/navigator.dart';
import 'package:sssv1/screens/SubCategoryList.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ModernCategoryView extends StatefulWidget {
  final String keyy;
  final String value;

  ModernCategoryView({required this.keyy, required this.value});

  @override
  _ModernCategoryViewState createState() => _ModernCategoryViewState();
}

class _ModernCategoryViewState extends State<ModernCategoryView> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    var data = Provider.of<businessProvider>(context, listen: false);
    data.getBusinessProvider(widget.keyy, widget.value);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<businessProvider>(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: tgPrimaryColor,
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            snap: false,
            automaticallyImplyLeading: true,
            leading: IconButton(
              icon: Icon(Icons.keyboard_arrow_left_rounded),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                widget.value,
                style: TextStyle(fontSize: 16.0),
              ),
              background: Image.asset(
                'images/foodexplore.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: data.isLoading
                ? SliverFillRemaining(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: tgDarkPrimaryColor,
                      ),
                    ),
                  )
                : AnimationLimiter(
                    child: SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.6,
                        crossAxisSpacing: 18,
                        mainAxisSpacing: 28,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return AnimationConfiguration.staggeredGrid(
                            position: index,
                            duration: const Duration(milliseconds: 375),
                            columnCount: 2,
                            child: ScaleAnimation(
                              child: FadeInAnimation(
                                child: CategoryCard(
                                  category:
                                      data.getUniqueSubcategoryData[index],
                                  onTap: () {
                                    navigatorPush(
                                      context,
                                      SubCategoryList(
                                        keyy: "sub_category",
                                        value: data
                                            .getUniqueSubcategoryData[index],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                        childCount: data.getUniqueSubcategoryData.length,
                      ),
                    ),
                  ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(),
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String category;
  final VoidCallback onTap;

  CategoryCard({required this.category, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              tgLightPrimaryColor,
              secondaryColor20LightTheme,
            ],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 8,
              right: 8,
              child: Icon(
                Icons.category,
                color: Colors.white.withOpacity(0.3),
                size: 30,
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.restaurant_menu_rounded,
                    color: tgDarkPrimaryColor,
                    size: 40,
                  ),
                  SizedBox(height: 8),
                  Text(
                    category,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
