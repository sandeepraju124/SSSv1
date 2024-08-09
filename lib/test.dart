// import 'package:flutter/material.dart';
//
//
// class TestTest extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Explore'),
//         actions: [
//           IconButton(icon: Icon(Icons.person), onPressed: () {}),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SearchBar(),
//               SizedBox(height: 20),
//               Text('Categories',
//                   // style: Theme.of(context).textTheme.headline6
//               ),
//               SizedBox(height: 10),
//               CategoryList(),
//               SizedBox(height: 20),
//               Text('Top Picks',
//                   // style: Theme.of(context).textTheme.headline6
//               ),
//               SizedBox(height: 10),
//               RestaurantList(),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
//           BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Saved'),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//         ],
//       ),
//     );
//   }
// }
//
// class SearchBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       decoration: InputDecoration(
//         hintText: 'Search for restaurants, bars...',
//         prefixIcon: Icon(Icons.search),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(30),
//         ),
//       ),
//     );
//   }
// }
//
// class CategoryList extends StatelessWidget {
//   final List<Map<String, dynamic>> categories = [
//     {'icon': Icons.restaurant, 'name': 'Restaurants'},
//     {'icon': Icons.local_bar, 'name': 'Bars'},
//     {'icon': Icons.coffee, 'name': 'Cafes'},
//     {'icon': Icons.shopping_cart, 'name': 'Shopping'},
//     // {'icon': Icons.more_horiz, 'name': 'More'},
//     {'icon': Icons.restaurant, 'name': 'Restaurants'},
//     {'icon': Icons.local_bar, 'name': 'Bars'},
//     {'icon': Icons.coffee, 'name': 'Cafes'},
//     {'icon': Icons.shopping_cart, 'name': 'Shopping'},
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
//                   child: Icon(categories[index]['icon'], size: 30),
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
//
// class RestaurantList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       shrinkWrap: true,
//       physics: NeverScrollableScrollPhysics(),
//       itemCount: 3,
//       itemBuilder: (context, index) {
//         return Card(
//           elevation: 2,
//           margin: EdgeInsets.only(bottom: 16),
//           child: ListTile(
//             leading: ClipRRect(
//               borderRadius: BorderRadius.circular(8),
//               child: Image.network(
//                 'https://via.placeholder.com/50',
//                 width: 50,
//                 height: 50,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             title: Text('Restaurant ${index + 1}'),
//             subtitle: Row(
//               children: [
//                 Icon(Icons.star, size: 16, color: Colors.amber),
//                 Text('4.${5 - index} • '),
//                 Text('Cuisine Type • '),
//                 Text('\$\$'),
//               ],
//             ),
//             trailing: Icon(Icons.favorite_border),
//           ),
//         );
//       },
//     );
//   }
// }


import 'package:flutter/material.dart';



class TestTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Discover'),
              background: Image.network(
                'https://via.placeholder.com/500x200',
                fit: BoxFit.cover,
              ),
            ),
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
                  SearchBar(),
                  SizedBox(height: 20),
                  Text('Categories',
                      // style: Theme.of(context).textTheme.headline6
                  ),
                  SizedBox(height: 10),
                  CategoryList(),
                  SizedBox(height: 20),
                  Text('Featured',
                      // style: Theme.of(context).textTheme.headline6
                  ),
                  SizedBox(height: 10),
                  FeaturedList(),
                  SizedBox(height: 20),
                  Text('Popular Near You',
                      // style: Theme.of(context).textTheme.headline6
                  ),
                  SizedBox(height: 10),
                  PopularList(),
                  SizedBox(height: 20),
                  Text('Recent Reviews',
                      // style: Theme.of(context).textTheme.headline6
                  ),
                  SizedBox(height: 10),
                  RecentReviews(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(icon: Icon(Icons.home), onPressed: () {}),
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
            SizedBox(width: 48),
            IconButton(icon: Icon(Icons.favorite), onPressed: () {}),
            IconButton(icon: Icon(Icons.person), onPressed: () {}),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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

class CategoryList extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {'icon': Icons.restaurant, 'name': 'Restaurants'},
    {'icon': Icons.local_bar, 'name': 'Bars'},
    {'icon': Icons.coffee, 'name': 'Cafes'},
    {'icon': Icons.shopping_cart, 'name': 'Shopping'},
    {'icon': Icons.hotel, 'name': 'Hotels'},
    {'icon': Icons.more_horiz, 'name': 'More'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.teal.shade100,
                  child: Icon(categories[index]['icon'], size: 30, color: Colors.teal),
                ),
                SizedBox(height: 8),
                Text(categories[index]['name']),
              ],
            ),
          );
        },
      ),
    );
  }
}

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
                Text('Featured Place ${index + 1}', style: TextStyle(fontWeight: FontWeight.bold)),
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
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 3,
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
                      backgroundImage: NetworkImage('https://via.placeholder.com/30'),
                    ),
                    SizedBox(width: 8),
                    Text('User ${index + 1}'),
                    Spacer(),
                    Text('2d ago'),
                  ],
                ),
                SizedBox(height: 8),
                Text('Great place! The food was amazing and the service was excellent.'),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.star, size: 16, color: Colors.amber),
                    Icon(Icons.star, size: 16, color: Colors.amber),
                    Icon(Icons.star, size: 16, color: Colors.amber),
                    Icon(Icons.star, size: 16, color: Colors.amber),
                    Icon(Icons.star_half, size: 16, color: Colors.amber),
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