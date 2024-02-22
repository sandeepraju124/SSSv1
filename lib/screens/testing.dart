// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sssv1/utils/constants.dart';

class BusinessSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Business Search'),
      ),
      body: BusinessSearchForm(),
    );
  }
}

class BusinessSearchForm extends StatefulWidget {
  @override
  _BusinessSearchFormState createState() => _BusinessSearchFormState();
}

class _BusinessSearchFormState extends State<BusinessSearchForm> {
  List<dynamic> data = [];
  bool isLoading = false;
  bool _isSearching = false;
  Timer? _debounce;
  TextEditingController _searchController = TextEditingController();

  Future<void> _getSuggestions(String query) async {
    setState(() {
      isLoading = true;
      data = []; // Set isLoading to true when starting to load data
    });
    final response =
        // await http.get(Uri.parse('$baseUrl/pg/search?query=$query'));
        await http.get(Uri.parse('$baseUrl/pg/fulltext_search?query=$query&count=10'));
    print(response.body);
    if (response.statusCode == 200) {
      setState(() {
        data = json.decode(response.body);
        isLoading = false; // Set isLoading to false after loading data
      });
    } else {
      setState(() {
        isLoading =
            false; // Ensure isLoading is set to false even if there's an error
      });
      throw Exception('Failed to load suggestions');
    }
  }

  void _onSearchTextChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    setState(() {
      _searchController.text = query; // Update the text in the TextFormField
    });
    if (query.isEmpty) {
      // Clear the data when the search query is empty
      setState(() {
        data.clear();
      });
    } else {
      _debounce = Timer(Duration(milliseconds: 500), () {
        setState(() {
          _isSearching = true;
        });
        _getSuggestions(query).then((_) {
          setState(() {
            _isSearching = false;
          });
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFEFF0F7),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _searchController,
                onChanged: _onSearchTextChanged,

                // onChanged: (value) {
                //   if (value.length >= 2) {
                //     print(value);
                //     _getSuggestions(value);
                //     // print("data $data");
                //     // print("data");
                //   }
                //   print(value);
                // },
              )),
          Visibility(
            visible: isLoading,
            child: CircularProgressIndicator(),
          ),
          Visibility(
            visible: !isLoading && data.isNotEmpty,
            // data.length >0 ,
            child: Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                            print(data[index]['business_uid']);
                          },
                          child: ListTile(
                            leading: Container(
                              width: 50,
                          
                              decoration: BoxDecoration(
                                  // border: Border.all(
                                  //   color: Colors.blue,
                                  //   width: 2, // Adjust the border width as needed
                                  // ),
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(15)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  data[index]['profile_image_url'],
                                  // 'https://t4.ftcdn.net/jpg/01/01/71/05/360_F_101710585_mjWXkNav1nX4Ph33MqYd79FdVUWBbKyD.jpg',
                                  fit: BoxFit
                                      .cover, // Ensure the image covers the entire container
                                ),
                              ),
                              // Image.network(fit: BoxFit.cover,
                              //     "https://t4.ftcdn.net/jpg/01/01/71/05/360_F_101710585_mjWXkNav1nX4Ph33MqYd79FdVUWBbKyD.jpg")
                            ),
                            trailing: Text("25km"),
                            title: Text(data[index]['business_name']
                                // "Santosh Dhaba"
                                ),
                            subtitle: Text("Rate 3.9 with 10.3K rating"),
                          ),
                        ),
                        Divider(
                          indent: 80,
                          endIndent: 80,
                        )
                      ],
                    );
                    // Text(data[index]['business_name']);
                  }),
            ),
          ),
          // SearchList(),
          // Text("checking")
        ],
      ),
    );
  }
}

// class SearchList extends StatelessWidget {
//   const SearchList({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         ListTile(
//           leading: Container(
//             width: 60,
        
//             decoration: BoxDecoration(
//                 // border: Border.all(
//                 //   color: Colors.blue,
//                 //   width: 2, // Adjust the border width as needed
//                 // ),
//                 color: Colors.blue,
//                 borderRadius: BorderRadius.circular(15)),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(15),
//               child: Image.network(
//                 'https://t4.ftcdn.net/jpg/01/01/71/05/360_F_101710585_mjWXkNav1nX4Ph33MqYd79FdVUWBbKyD.jpg',
//                 fit: BoxFit
//                     .cover, // Ensure the image covers the entire container
//               ),
//             ),
//             // Image.network(fit: BoxFit.cover,
//             //     "https://t4.ftcdn.net/jpg/01/01/71/05/360_F_101710585_mjWXkNav1nX4Ph33MqYd79FdVUWBbKyD.jpg")
//           ),
//           trailing: Text("25km"),
//           title: Text("Santosh Dhaba"),
//           subtitle: Text("Rate 3.9 with 10.3K rating"),
//         ),
//         Divider(indent: 80,endIndent: 80,)
//       ],
//     );
//   }
// }
