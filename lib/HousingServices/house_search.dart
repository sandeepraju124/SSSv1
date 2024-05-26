// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, unused_field, non_constant_identifier_names, constant_identifier_names, avoid_unnecessary_containers

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/models/Housedata_model.dart';
import 'package:sssv1/models/business_models.dart';
import 'package:sssv1/providers/Housedata_Provider.dart';
import 'package:sssv1/screens/SubCategoryList.dart';
import 'package:sssv1/utils/constants.dart';

// Define the SearchCriteria class
class SearchCriteria {
  String? location;
  HosueType? houseType;
  BHKType? bhkType; // Add this field
  String? priceRange;

  SearchCriteria(
      {this.location, this.houseType, this.bhkType, this.priceRange});
}

// Add this function at the top of your file, outside of your widget class
BusinessModel convertHouseToBusiness(HousedataModel house) {
  return BusinessModel(
    address: house.address,
    businessDescription: house.businessDescription,
    businessName: house.businessName,
    businessUid: house.businessUid,
    category: house.category,
    contactInformation: house.contactInformation,
    country: house.country,
    latitude: house.latitude,
    longitude: house.longitude,
    profileImageUrl: house.profileImageUrl,
    subCategory: house.subCategory,
    isPremium:
        null, // Assuming there's no corresponding field in HousedataModel
  );
}

class HouseSearch extends StatefulWidget {
  const HouseSearch({super.key});

  @override
  State<HouseSearch> createState() => _HouseSearchState();
}

class _HouseSearchState extends State<HouseSearch> {
  HosueType? _selectedType;
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  List<String> _suggestions = [];
  OverlayEntry? _overlayEntry = null;
  Timer? _debounce;
  bool _suggestionSelected = false;
  SearchCriteria _selectedCriteria = SearchCriteria();
  List<HousedataModel> _searchResults = [];

  bool _showAdvanceFilters = false;

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

  // String _selectedDropdownMin = "Min";
  String _selectedDropdownMax = "Price";
  // var _dropDowndownOptionsMin = ["Min", "1000", "2000", "3000", "4000", "5000"];
  var _dropDowndownOptionsMax = [
    "Price",
    "10000",
    "20000",
    "30000",
    "40000",
    "50000"
  ];

