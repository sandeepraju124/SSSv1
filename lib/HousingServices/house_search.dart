// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, unused_field, non_constant_identifier_names, constant_identifier_names, avoid_unnecessary_containers

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/HousingServices/house_list.dart';
import 'package:sssv1/HousingServices/testlocationtile.dart';
import 'package:sssv1/models/Housedata_model.dart';
import 'package:sssv1/models/autocomplete_prediction_model.dart';
import 'package:sssv1/providers/Housedata_Provider.dart';
import 'package:sssv1/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:sssv1/utils/navigator.dart';

class HouseSearch extends StatefulWidget {
  const HouseSearch({super.key});

  @override
  State<HouseSearch> createState() => _HouseSearchState();
}

class _HouseSearchState extends State<HouseSearch> {
  List<AutoCompletePrediction> placePredictions =
      []; // List to store autocomplete predictions
  var selectedPlace; // Selected place
  double? _latitude; // Latitude of the selected place
  double? _longitude; // Longitude of the selected place

  HosueType? _selectedType; // Selected house type
  final TextEditingController _searchController =
      TextEditingController(); // Controller for search input
  final FocusNode _searchFocusNode = FocusNode(); // Focus node for search input
  List<String> _suggestions = []; // List to store suggestions
  OverlayEntry? _overlayEntry = null; // Overlay entry for suggestions
  Timer? _debounce; // Timer for debouncing search input
  bool _suggestionSelected = false; // Flag to check if a suggestion is selected

  List<HousedataModel> _searchResults = []; // List to store search results
  Map<String, dynamic> _selectedCriteria2 =
      {}; // Map to store selected criteria

  bool _showAdvanceFilters = false; // Flag to show/hide advanced filters

  // Function to remove selected criteria
  void _removeCriteria(String key) {
    setState(() {
      _selectedCriteria2.remove(key);
      if (key == 'bedrooms') {
        selectedBHKTypes.updateAll((key, value) => false);
      }
      if (key == 'houseType') {
        _selectedType = null;
      }
      if (key == 'priceRange') {
        _selectedDropdownMax = "Price";
      }
      if (key == 'location') {
        _searchController.clear();
      }
    });
  }

  // Maps to store selected BHK and Room types
  Map<BHKType, bool> selectedBHKTypes = {
    BHKType.BHK1: false,
    BHKType.BHK2: false,
    BHKType.BHK3: false,
    BHKType.BHK4: false,
    BHKType.BHK5: false,
    BHKType.BHK6: false,
  };
  Map<RoomType, bool> selectedRoomTypes = {
    RoomType.SingleRoom: false,
    RoomType.DoubleSharing: false,
    RoomType.TripleSharing: false,
    RoomType.FourSharing: false,
  };

  String _selectedDropdownMax = "Price"; // Selected price range
  var _dropDowndownOptionsMax = [
    "Price",
    "10000",
    "20000",
    "30000",
    "40000",
    "50000"
  ];

  String _ShowAdvance =
      "Show Advance Filters"; // Text to show for showing advanced filters
  String _HideAdvance =
      "Hide Advance Filters"; // Text to show for hiding advanced filters

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    _overlayEntry?.remove();
    _debounce?.cancel();
    super.dispose();
  }

