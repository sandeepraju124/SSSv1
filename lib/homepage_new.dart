import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/providers/BusinessCategoriesProviderNew.dart';
import 'package:sssv1/providers/nearby_comments_provider.dart';
import 'package:sssv1/widgets/Categories.dart';
import 'package:sssv1/utils/navigator.dart';
import 'package:sssv1/widgets/search_bar.dart';
import 'bottomnavpages/bottomnav.dart';
import 'nearby_comments.dart';
// import 'package:carousel_slider/carousel_controller.dart';
// import 'package:carousel_slider/carousel_slider.dart';


class HomePageNew extends StatefulWidget {
  @override
  State<HomePageNew> createState() => _HomePageNewState();

}

class _HomePageNewState extends State<HomePageNew> {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<BusinessCategoriesProviderNew>(context, listen: false).fetchCategoriesData();
    });
  }
  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'https://t4.ftcdn.net/jpg/02/43/17/67/360_F_243176712_zvbzGxx2h9xFymXoB9j3mpL7ZFgQU8lK.jpg',
      'https://via.placeholder.com/800x400',
      'https://media.istockphoto.com/id/1049775258/photo/smiling-handsome-electrician-repairing-electrical-box-with-pliers-in-corridor-and-looking-at.jpg?s=612x612&w=0&k=20&c=stdWozouV2XsrHk2xXD3C31nT90BG7ydZvcpAn1Fx7I=',
      // 'https://images.pexels.com/photos/262978/pexels-photo-262978.jpeg',
    ];

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  'Discover',
                  style: TextStyle(color: Colors.white),
                ),
                background:
                CarouselSlider(
                  options: CarouselOptions(
                    height: 200.0,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 1.0,
                    onPageChanged: (index, reason) {
                      // Handle page change if needed
                    },
                  ),
                  items: imgList.map((item) => Container(
                    child: Image.network(
                      item,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  )).toList(),
                ),
              ),
              //   Image.network(
              //     'https://t4.ftcdn.net/jpg/02/43/17/67/360_F_243176712_zvbzGxx2h9xFymXoB9j3mpL7ZFgQU8lK.jpg',
              //     fit: BoxFit.cover,
              //   ),
              // ),
              actions: [
                IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
                IconButton(icon: Icon(Icons.person), onPressed: () {}),
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SearchBar(),
                    // SearchBar2(),
                    SearchBar3(),
                    SizedBox(height: 20),
                    Text(
                      'Categories',
                      // style: Theme.of(context).textTheme.headline6
                    ),
                    SizedBox(height: 10),
                    // CategoryList(),
                    // SizedBox(height: 20),
                    // CategoryList2(),
                    CategoryScreen(),
                    SizedBox(height: 20),
                    Text(
                      'Featured',
                      // style: Theme.of(context).textTheme.headline6
                    ),
                    SizedBox(height: 10),
                    FeaturedList(),
                    SizedBox(height: 20),
                    Text(
                      'Popular Near You',
                      // style: Theme.of(context).textTheme.headline6
                    ),
                    SizedBox(height: 10),
                    PopularList(),
                    SizedBox(height: 20),
                    Text(
                      'Recent Reviews',
                      // style: Theme.of(context).textTheme.headline6
                    ),
                    SizedBox(height: 10),
                    RecentReviews(),

                    Text('Explore All',
                        // style: Theme.of(context).textTheme.headline6
                    ),
                    SizedBox(height: 10),
                    CategoryListExplore(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          navigatorPush(context, AllReviewsScreen());
        },
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search for restaurants, bars...',
        prefixIcon: Icon(Icons.search),
        suffixIcon: Icon(Icons.mic),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}

