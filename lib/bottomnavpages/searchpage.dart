// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lottie/lottie.dart';
import 'package:sssv1/NewdefaultprofilePage/defaultpage&tabview.dart';
import 'package:sssv1/network_calling/http.dart';

import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:sssv1/providers/live_user_location.dart';
import 'package:sssv1/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';

import 'package:provider/provider.dart';

class SearchBarPage extends StatefulWidget {
  const SearchBarPage({Key? key}) : super(key: key);

  @override
  State<SearchBarPage> createState() => _SearchBarPageState();
}

class _SearchBarPageState extends State<SearchBarPage>
    with SingleTickerProviderStateMixin {
  List<dynamic> data = [];
  bool isLoading = false;
  Timer? _debounce;
  bool isSearchExpanded = false;
  final TextEditingController _searchController = TextEditingController();
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  Future<void> _getSuggestions(String query) async {
    setState(() {
      isLoading = true;
      data = [];
    });
    final response = await http
        .get(Uri.parse('$baseUrl/pg/fulltext_search?query=$query&count=10'));
    if (response.statusCode == 200) {
      setState(() {
        data = json.decode(response.body);
        isLoading = false;
      });
      if (data.isEmpty) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('No Results'),
            content: Text('No matching results found for your search.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK', style: TextStyle(color: tgDarkPrimaryColor)),
              ),
            ],
          ),
        );
      }
    } else {
      setState(() {
        isLoading = false;
      });
      throw Exception('Failed to load suggestions');
    }
  }

  void _onSearchTextChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(Duration(milliseconds: 500), () {
      if (query.isNotEmpty) {
        _getSuggestions(query);
      } else {
        setState(() {
          data.clear();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 75.0,
        elevation: 2,
        // backgroundColor: Colors.white,
        backgroundColor: tgDarkPrimaryColor,
        title: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return isSearchExpanded
                ? SizeTransition(
                    sizeFactor: _animation,
                    axis: Axis.horizontal,
                    child: SizedBox(
                      height: 49,
                      width: 350,
                      child: TextField(
                        controller: _searchController,
                        onChanged: _onSearchTextChanged,
                        decoration: InputDecoration(
                          fillColor: Colors.grey[200],
                          filled: true,
                          hintText: 'Search...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: Icon(Icons.search, color: Colors.grey),
                        ),
                      ),
                    ),
                  )
                : Text(
                    'Search',
                    style: TextStyle(
                      // color: tgDarkPrimaryColor,
                      color: Colors.black,
                      // fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(isSearchExpanded ? Icons.close : Icons.search,
                color: Colors.black54
                // color: tgDarkPrimaryColor
                ),
            onPressed: () {
              setState(() {
                isSearchExpanded = !isSearchExpanded;
                if (isSearchExpanded) {
                  _controller.forward();
                } else {
                  _controller.reverse();
                  _searchController.clear();
                  data.clear();
                }
              });
            },
          ),
        ],
      ),
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        child: isLoading
            ? ShimmerLoadingList()
            : data.isEmpty
                ? EmptySearchState()
                : ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return BusinessListItem(
                        businessData: data[index],
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DefaultProfilePage(
                                uid: data[index]['business_uid'],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
      ),
    );
  }
}

class BusinessListItem extends StatelessWidget {
  final Map<String, dynamic> businessData;
  final VoidCallback onTap;

  const BusinessListItem({
    Key? key,
    required this.businessData,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.network(
                  businessData["profile_image_url"] ??
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a8/Noto_Emoji_v2.034_1f3e0.svg/800px-Noto_Emoji_v2.034_1f3e0.svg.png",
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      businessData['business_name'],
                      style: TextStyle(
                          fontSize: 17.6,
                          fontWeight: FontWeight.w700,
                          // color: tgDarkPrimaryColor,
                          color: Colors.black87),
                    ),
                    SizedBox(height: 8),
                    Text(
                      businessData['business_description'],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12.7,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        RatingBarIndicator(
                          rating: businessData['average_rating'].toDouble(),
                          itemBuilder: (context, index) => Icon(
                            Icons.star,
                            color: Colors.amber.shade700,
                          ),
                          itemCount: 5,
                          itemSize: 18.0,
                          direction: Axis.horizontal,
                        ),
                        SizedBox(width: 8),
                        Text(
                          businessData["average_rating"].toStringAsFixed(1),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 16, color: Colors.grey),
                        SizedBox(width: 4),
                        Text(
                          businessData["country"],
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.directions, size: 16, color: Colors.grey),
                        SizedBox(width: 4),
                        Text(
                          "Calculate distance...",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShimmerLoadingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  color: Colors.white,
                ),
                SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  height: 24,
                  color: Colors.white,
                ),
                SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  height: 16,
                  color: Colors.white,
                ),
                SizedBox(height: 8),
                Container(
                  width: 100,
                  height: 16,
                  color: Colors.white,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class EmptySearchState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon(
          //   Icons.search_off,
          //   size: 80,
          //   color: Colors.grey[400],
          // ),
          // SizedBox(height: 16),
          // Text(
          //   'No results found',
          //   // 'Pizza....',
          //   style: TextStyle(
          //     fontSize: 18,
          //     fontWeight: FontWeight.bold,
          //     color: Colors.grey[700],
          //   ),
          // ),
          // SizedBox(height: 8),
          // Text(
          //   'Try a different search term',
          //   style: TextStyle(
          //     fontSize: 14,
          //     color: Colors.grey[600],
          //   ),
          // ),
          // if (!isLoading && data.isEmpty)
          Align(
            alignment: Alignment.center,
            child: Lottie.asset("images/Search.json", height: 127),
          ),
        ],
      ),
    );
  }
}
