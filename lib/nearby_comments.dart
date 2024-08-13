import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sssv1/providers/nearby_comments_provider.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'models/new_commets_models.dart';

// Define the Comment class


class AllReviewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            expandedHeight: 120,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Reviews'),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.teal, Colors.teal.shade700],
                  ),
                ),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search reviews',
                    prefixIcon: Icon(Icons.search),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(16),
            sliver: ReviewsList(),
          ),
        ],
      ),
    );
  }
}

class ReviewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<NearbyCommentProvider>(context);
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) => ReviewCard(review: data.comments[index]),
        childCount: data.comments.length,
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  final NearbyComments review;

  const ReviewCard({Key? key, required this.review}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: review.profileImageUrl != null
                      ? NetworkImage(review.profileImageUrl!)
                      : NetworkImage('https://via.placeholder.com/50'),
                  radius: 25,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        review.userName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text("ncnnv",
                        // timeago.format(review.timestamp),
                        // timeago.format(review.createdAt),
                        // timeago.format(DateFormat("dd/MM/yyyy HH:mm:ss").parse(review.createdAt)),
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                RatingBarIndicator(
                  rating: review.rating.toDouble(),
                  itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
                  itemCount: 5,
                  itemSize: 18,
                  direction: Axis.horizontal,
                ),
              ],
            ),
            SizedBox(height: 12),
            Text(
              review.comment,
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 12),
            Text(
              'Restaurant Name', // You might want to add this to the Comment class
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.teal,
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  icon: Icon(Icons.thumb_up_outlined),
                  label: Text('Helpful'),
                  onPressed: () {},
                ),
                TextButton.icon(
                  icon: Icon(Icons.comment_outlined),
                  label: Text('Comment'),
                  onPressed: () {},
                ),
                TextButton.icon(
                  icon: Icon(Icons.share_outlined),
                  label: Text('Share'),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Assuming you have a NearbyCommentProvider, you might need to adjust it to use the Comment class
// class NearbyCommentProvider with ChangeNotifier {
//   List<Comment> _comments = [];
//
//   List<Comment> get comments => _comments;
//
//   // Add methods to fetch and update comments
//   // For example:
//   void fetchComments() {
//     // Fetch comments from API or local storage
//     // Update _comments
//     notifyListeners();
//   }
// }