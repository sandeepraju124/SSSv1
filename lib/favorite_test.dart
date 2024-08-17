//
//
// //
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/providers/favourite_provider.dart';

import 'models/favourite_models.dart';

// // class FavoritesPage extends StatelessWidget {
// //   final List<Map<String, dynamic>> favorites = [
// //     {'name': 'John\'s Plumbing', 'type': 'Plumber', 'rating': 4.8, 'image': 'assets/food.jpg', 'distance': '2.3 mi'},
// //     {'name': 'ElectriCity', 'type': 'Electrician', 'rating': 4.6, 'image': 'assets/food.jpg', 'distance': '1.5 mi'},
// //     {'name': 'Mehfil Restaurant', 'type': 'Restaurant', 'rating': 4.9, 'image': 'assets/food.jpg', 'distance': '0.8 mi'},
// //     // Add more favorites here
// //   ];
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.grey[100],
// //       appBar: AppBar(
// //         title: Text('My Favorites', style: TextStyle(color: Colors.black87)),
// //         backgroundColor: Colors.white,
// //         elevation: 0,
// //         actions: [
// //           IconButton(
// //             icon: Icon(Icons.search, color: Colors.black87),
// //             onPressed: () {
// //               // TODO: Implement search functionality
// //             },
// //           ),
// //         ],
// //       ),
// //       body: AnimationLimiter(
// //         child: ListView.builder(
// //           itemCount: favorites.length,
// //           itemBuilder: (BuildContext context, int index) {
// //             return AnimationConfiguration.staggeredList(
// //               position: index,
// //               duration: const Duration(milliseconds: 375),
// //               child: SlideAnimation(
// //                 verticalOffset: 50.0,
// //                 child: FadeInAnimation(
// //                   child: _buildFavoriteItem(favorites[index]),
// //                 ),
// //               ),
// //             );
// //           },
// //         ),
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: () {
// //           // TODO: Implement add new favorite functionality
// //         },
// //         child: Icon(Icons.add),
// //         backgroundColor: Colors.blue,
// //       ),
// //     );
// //   }
// //
// //   Widget _buildFavoriteItem(Map<String, dynamic> favorite) {
// //     return Card(
// //       margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
// //       elevation: 2,
// //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// //       child: ListTile(
// //         contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
// //         leading: CircleAvatar(
// //           radius: 25,
// //           backgroundColor: Colors.grey[200],
// //           child: Image.asset(
// //             // fit: BoxFit.fill,
// //             favorite['image'],
// //             width: 40,
// //             height: 40,
// //           ),
// //         ),
// //         title: Text(
// //           favorite['name'],
// //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
// //         ),
// //         subtitle: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             SizedBox(height: 4),
// //             Text(favorite['type'], style: TextStyle(fontSize: 12, color: Colors.grey[600])),
// //             SizedBox(height: 4),
// //             Row(
// //               children: [
// //                 RatingBarIndicator(
// //                   rating: favorite['rating'],
// //                   itemBuilder: (context, index) => Icon(Icons.star, color: Colors.amber),
// //                   itemCount: 5,
// //                   itemSize: 14.0,
// //                 ),
// //                 SizedBox(width: 4),
// //                 Text(
// //                   favorite['rating'].toString(),
// //                   style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
// //                 ),
// //               ],
// //             ),
// //           ],
// //         ),
// //         trailing: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           crossAxisAlignment: CrossAxisAlignment.end,
// //           children: [
// //             Text(
// //               favorite['distance'],
// //               style: TextStyle(fontSize: 12, color: Colors.grey[600]),
// //             ),
// //             SizedBox(height: 4),
// //             Icon(Icons.chevron_right, color: Colors.grey),
// //           ],
// //         ),
// //         onTap: () {
// //           // TODO: Navigate to business details page
// //         },
// //       ),
// //     );
// //   }
// // }
//
// //
// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:like_button/like_button.dart';
// import 'package:provider/provider.dart';
// import 'package:sssv1/providers/favourite_provider.dart';
//
// class FavoritesPage extends StatelessWidget {
//   final List<Map<String, dynamic>> favorites = [
//     {'name': 'John\'s Plumbing', 'type': 'Plumber', 'rating': 4.8, 'image': 'assets/food.jpg', 'distance': '2.3 mi'},
//     {'name': 'ElectriCity', 'type': 'Electrician', 'rating': 4.6, 'image': 'assets/food.jpg', 'distance': '1.5 mi'},
//     {'name': 'Mehfil Restaurant', 'type': 'Restaurant', 'rating': 4.9, 'image': 'assets/food.jpg', 'distance': '0.8 mi'},
//     // Add more favorites here
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     var data = Provider.of<FavouriteProvider>(context);
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       appBar: AppBar(
//         title: Text('My Favorites', style: TextStyle(color: Colors.black87)),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.search, color: Colors.black87),
//             onPressed: () {
//               // TODO: Implement search functionality
//             },
//           ),
//         ],
//       ),
//       body: AnimationLimiter(
//         child: ListView.builder(
//           itemCount: favorites.length,
//           itemBuilder: (BuildContext context, int index) {
//             return AnimationConfiguration.staggeredList(
//               position: index,
//               duration: const Duration(milliseconds: 375),
//               child: SlideAnimation(
//                 verticalOffset: 50.0,
//                 child: FadeInAnimation(
//                   child: _buildFavoriteItem(favorites[index]),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // TODO: Implement add new favorite functionality
//         },
//         child: Icon(Icons.add),
//         backgroundColor: Colors.blue,
//       ),
//     );
//   }
//
//   Widget _buildFavoriteItem(Map<String, dynamic> favorite) {
//     return Card(
//       margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       elevation: 2,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: InkWell(
//         onTap: () {
//           // TODO: Navigate to business details page
//         },
//         child: Padding(
//           padding: EdgeInsets.all(12),
//           child: Row(
//             children: [
//               _buildCoolImage(favorite['image']),
//               SizedBox(width: 16),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       // favorite['name'],
//                         data.favouriteModels[0].businessName,
//                       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                     ),
//                     SizedBox(height: 4),
//                     Text(favorite['type'], style: TextStyle(fontSize: 12, color: Colors.grey[600])),
//                     SizedBox(height: 4),
//                     Row(
//                       children: [
//                         RatingBarIndicator(
//                           rating: favorite['rating'],
//                           itemBuilder: (context, index) => Icon(Icons.star, color: Colors.amber),
//                           itemCount: 5,
//                           itemSize: 14.0,
//                         ),
//                         SizedBox(width: 4),
//                         Text(
//                           favorite['rating'].toString(),
//                           style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 4),
//                     Text(
//                       favorite['distance'],
//                       style: TextStyle(fontSize: 12, color: Colors.grey[600]),
//                     ),
//                   ],
//                 ),
//               ),
//               _buildLikeButton(),
//             //   SizedBox(height: 4),
//             // Icon(Icons.chevron_right, color: Colors.grey),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildCoolImage(String imagePath) {
//     return Container(
//       width: 60,
//       height: 60,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.3),
//             spreadRadius: 1,
//             blurRadius: 4,
//             offset: Offset(0, 2),
//           ),
//         ],
//       ),
//       child: ClipOval(
//         child: Image.asset(
//           imagePath,
//           width: 40,
//           height: 40,
//           fit: BoxFit.cover,
//         ),
//       ),
//     );
//   }
//
//   Widget _buildLikeButton() {
//     return LikeButton(
//       size: 30,
//       circleColor: CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
//       bubblesColor: BubblesColor(
//         dotPrimaryColor: Color(0xff33b5e5),
//         dotSecondaryColor: Color(0xff0099cc),
//       ),
//       likeBuilder: (bool isLiked) {
//         return Icon(
//           Icons.favorite,
//           // color: isLiked ? Colors.red[400] : Colors.grey[400],
//           color: isLiked ? Colors.teal : Colors.grey[400],
//           size: 30,
//         );
//       },
//     );
//   }
// }


class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<FavouriteProvider>(context);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('My Favorites', style: TextStyle(color: Colors.black87)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black87),
            onPressed: () {},
          ),
        ],
      ),
      body: AnimationLimiter(
        child: ListView.builder(
          // itemCount: data.favouriteModels.length,
          itemCount: data.favourite.length,
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 375),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: _buildFavoriteItem(data.favourite[index]),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Implement add new favorite functionality
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }

  Widget _buildFavoriteItem(FavouriteModels favorite) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          // TODO: Navigate to business details page
        },
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Row(
            children: [
              _buildCoolImage(favorite.businessProfileImageUrl),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      favorite.businessName,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(height: 4),
                    Text(favorite.subCategory, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        RatingBarIndicator(
                          rating: 5,
                          itemBuilder: (context, index) => Icon(Icons.star, color: Colors.amber),
                          itemCount: 5,
                          itemSize: 14.0,
                        ),
                        SizedBox(width: 4),
                        Text(
                          "5",
                          // favorite.rating.toString(),
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(
                      "2.4KM",
                      // favorite.distance.toString(),
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              _buildLikeButton(),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildLikeButton() {
    return LikeButton(
      size: 30,
      circleColor: CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
      bubblesColor: BubblesColor(
        dotPrimaryColor: Color(0xff33b5e5),
        dotSecondaryColor: Color(0xff0099cc),
      ),
      likeBuilder: (bool isLiked) {
        return Icon(
          Icons.favorite,
          // color: isLiked ? Colors.red[400] : Colors.grey[400],
          color: isLiked ? Colors.teal : Colors.grey[400],
          size: 30,
        );
      },
    );
  }

  Widget _buildCoolImage(String imagePath) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ClipOval(
        child: Image.asset(
          imagePath,
          width: 40,
          height: 40,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