// Function to perform place search using Google Places API
  Future placeSearch({query}) async {
    Uri uri =
        Uri.https("maps.googleapis.com", 'maps/api/place/autocomplete/json', {
      "input": query,
      "components": "country:IN",
      "key": "AIzaSyBIp8U5x3b2GVj1cjNU3N6funOz_tEUAdk"
    });
    // print(uri);

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      // print(response);
      // print("response");
      final jsonResponse = json.decode(response.body)["predictions"] as List;

      List<AutoCompletePrediction> placePreds = [];
      for (var i = 0; i < jsonResponse.length; i++) {
        placePreds.add(AutoCompletePrediction.fromJson(jsonResponse[i]));
      }
      setState(() {
        placePredictions = placePreds;
      });
    }
    return null;
  }

  // Function to get place details using place ID from Google Places API

  Future<Map<String, dynamic>> getPlaceId(String placeId) async {
    final apiKey = 'AIzaSyBIp8U5x3b2GVj1cjNU3N6funOz_tEUAdk';
    final uri =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&fields=geometry&key=$apiKey';
    try {
      final response = await http.get(Uri.parse(uri));
      if (response.statusCode == 200) {
        final body = json.decode(response.body);
        final lat = body['result']['geometry']['location']['lat'];
        final lng = body['result']['geometry']['location']['lng'];
        _latitude = lat;
        _longitude = lng;
        // _selectedCriteria2['latitude'] = lat;
        // _selectedCriteria2['longitude'] = lng;

        // print('Latitude: $lat, Longitude: $lng');
        return {'latitude': lat, 'longitude': lng};
      } else {
        throw Exception(
            'Failed to get place details. Error ${response.statusCode}: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  void _removeLocation() {
    setState(() {
      // _selectedCriteria.location = null;
      _searchController.clear();
    });
  }

  // Function to fetch house data based on selected criteria

  Future<void> fetchHouseData(Map<String, dynamic> queryParams) async {
    // Base URL
    final String baseUrl =
        'https://supernova1137.azurewebsites.net/pg/house/house-search-latlong';

    // Default parameters
    final Map<String, String> defaultParams = {
      'latitude': _latitude.toString(),
      'longitude': _longitude.toString(),
      'distance': '5000'
    };

    // Combine default and provided parameters
    final Map<String, String> params = {}..addAll(defaultParams);

    queryParams.forEach((key, value) {
      // if (value != null) {
      //   params[key] = value.toString();
      // }
      // if(key == 'houseType'){
      //   params['house_type'] = 'apartment';
      // }
      if (key == 'houseType') {
        params['house_type'] = value.toString().toLowerCase();
      }
      if (key == 'bedrooms') {
        params['bedrooms'] = value.toString();
      }
      if (key == 'priceRange') {
        params['price'] = value.toString();
      }
      if (key == 'carParking') {
        params['car_parking'] = value.toString();
      }
      if (key == 'advance') {
        params['advance'] = value.toString();
      }
      if (key == 'buildingAge') {
        params['building_age'] = value.toString();
      }
    });

    // Construct the query string
    final String queryString = Uri(queryParameters: params).query;
    // print('Query String: $queryString');

    // Final URL
    final String url = '$baseUrl?$queryString';

    try {
      final response = await http.get(Uri.parse(url));
      // print(response.body);

      if (response.statusCode == 200) {
        // Parse the JSON response
        final data = jsonDecode(response.body);
        // print('House Data: $data');
      } else {
        print('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<HouseProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 6,
        backgroundColor: tgPrimaryColor,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(LineAwesomeIcons.angle_left)),
        title: Text(
          "Housing Search",
          style: TextStyle(color: tgPrimaryText, fontSize: 15),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 25, left: 10, right: 18),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // shrinkWrap: true,
              // padding: const EdgeInsets.only(top: 25, left: 10, right: 18),
              children: [
                SizedBox(
                  height: 66,
                  child: Column(
                    children: [
                      TextField(
                        onChanged: (value) {
                          placeSearch(query: value);
                          print(value);
                        },
                        style: TextStyle(
                            color: secondaryColor40LightTheme, fontSize: 14.5),
                        controller: _searchController,
                        focusNode: _searchFocusNode,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            filled: true,
                            fillColor: Colors.grey[200],
                            hintText: "Search Location",
                            hintStyle: TextStyle(
                              color: secondaryColor20LightTheme,
                              fontSize: 12,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            suffixIcon: Icon(Icons.location_pin)),
                        autofocus: false,
                        maxLines: null,
                        cursorColor: tgDarkPrimaryColor,
                        // onChanged: (value) {
                        //   _onSearchQueryChanged();
                        // },
                      ),
                      // if (placePredictions.isNotEmpty)
                      // Expanded(
                      //   child: SingleChildScrollView(
                      //     child: ListView.builder(
                      //       shrinkWrap: true,
                      //       itemCount: placePredictions.length,
                      //       itemBuilder: (context, index) {
                      //         return ListTile(
                      //           // title: Text(_suggestions[index]),
                      //           title: Text(placePredictions[index].toString() ,maxLines: 2,overflow: TextOverflow.ellipsis,),
                      //           onTap: () =>
                      //               _selectSuggestion(_suggestions[index]),
                      //         );
                      //       },
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 17,
                ),
                if (placePredictions.isNotEmpty)
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: placePredictions.length,
                        // itemCount: 1,
                        itemBuilder: (context, index) => LocationListTile(
                              press: () async {
                                // print(placePredictions[index].placeId);
                                // print(placePredictions[index].terms[0].value);
                                selectedPlace = placePredictions[index];
                                final latlag = await getPlaceId(
                                    placePredictions[index].placeId);
                                // print(latlag);
                                // print("latlag");

                                _selectedCriteria2['location'] =
                                    placePredictions[index].terms[0].value;
                                setState(() {
                                  placePredictions.clear();
                                  _searchController.clear();
                                });
                                // showConfirmationDialog(context,placePredictions[index].description,latitude: latlag['latitude'],longitude:latlag['longitude'] );
                                //  showConfirmationDialog(context,locationName,latitude: latitude,longitude: longitude);
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => PlaceDetailsScreen(
                                //         place: placePredictions[index]),
                                //   ),
                                // );
                              },
                              // location: "Banaras, Dhaka, Bangladesh"
                              location: placePredictions[index].description,
                              // location: placePredictions[index]!
                            )),
                  ),

                SizedBox(
                  height: 10,
                ),

                Visibility(
                  visible: _selectedCriteria2.isNotEmpty,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Selected Criteria:',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 8),
                        Wrap(
                          spacing: 8.0,
                          runSpacing: 4.0,
                          children: _selectedCriteria2.entries.map((entry) {
                            return InputChip(
                              side: BorderSide(
                                  color: tgLightPrimaryColor, width: 1.0),
                              // selected: true,
                              // showCheckmark: false,
                              color: MaterialStateProperty.resolveWith<Color?>(
                                (states) => tgLightPrimaryColor,
                              ),
                              // label: Text('${entry.key}: ${entry.value}'),
                              label: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: entry.key,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 13), // Make key bold
                                    ),
                                    TextSpan(
                                      text: ': ${entry.value}',
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontFamily: 'Roboto',
                                          fontSize: 13), // Keep value normal
                                    ),
                                  ],
                                ),
                              ),
                              deleteIcon: Icon(
                                Icons.close,
                                color: tgDarkPrimaryColor,
                                size: 18,
                              ),
                              onDeleted: () => _removeCriteria(entry.key),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
                // SizedBox(height: 8),

                Text("House Type", style: TextStyle(fontSize: 15)),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildHouseOption(HosueType.Apartment, "Appartment"),
                      _buildHouseOption(HosueType.PG, "PG/Hostel"),
                      _buildHouseOption(HosueType.PentHosue, "Pent Hosue")
                    ],
                  ),
                ),
                // Full House
                if (_selectedType == HosueType.Apartment)
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text("BHK Type", style: TextStyle(fontSize: 15)),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        color: Colors.grey[200],
                        // height: 50,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  _BhkTypeOption(BHKType.BHK1, "1 BHK"),
                                  _BhkTypeOption(BHKType.BHK2, "2 BHK"),
                                  _BhkTypeOption(BHKType.BHK3, "3 BHK")
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  _BhkTypeOption(BHKType.BHK4, "4 BHK"),
                                  _BhkTypeOption(BHKType.BHK5, "5 BHK"),
                                  _BhkTypeOption(BHKType.BHK6, "6 BHK")
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                // PG/Hostel
                if (_selectedType == HosueType.PG)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child:
                            Text("Room Type", style: TextStyle(fontSize: 15)),
                      ),
                      Container(
                        color: Colors.grey[200],
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  _RoomTypeOption(
                                      RoomType.SingleRoom, "Single Room"),
                                  _RoomTypeOption(
                                      RoomType.DoubleSharing, "Double Sharing"),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  _RoomTypeOption(
                                      RoomType.TripleSharing, " Triple Room "),
                                  _RoomTypeOption(
                                      RoomType.FourSharing, " Four Sharing "),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                // rest

                SizedBox(height: 7),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text("Select Price Range"),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    // Expanded(
                    //   child: _dropDown(
                    //     options: _dropDowndownOptionsMin,
                    //     onChanged: (String? newvalue) {
                    //       setState(() {
                    //         _selectedDropdownMin = newvalue!;
                    //       });
                    //     },
                    //     selectedValue: _selectedDropdownMin,
                    //   ),
                    // ),
                    // SizedBox(
                    //   width: 10,
                    // ),
                    Expanded(
                      child: _dropDown(
                        options: _dropDowndownOptionsMax,
                        onChanged: (String? newvalue) {
                          setState(() {
                            _selectedDropdownMax = newvalue!;
                            // _selectedCriteria.priceRange = newvalue == "Price"
                            _selectedCriteria2['priceRange'] = newvalue ==
                                    "Price"
                                ? null
                                : newvalue; // Update price range in selected criteria
                          });
                        },
                        selectedValue: _selectedDropdownMax,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),

                // if (data.isLoading) Center(child: CircularProgressIndicator()),
                // if (!data.isLoading && data.houses.isNotEmpty)
                //   ListView.builder(
                //     shrinkWrap: true,
                //     physics: NeverScrollableScrollPhysics(),
                //     itemCount: data.houses.length,
                //     itemBuilder: (context, index) {
                //       var house = data.houses[index];
                //       return ListTile(
                //         title: Text(house.businessName),
                //         subtitle: Text(house.location),
                //       );
                //     },
                //   ),
                // if (!data.isLoading && data.houses.isEmpty)
                //   Center(
                //       child: Text('No houses found for the selected criteria')),

                // GestureDetector(
                //     onTap: () {
                //       setState(() {
                //         _showAdvanceFilters = !_showAdvanceFilters;
                //       });
                //       // print(_showAdvanceFilters);
                //     },
                //     child: _showAdvanceFilters
                //         ? RetangularBorderBox(_HideAdvance)
                //         : RetangularBorderBox(_ShowAdvance)),
                // if (_showAdvanceFilters) Text("advance")
              ]),
        ),
      ),
      bottomNavigationBar: Visibility(
        visible: _selectedCriteria2.isNotEmpty,
        child: InkWell(
          onTap: () {
            // print(placePredictions[0].placeId);
            // print(_selectedCriteria2);
            // print(_latitude);
            // print(_longitude);
            if (_latitude != null && _longitude != null) {
              // fetchHouseData(_selectedCriteria2);
              var insightDataProvileVisit =
                  Provider.of<HouseProvider>(context, listen: false);
              insightDataProvileVisit
                  .fetchHouseData(_selectedCriteria2, _latitude.toString(),
                      _longitude.toString())
                  .then((value) => insightDataProvileVisit.houses.isEmpty
                      ? ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  'No houses found for the selected criteria')),
                        )
                      : navigatorPush(context, PropertyCard()
                          // print("Data Found")
                          ));

              // print(insightDataProvileVisit);
            }
            if (_latitude == null && _longitude == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Please select a location')),
              );
            }

            // fetchHouseData(_selectedCriteria2);
          },
          child: Container(
            height: 55,
            width: double.infinity,
            color: tgAccentColor,
            child: Center(
                child:
                    // _isLoading ? Center(child: CircularProgressIndicator(backgroundColor: Colors.white,)):
                    Text(
              "Search",
              style: TextStyle(color: Colors.white, fontSize: 17),
            )),
          ),
        ),
      ),
    );
  }

  // Widget _buildSelectedCriteriaContainer(
  //     BuildContext context, String text, VoidCallback onRemove) {
  //   return Container(
  //     padding: EdgeInsets.all(8),
  //     decoration: BoxDecoration(
  //       color: Colors.grey[200],
  //       borderRadius: BorderRadius.circular(10),
  //     ),
  //     child: Container(
  //       padding: EdgeInsets.symmetric(vertical: 3.7, horizontal: 10),
  //       decoration: BoxDecoration(
  //         color: tgLightPrimaryColor,
  //         borderRadius: BorderRadius.circular(10),
  //       ),
  //       child: Row(
  //         mainAxisSize: MainAxisSize.min,
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           Flexible(
  //             child: Text(
  //               text,
  //               style: TextStyle(color: Colors.black87, fontSize: 11.9),
  //               overflow: TextOverflow.ellipsis,
  //             ),
  //           ),
  //           GestureDetector(
  //             onTap: onRemove,
  //             child: Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child: Icon(
  //                 Icons.close,
  //                 color: tgDarkPrimaryColor,
  //                 size: 16,
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget _dropDown({
    required List<String> options,
    required ValueChanged<String?> onChanged,
    required String selectedValue,
  }) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
      ),
      child: Center(
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            items: options.map((String item) {
              return DropdownMenuItem<String>(value: item, child: Text(item));
            }).toList(),
            onChanged: onChanged,
            value: selectedValue,
          ),
        ),
      ),
    );
  }

  Widget _buildHouseOption(HosueType type, String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedType = type;
          // _selectedCriteria.houseType = type;
          _selectedCriteria2['houseType'] = type.toString().split('.').last;
          print(_selectedCriteria2);
          print("_selectedCriteria2");

          // print(_selectedCriteria);
        });
      },
      child: Container(
          // margin: EdgeInsets.all(10),
          // height: 50,
          // width: 50,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              color: _selectedType == type
                  // ? Colors.teal[200]
                  ? Colors.grey[200]
                  : Colors.white
              // Colors.grey[200]
              ),
          child: Column(
            children: [
              // Icon(Icons.access_alarm_rounded),
              if (type == HosueType.Apartment)
                SvgPicture.asset("images/fullhouse.svg", height: 30),
              if (type == HosueType.PG)
                SvgPicture.asset("images/pg.svg", height: 30),
              if (type == HosueType.PentHosue)
                SvgPicture.asset("images/penthouse.svg", height: 30),
              Text(label),
            ],
          )),
    );
  }

  Widget _BhkTypeOption(BHKType type, String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          // print(type);
          // Deselect all BHK types
          selectedBHKTypes.updateAll((key, value) => false);

          // Select the current BHK type
          selectedBHKTypes[type] = true;

          // Update the selected BHK type in _selectedCriteria
          // _selectedCriteria.bhkType = type;

          _selectedCriteria2['bedrooms'] =
              type.toString().split('.').last.replaceAll('BHK', '');
          print(_selectedCriteria2);
          print("_selectedCriteria2");
          // print(type);
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(16),
            color: selectedBHKTypes[type] == true ? Colors.teal : Colors.white
            // Colors.grey[200]
            ),
        child: Text(label),
      ),
    );
  }

  Widget _RoomTypeOption(RoomType type, String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          // print(type);
          selectedRoomTypes[type] = !selectedRoomTypes[type]!;
          // print(selectedBHKTypes);
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(16),
            color: selectedRoomTypes[type] == true ? Colors.teal : Colors.white
            // Colors.grey[200]
            ),
        child: Text(label),
      ),
    );
  }
}

enum HosueType { Apartment, PG, PentHosue }

enum BHKType { BHK1, BHK2, BHK3, BHK4, BHK5, BHK6 }

enum RoomType { SingleRoom, DoubleSharing, TripleSharing, FourSharing }



