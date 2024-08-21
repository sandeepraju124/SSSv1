// // ignore_for_file: prefer_const_constructors
//
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:sssv1/NewdefaultprofilePage/defaultpage&tabview.dart';
// import 'package:sssv1/providers/home_restaurent_provider.dart';
//
// import 'package:provider/provider.dart';
// import 'package:sssv1/utils/constants.dart';
//
// class RestaurantTest extends StatefulWidget {
//   const RestaurantTest({super.key});
//
//   @override
//   State<RestaurantTest> createState() => _RestaurantTestState();
// }
//
// class _RestaurantTestState extends State<RestaurantTest> {
//   @override
//   void initState() {
//     var data = Provider.of<HomeRestaurantListProvider>(context, listen: false);
//     if (data.FeaturedList.isEmpty) {
//       data.fetchFeatured();
//     }
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var data = Provider.of<HomeRestaurantListProvider>(context);
//     return data.isLoading
//         ? Center(
//             child: CircularProgressIndicator(color: tgPrimaryColor),
//           )
//         : SizedBox(
//             height: 290,
//             child: ListView.builder(
//                 physics: const BouncingScrollPhysics(),
//                 scrollDirection: Axis.horizontal,
//                 itemCount: data.getHomeBusinessData.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   final overallRating = data.businessRating[
//                       data.getHomeBusinessData[index]!.businessUid]!['rating'];
//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) => DefaultProfilePage(
//                                 uid: data
//                                     .getHomeBusinessData[index]!.businessUid,
//                               )));
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 14, right: 10),
//                       child: Container(
//                         width: 160,
//                         // height: MediaQuery.of(context).size.height * 0.25,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(15),
//                             // boxShadow: [
//                             //   BoxShadow(
//                             //     // color: Colors.grey.withOpacity(0.2),
//                             //     spreadRadius: 3,
//                             //     blurRadius: 5,
//                             //     offset: Offset(0, 3),
//                             //   ),
//                             // ],
//                             // color: const Color.fromARGB(255, 125, 28, 28),
//                             // color: tgLightPrimaryColor
//                             color: secondaryColor10LightTheme
//                             // color: Colors.white70,
//                             ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             ClipRRect(
//                               borderRadius: BorderRadius.vertical(
//                                   top: Radius.circular(15)),
//                               child: (data.getHomeBusinessData[index]
//                                               ?.profileImageUrl !=
//                                           null &&
//                                       data.getHomeBusinessData[index]!
//                                           .profileImageUrl.isNotEmpty)
//                                   ? Image.network(
//                                       data.getHomeBusinessData[index]!
//                                           .profileImageUrl,
//                                       height: 180,
//                                       width: double.infinity,
//                                       fit: BoxFit.cover,
//                                     )
//                                   : Image.network(
//                                       'https://www.strasys.uk/wp-content/uploads/2022/02/Depositphotos_484354208_S.jpg',
//                                       height: 180,
//                                       width: double.infinity,
//                                       fit: BoxFit.cover,
//                                     ),
//                             ),
//
//                             // ClipRRect(
//                             //   borderRadius: BorderRadius.vertical(
//                             //       top: Radius.circular(15)),
//                             //   child: data.getHomeBusinessData[index]!
//                             //         .profileImageUrl != null ? Image.network(
//                             //     data.getHomeBusinessData[index]!
//                             //         .profileImageUrl,
//                             //     height: 180,
//                             //     width: double.infinity,
//                             //     fit: BoxFit.cover,
//                             //   ): Image.network(
//                             //     'https://www.strasys.uk/wp-content/uploads/2022/02/Depositphotos_484354208_S.jpg',
//                             //     height: 180,
//                             //     width: double.infinity,
//                             //     fit: BoxFit.cover,
//                             //   )
//                             // ),
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     data.getHomeBusinessData[index]!
//                                         .businessName,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: TextStyle(
//                                       fontSize: 14.7,
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                   ),
//                                   SizedBox(height: 5),
//                                   Text(
//                                     data.getHomeBusinessData[index]!
//                                         .businessDescription,
//                                     overflow: TextOverflow.ellipsis,
//                                     maxLines: 2,
//                                     style: TextStyle(
//                                       fontSize: 11,
//                                       color: Colors.grey,
//                                     ),
//                                   ),
//                                   SizedBox(height: 10),
//                                   Row(
//                                     children: [
//                                       Icon(Icons.star,
//                                           color: Colors.teal[700], size: 16),
//                                       SizedBox(width: 4),
//                                       Text(
//                                         overallRating.toString(),
//                                         style: TextStyle(
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                       Spacer(),
//                                       Text("209 reviews",
//                                           style: TextStyle(
//                                               fontSize: 12,
//                                               color: Colors.grey)),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 }),
//           );
//   }
// }
