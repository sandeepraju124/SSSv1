


// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sssv1/HousingServices/house_search.dart';
import 'package:sssv1/NewdefaultprofilePage/defaultpage&tabview.dart';
import 'package:sssv1/explore_test.dart';
import 'package:sssv1/nearby_comments.dart';
import 'package:sssv1/providers/BusinessCategoriesProviderNew.dart';
import 'package:sssv1/providers/home_restaurent_provider.dart';
import 'package:sssv1/providers/nearby_comments_provider.dart';
import 'package:sssv1/test.dart';
import 'package:sssv1/utils/constants.dart';
import 'package:sssv1/utils/navigator.dart';
import 'package:sssv1/widgets/Categories.dart';
import 'package:sssv1/widgets/search_bar.dart';
import 'bottomnavpages/bottomnav.dart';
import 'explore_new.dart';
import 'favorite_test.dart';
import 'nearby_comments.dart';
// import 'package:carousel_slider/carousel_controller.dart';
// import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePageNew extends StatefulWidget {
  @override
  State<HomePageNew> createState() => _HomePageNewState();
}

class _HomePageNewState extends State<HomePageNew> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<BusinessCategoriesProviderNew>(context, listen: false).fetchCategoriesData();
      Provider.of<HomeRestaurantListProvider>(context, listen: false).fetchFeatured(34.05224, -118.24322, 5000);
      // Provider.of<NearbyCommentProvider>(context, listen: false).fetchComments(double latitude, double longitude, int "distance");
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'https://t4.ftcdn.net/jpg/02/43/17/67/360_F_243176712_zvbzGxx2h9xFymXoB9j3mpL7ZFgQU8lK.jpg',
      'https://via.placeholder.com/800x400',
      'https://media.istockphoto.com/id/1049775258/photo/smiling-handsome-electrician-repairing-electrical-box-with-pliers-in-corridor-and-looking-at.jpg?s=612x612&w=0&k=20&c=stdWozouV2XsrHk2xXD3C31nT90BG7ydZvcpAn1Fx7I=',
    ];

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              floating: true,
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Text(
                    'Discover',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                background: CarouselSlider(
                  options: CarouselOptions(
                    height: 200.0,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 1.0,
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
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SearchBar3(),
                    SizedBox(height: 20),
                    Text(
                      'Categories',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 10),
                    CategoryScreen(),
                    SizedBox(height: 20),
                    Text(
                      'Featured',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 10),
                    FeaturedList(),
                    SizedBox(height: 20),
                    Text(
                      'Popular Near You',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 10),
                    PopularList(),
                    SizedBox(height: 20),
                    Text(
                      'Explore All',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      height: 400, // Adjust this height as needed
                      // child: Explore(),
                      child: ExploreNew()
                      // child: ,
                    ),

                    SizedBox(height: 100),
                    Text(
                      'Recent Reviews',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 10),
                    RecentReviews(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.favorite, color: Colors.white, size: 18,),
        label: Text('Favorites', style: TextStyle(color: Colors.white,)),
        backgroundColor: Colors.teal,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FavoritesPage()),
          );
        },
      ),

      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () {
      //     navigatorPush(context, AllReviewsScreen());
      //   },
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}

class FeaturedList extends StatefulWidget {
  @override
  _FeaturedListState createState() => _FeaturedListState();
}

class _FeaturedListState extends State<FeaturedList> {
  @override
  void initState() {
    super.initState();
    var data = Provider.of<HomeRestaurantListProvider>(context, listen: false);
    if (data.FeaturedList.isEmpty) {
      // data.fetchFeatured(key: "sub_category", value: "Restaurant");
      data.fetchFeatured(34.05224, -118.24322, 5000);
    }
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<HomeRestaurantListProvider>(context);
    return data.isLoading
        ? FeaturedListShimmerEffect()
    // Center(
    //         child: CircularProgressIndicator(color: tgPrimaryColor),
    //       )
        : SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: data.FeaturedList.length,
              itemBuilder: (context, index) {
                final business = data.FeaturedList[index];
                // final overallRating = data.businessRating[business.businessUid]?['rating'] ?? 0.0;

                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DefaultProfilePage(
                        uid: business.businessUid,
                      ),
                    ));
                  },
                  child: Container(
                    width: 150,
                    margin: EdgeInsets.only(right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: (business.profileImageUrl != null && business.profileImageUrl.isNotEmpty)
                              ? Image.network(
                                  business.profileImageUrl,
                                  height: 100,
                                  width: 150,
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  'https://www.strasys.uk/wp-content/uploads/2022/02/Depositphotos_484354208_S.jpg',
                                  height: 100,
                                  width: 150,
                                  fit: BoxFit.cover,
                                ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          business.businessName,
                          style: TextStyle(fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "Category • ${business.category}",
                          // business.businessDescription,
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          children: [
                            Icon(Icons.star_rounded, size: 16, color: Colors.amber[700]),
                            Padding(
                              padding: const EdgeInsets.only(left: 4.0, top: 2),
                              // child: Text('${overallRating.toStringAsFixed(1)} (${data.businessRating[business.businessUid]?['reviewsCount'] ?? 0})'),
                              // child: Text('10'),
                              // child: Text(data.FeaturedList[index].avgRating),
                              child: Text("${double.parse(data.FeaturedList[index].avgRating).toStringAsFixed(1)} . (${data.FeaturedList[index].totalReviews})"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
  }
}

class FeaturedListShimmerEffect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5, // Show 5 shimmer items while loading
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: 150,
              margin: EdgeInsets.only(right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      height: 100,
                      width: 150,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    width: 100,
                    height: 16,
                    color: Colors.white,
                  ),
                  SizedBox(height: 4),
                  Container(
                    width: 130,
                    height: 12,
                    color: Colors.white,
                  ),
                  SizedBox(height: 4),
                  Container(
                    width: 80,
                    height: 12,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Explore extends StatelessWidget {
  Explore({Key? key}) : super(key: key);
  final String keyy = "category";

  final List<Map<String, dynamic>> categories = [
    {
      "name": "Food & Restaurants",
      "image": "images/foodexplore.jpg",
      "onTap": (BuildContext context) => navigatorPush(
          context, ModernCategoryView(keyy: "category", value: "Food"))
    },
    {
      "name": "Arts & Entertainment",
      "image": "images/category/Entertainment.jpg",
      "onTap": (BuildContext context) =>
          navigatorPush(context, ModernCategoryView(keyy: "category", value: "Retail"))
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
      "name": "Automotive",
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
    // {"name": "Professional Services", "image": "images/category/Professional_Services.jpg", "onTap": null},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return InkWell(
            onTap: category["onTap"] != null ? () => category["onTap"](context) : null,
            child: Container(
              
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: AssetImage(category["image"]),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  // Dark gradient overlay
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.7),
                          Colors.transparent,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                  // Text widget
                  Center(
                    child: Text(
                      category["name"],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 13.8,
                        shadows: [
                          Shadow(
                            blurRadius: 10.0,
                            color: Colors.black,
                            offset: Offset(5.0, 5.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        staggeredTileBuilder: (int index) {
          // Adjust the size of each tile to match the pattern in the image
          if (index == 0) {
            return StaggeredTile.count(2, 2);
          } else if (index == 1) {
            return StaggeredTile.count(2, 1);
          } else if (index == 2) {
            return StaggeredTile.count(1, 2);
          } else if (index == 3) {
            return StaggeredTile.count(2, 1);
          } else {
            return StaggeredTile.count(1, 1);
          }
        },
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
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

              
              ],
            ),
          ),
        );
      },
    );
  }
}