  String _ShowAdvance = "Show Advance Filters";
  String _HideAdvance = "Hide Advance Filters";

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchQueryChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    _overlayEntry?.remove();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchQueryChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 600), () {
      final query = _searchController.text.trim();
      if (query.isNotEmpty) {
        _suggestionSelected = false;

        // Build query parameters with all selected criteria
        Map<String, String> queryParams = {'location': query};
        if (_selectedCriteria.houseType != null) {
          queryParams['house_type'] =
              _selectedCriteria.houseType!.toString().split('.').last;
        }
        if (_selectedCriteria.bhkType != null) {
          queryParams['bedrooms'] = _selectedCriteria.bhkType!
              .toString()
              .split('.')
              .last
              .replaceAll('BHK', '');
        }
        if (_selectedCriteria.priceRange != null) {
          queryParams['price'] = _selectedCriteria.priceRange!;
        }
        print('Query Params: $queryParams'); // Debugging print

        final houseProvider =
            Provider.of<HouseProvider>(context, listen: false);
        houseProvider.fetchHouseData(queryParams).then((_) {
          if (mounted && !_suggestionSelected) {
            final suggestions =
                houseProvider.houses.map((house) => house.location).toList();
            setState(() {
              _suggestions = suggestions;
              if (_suggestions.isNotEmpty) {
                _showOverlay();
              } else {
                _hideOverlay();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('No results found for "$query"')),
                );
              }
            });
          }
        }).catchError((error) {
          if (mounted && !_suggestionSelected) {
            _hideOverlay();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error fetching data: $error')),
            );
          }
        });
      } else {
        setState(() {
          _suggestions = [];
          _hideOverlay();
        });
      }
    });
  }

  void _showOverlay() {
    if (_overlayEntry != null) return;

    _overlayEntry = _createOverlayEntry(_suggestions);
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideOverlay() {
    if (_overlayEntry == null) return;

    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  OverlayEntry _createOverlayEntry(List<String> suggestions) {
    return OverlayEntry(
      builder: (BuildContext context) {
        return Positioned(
          top: 177.5,
          left: 13.5,
          right: 20,
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(10),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: suggestions.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            suggestions[index],
                            style: TextStyle(fontSize: 14),
                          ),
                          Icon(Icons.directions),
                        ],
                      ),
                      onTap: () => _selectSuggestion(suggestions[index]),
                    ),
                    Divider(
                      endIndent: 10,
                      indent: 10,
                      thickness: 0.2,
                      color: Colors.grey,
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }

  void _selectSuggestion(String suggestion) {
    _searchFocusNode.unfocus();
    _suggestionSelected = true;
    setState(() {
      _selectedCriteria.location = suggestion;
      _suggestions = [];
      _searchController.clear();
      _hideOverlay();
    });
  }

  void _removeLocation() {
    setState(() {
      _selectedCriteria.location = null;
      _searchController.clear();
    });
  }

  void _removeHouseType() {
    setState(() {
      _selectedCriteria.houseType = null;
      _selectedType = null; // Reset the selected type
    });
  }

  void _removeBHKType() {
    setState(() {
      _selectedCriteria.bhkType = null;
      selectedBHKTypes.updateAll((key, value) => false); // Reset all BHK types
    });
  }

  void _removePriceRange() {
    setState(() {
      _selectedCriteria.priceRange = null;
      _selectedDropdownMax = "Price"; // Reset the selected price range
    });
  }

  void _onSearchPressed() async {
    print('Selected Criteria: $_selectedCriteria'); // Debugging print

    final houseProvider = Provider.of<HouseProvider>(context, listen: false);

    // Construct query parameters with only non-null values
    Map<String, String> queryParams = {};
    if (_selectedCriteria.location != null) {
      queryParams['location'] = _selectedCriteria.location!;
    }
    if (_selectedCriteria.houseType != null) {
      queryParams['house_type'] =
          _selectedCriteria.houseType!.toString().split('.').last;
    }
    if (_selectedCriteria.bhkType != null) {
      queryParams['bedrooms'] = _selectedCriteria.bhkType!
          .toString()
          .split('.')
          .last
          .replaceAll('BHK', '');
    }
    if (_selectedCriteria.priceRange != null) {
      queryParams['price'] = _selectedCriteria.priceRange!;
    }

    print('Final Query Params: $queryParams'); // Debugging print

    try {
      final results = await houseProvider.fetchHouseData(queryParams);

      if (results.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('No results found for the selected criteria')),
        );
      } else {
        // Convert HousedataModel to BusinessModel
        List<BusinessModel> convertedResults =
            results.map((house) => convertHouseToBusiness(house)).toList();

        // Navigate to the SubCategoryList page with the converted search results
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SubCategoryList(
              keyy: 'house',
              value: 'House Search Results',
              houseSearchResults: convertedResults,
              isHouseSearch: true,
            ),
          ),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching data: $error')),
      );
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
        child: ListView(
            padding: const EdgeInsets.only(top: 25, left: 10, right: 18),
            children: [
              SizedBox(
                height: 66,
                child: Column(
                  children: [
                    TextField(
                      style: TextStyle(
                          color: secondaryColor40LightTheme, fontSize: 14.5),
                      controller: _searchController,
                      focusNode: _searchFocusNode,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
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
                    if (_suggestions.isNotEmpty)
                      Expanded(
                        child: SingleChildScrollView(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: _suggestions.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(_suggestions[index]),
                                onTap: () =>
                                    _selectSuggestion(_suggestions[index]),
                              );
                            },
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(
                height: 17,
              ),
              // Display selected criteria
              if (_selectedCriteria.location != null ||
                  _selectedCriteria.houseType != null ||
                  _selectedCriteria.bhkType != null ||
                  _selectedCriteria.priceRange !=
                      null) // Include price range condition
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Wrap(
                    spacing: 12.0, // gap between adjacent chips
                    runSpacing: 3.0, // gap between lines

                    children: [
                      Text(
                        "Selected Criteria:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      if (_selectedCriteria.location != null)
                        _buildSelectedCriteriaContainer(
                          context,
                          _selectedCriteria.location!,
                          _removeLocation,
                        ),
                      if (_selectedCriteria.houseType != null)
                        _buildSelectedCriteriaContainer(
                          context,
                          _selectedCriteria.houseType!
                              .toString()
                              .split('.')
                              .last,
                          _removeHouseType,
                        ),
                      if (_selectedCriteria.bhkType != null)
                        _buildSelectedCriteriaContainer(
                          context,
                          _selectedCriteria.bhkType!.toString().split('.').last,
                          _removeBHKType,
                        ),
                      if (_selectedCriteria.priceRange != null)
                        _buildSelectedCriteriaContainer(
                          context,
                          _selectedCriteria.priceRange!,
                          _removePriceRange,
                        ),
                      ElevatedButton(
                          onPressed: _onSearchPressed,
                          style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all<Color>(
                                  tgPrimaryColor),
                              elevation: WidgetStateProperty.all(10)),
                          child: Text(
                            "Search",
                            style: TextStyle(color: Colors.black87),
                          )),
                    ],
                  ),
                ),
              SizedBox(
                height: 10,
              ),

              // SizedBox(
              //   height: 30, // Adjust the height according to your UI
              //   child: ListView.builder(
              //     itemCount: _searchResults.length,
              //     itemBuilder: (context, index) {
              //       // Customize the UI for each result item
              //       return ListTile(
              //         title: Text(_searchResults[index].businessName),
              //         subtitle: Text(_searchResults[index].location),
              //         // Add more details or actions if needed
              //       );
              //     },
              //   ),
              // ),

              Text("House Type", style: TextStyle(fontSize: 15)),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildHouseOption(HosueType.Full_House, "Full House"),
                    _buildHouseOption(HosueType.PG, "PG/Hostel"),
                    _buildHouseOption(HosueType.PentHosue, "Pent Hosue")
                  ],
                ),
              ),
// Full House
              if (_selectedType == HosueType.Full_House)
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      child: Text("Room Type", style: TextStyle(fontSize: 15)),
                    ),
                    Container(
                      color: Colors.grey[200],
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          _selectedCriteria.priceRange = newvalue == "Price"
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
    );
  }

  Widget _buildSelectedCriteriaContainer(
      BuildContext context, String text, VoidCallback onRemove) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 3.7, horizontal: 10),
        decoration: BoxDecoration(
          color: tgLightPrimaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                text,
                style: TextStyle(color: Colors.black87, fontSize: 11.9),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            GestureDetector(
              onTap: onRemove,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.close,
                  color: tgDarkPrimaryColor,
                  size: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

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
          _selectedCriteria.houseType = type;

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
              if (type == HosueType.Full_House)
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
          _selectedCriteria.bhkType = type;
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

enum HosueType { Full_House, PG, PentHosue }

enum BHKType { BHK1, BHK2, BHK3, BHK4, BHK5, BHK6 }

enum RoomType { SingleRoom, DoubleSharing, TripleSharing, FourSharing }