class SearchBar2 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BottomNavPage(initialIndex: 1)),
        );

      },
      child: AbsorbPointer( // Prevents the TextField from being editable
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search for restaurants, bars...',
            prefixIcon: Icon(Icons.search),
            suffixIcon: Icon(Icons.mic),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildImageWithText(
    String imageUrl, String mainText, String buttonText) {
  return Stack(
    children: [
      Image.network(
        imageUrl,
        height: 300,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
      Positioned(
        left: 20,
        bottom: 40,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              mainText,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.search, color: Colors.white),
              label: Text(buttonText),
              style: ElevatedButton.styleFrom(
                // primary: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

// class CategoryList extends StatelessWidget {
//   final List<Map<String, dynamic>> categories = [
//     {'icon': Icons.restaurant, 'name': 'Restaurants'},
//     {'icon': Icons.local_bar, 'name': 'Bars'},
//     {'icon': Icons.coffee, 'name': 'Cafes'},
//     {'icon': Icons.shopping_cart, 'name': 'Shopping'},
//     {'icon': Icons.hotel, 'name': 'Hotels'},
//     {'icon': Icons.more_horiz, 'name': 'More'},
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 100,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: categories.length,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.only(right: 16.0),
//             child: Column(
//               children: [
//                 CircleAvatar(
//                   radius: 30,
//                   backgroundColor: Colors.teal.shade100,
//                   child: Icon(categories[index]['icon'],
//                       size: 30, color: Colors.teal),
//                 ),
//                 SizedBox(height: 8),
//                 Text(categories[index]['name']),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class CategoryList2 extends StatelessWidget {
//   const CategoryList2({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<BusinessCategoriesProviderNew>(
//       builder: (context, data, child) {
//         if (data.isLoading) {
//           return Center(child: CircularProgressIndicator());
//         } else if (data.priority1Categories.isEmpty) {
//           return Center(child: Text('No priority 1 categories found.'));
//         } else {
//           return SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Text('Top Categories',
//                     // style: Theme.of(context).textTheme.headline6
//                   ),
//                 ),
//                 CategoryList(),
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Text('All Categories',
//                     // style: Theme.of(context).textTheme.headline6
//                   ),
//                 ),
//                 GridView.builder(
//                   shrinkWrap: true,
//                   physics: NeverScrollableScrollPhysics(),
//                   padding: EdgeInsets.all(16),
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 3,
//                     childAspectRatio: 1,
//                     crossAxisSpacing: 16,
//                     mainAxisSpacing: 16,
//                   ),
//                   itemCount: data.priority1Categories.length + 1,
//                   itemBuilder: (context, index) {
//                     if (index == data.priority1Categories.length) {
//                       return buildViewAllIcon(context);
//                     } else {
//                       final category = data.priority1Categories.keys.elementAt(index);
//                       final subcategory = data.priority1Categories[category]![0]['subcategory'];
//                       return buildCategoryIcon(subcategory);
//                     }
//                   },
//                 ),
//               ],
//             ),
//           );
//         }
//       },
//     );
//   }
//   Widget buildCategoryIcon(String subcategory) {
//     IconData icon = getCategoryIcon(subcategory);
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         CircleAvatar(
//           radius: 30,
//           backgroundColor: Colors.teal.shade100,
//           child: Icon(icon, size: 30, color: Colors.teal),
//         ),
//         SizedBox(height: 8),
//         Text(subcategory, textAlign: TextAlign.center, maxLines: 2, overflow: TextOverflow.ellipsis),
//       ],
//     );
//   }
//
//   Widget buildViewAllIcon(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         // Navigator.push(context, MaterialPageRoute(builder: (context) => AllCategoriesScreen()));
//         navigatorPush(context, AllSubcategoriesPageNew());
//       },
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           CircleAvatar(
//             radius: 30,
//             backgroundColor: Colors.teal.shade100,
//             child: Icon(Icons.view_list, size: 30, color: Colors.teal),
//           ),
//           SizedBox(height: 8),
//           Text('View All', textAlign: TextAlign.center),
//         ],
//       ),
//     );
//   }
//
//   IconData getCategoryIcon(String subcategory) {
//     switch (subcategory.toLowerCase()) {
//       case 'barbers':
//         return Icons.content_cut;
//       case 'restaurant':
//         return Icons.restaurant;
//       case 'fast food':
//         return Icons.fastfood;
//       case 'electricians':
//         return Icons.electrical_services;
//       case 'bars':
//         return Icons.local_bar;
//       case 'bookstore':
//         return Icons.book;
//       case 'clothing':
//         return Icons.shopping_bag;
//       case 'malls':
//         return Icons.store_mall_directory;
//       default:
//         return Icons.category;
//     }
//   }
// }



class FeaturedList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            width: 150,
            margin: EdgeInsets.only(right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    // 'https://via.placeholder.com/150x100',
                    'https://media.istockphoto.com/id/1081422898/photo/pan-fried-duck.jpg?s=612x612&w=0&k=20&c=kzlrX7KJivvufQx9mLd-gMiMHR6lC2cgX009k9XO6VA=',
                    height: 100,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 8),
                Text('Featured Place ${index + 1}',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Category • \$\$'),
                Row(
                  children: [
                    Icon(Icons.star, size: 16, color: Colors.amber),
                    Text('4.${5 - index} (${100 + index * 10})'),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Widget SlidingCoverImages() {
//   // var data = Provider.of<ServicesProvider>(context);
//   // var images = data.BusinessData?.images;
//   List images =[
//     'https://t3.ftcdn.net/jpg/03/24/73/92/360_F_324739203_keeq8udvv0P2h1MLYJ0GLSlTBagoXS48.jpg',
//     'https://images.rawpixel.com/image_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTA1L2stcGYtcG9tLTEyNDIuanBn.jpg'
//   ];
//
//   if (images == null || images.isEmpty) {
//     return Center(
//       // child: Text('No images available'),
//       child: Image.network(
//         height: 100,
//         "https://upload.wikimedia.org/wikipedia/commons/b/b9/No_Cover.jpg",fit: BoxFit.cover,),
//     );
//   }
//   return CarouselSlider.builder(
//
//     // itemCount: data.BusinessData!.images!.length,
//     itemCount: 2,
//     itemBuilder: (BuildContext context, int index, int realIndex) {
//       return Image.network(
//         // data.BusinessData!.images![index],
//         images[index],
//         fit: BoxFit.cover,
//         width: double.infinity,
//       );
//     },
//     options: CarouselOptions(
//       padEnds: false,
//       enlargeFactor: 0.2,
//       // reverse: true,
//       // pageSnapping: false,
//
//
//       // animateToClosest: false,
//       // disableCenter: true,
//       // autoPlayCurve: Curves.bounceIn,
//       // disableCenter: true,
//       // animateToClosest: false,
//       // pauseAutoPlayOnTouch: false,
//       // pauseAutoPlayOnManualNavigate: ,
//       enableInfiniteScroll: false,
//       height: 150,
//       autoPlay: true,
//       aspectRatio: 2.0,
//       enlargeCenterPage: true,
//     ),
//   );
// }


class SlidingCoverImages extends StatefulWidget {
  @override
  _SlidingCoverImagesState createState() => _SlidingCoverImagesState();
}

class _SlidingCoverImagesState extends State<SlidingCoverImages> {
  bool _autoPlay = true; // Control the autoplay

  List<String> images = [
    'https://t3.ftcdn.net/jpg/03/24/73/92/360_F_324739203_keeq8udvv0P2h1MLYJ0GLSlTBagoXS48.jpg',
    'https://images.rawpixel.com/image_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTA1L2stcGYtcG9tLTEyNDIuanBn.jpg',
  ];

  void stopAutoScroll() {
    print("tapped");
    setState(() {
      _autoPlay = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (images == null|| images.isEmpty) {
      return Center(
        child: Image.network(
          height: 100,
          "https://upload.wikimedia.org/wikipedia/commons/b/b9/No_Cover.jpg",
          fit: BoxFit.cover,
        ),
      );
    }

    return GestureDetector(

      onTap: stopAutoScroll, // Stop auto-scroll when tapping on the slider

      child: CarouselSlider.builder(
        itemCount: images.length,
        itemBuilder: (BuildContext context, int index, int realIndex) {
          return Image.network(
            images[index],
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width, // Full screen width
          );
        },
        options: CarouselOptions(
          viewportFraction: 1,
          padEnds: false,
          enlargeFactor: 0.2,
          enableInfiniteScroll: false,
          height: 150,
          autoPlay: _autoPlay, // Control autoPlay with the variable
          aspectRatio: 2.0,
          enlargeCenterPage: true,
        ),
      ),
    );
  }
}


class CategoryListExplore extends StatelessWidget {
  // String imagee = 'https://images.unsplash.com/photo-1590846406792-0adc7f938f1d?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
  final List<Map<String, dynamic>> categories = [
    {'icon': Icons.restaurant, 'name': 'Food & Restaurants', 'image': 'https://images.unsplash.com/photo-1590846406792-0adc7f938f1d?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'},
    {'icon': Icons.theater_comedy, 'name': 'Arts & Entertainment', 'image': 'https://images.unsplash.com/photo-1590846406792-0adc7f938f1d?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'},
    {'icon': Icons.house, 'name': 'Real Estate & Housing', 'image': 'https://images.unsplash.com/photo-1590846406792-0adc7f938f1d?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'},
    {'icon': Icons.spa, 'name': 'Beauty & Spas', 'image': 'https://images.unsplash.com/photo-1590846406792-0adc7f938f1d?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'},
    {'icon': Icons.car_repair, 'name': 'Automotive', 'image': 'https://images.unsplash.com/photo-1590846406792-0adc7f938f1d?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'},
    {'icon': Icons.nightlife, 'name': 'Night Life', 'image': 'https://images.unsplash.com/photo-1590846406792-0adc7f938f1d?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'},
    {'icon': Icons.shopping_bag, 'name': 'Shopping', 'image': 'https://images.unsplash.com/photo-1590846406792-0adc7f938f1d?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'},
    {'icon': Icons.local_hospital, 'name': 'Health & Medical', 'image': 'https://images.unsplash.com/photo-1590846406792-0adc7f938f1d?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'},
    {'icon': Icons.hotel, 'name': 'Hotels & Travel', 'image': 'https://images.unsplash.com/photo-1590846406792-0adc7f938f1d?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'},
    {'icon': Icons.school, 'name': 'Education', 'image': 'https://images.unsplash.com/photo-1590846406792-0adc7f938f1d?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'},
    {'icon': Icons.pets, 'name': 'Pets', 'image': 'https://images.unsplash.com/photo-1590846406792-0adc7f938f1d?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'},
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Stack(
            fit: StackFit.expand,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  categories[index]['image'],
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      categories[index]['name'],
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class PopularList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Card(
          elevation: 2,
          margin: EdgeInsets.only(bottom: 16),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                'https://via.placeholder.com/50',
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            title: Text('Popular Place ${index + 1}'),
            subtitle: Row(
              children: [
                Icon(Icons.star, size: 16, color: Colors.amber),
                Text('4.${5 - index} • '),
                Text('Category • '),
                Text('\$\$'),
              ],
            ),
            trailing: Icon(Icons.favorite_border),
          ),
        );
      },
    );
  }
}

class RecentReviews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<NearbyCommentProvider>(context);
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: data.comments.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 2,
          margin: EdgeInsets.only(bottom: 16),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: data.comments[index].profileImageUrl == null?
                          NetworkImage('https://via.placeholder.com/30'):
                          NetworkImage(data.comments[index].profileImageUrl),
                    ),
                    SizedBox(width: 8),
                    // Text('User ${index + 1}'),
                    Text(data.comments[index].userName),
                    Spacer(),
                    Text('2d ago'),
                  ],
                ),
                SizedBox(height: 8),

                Text(
                    data.comments[index].comment,
                //     'Great place! The food was amazing and the service was excellent.'
                ),
                SizedBox(height: 8),
                // Row(
                //   children: [
                //     Icon(Icons.star, size: 16, color: Colors.amber),
                //     Icon(Icons.star, size: 16, color: Colors.amber),
                //     Icon(Icons.star, size: 16, color: Colors.amber),
                //     Icon(Icons.star, size: 16, color: Colors.amber),
                //     Icon(Icons.star_half, size: 16, color: Colors.amber),
                //     SizedBox(width: 8),
                //     Text('Restaurant Name'),
                //   ],
                // ),
                Row(
                  children: [
                    RatingBarIndicator(
                      rating: double.parse(data.comments[index].rating.toString()),
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 11,
                      direction: Axis.horizontal,
                    ),
                    SizedBox(width: 8),
                    Text('Restaurant Name'),
                  ],
                ),

                // RatingBarIndicator(
                //   rating: double.parse(data.comments[index].rating.toString()),
                //   itemBuilder: (context, index) => Icon(
                //     Icons.star,
                //     color: Colors.amber,
                //   ),
                //   itemCount: 5,
                //   itemSize: 11,
                //   direction: Axis.horizontal,
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}
