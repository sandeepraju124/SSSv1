// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, unused_field, non_constant_identifier_names, constant_identifier_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sssv1/utils/constants.dart';

class HouseSearch extends StatefulWidget {
  const HouseSearch({super.key});

  @override
  State<HouseSearch> createState() => _HouseSearchState();
}

class _HouseSearchState extends State<HouseSearch> {
  HosueType? _selectedType;

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

  String _selectedDropdownMin = "Min";
  String _selectedDropdownMax = "Max";
  var _dropDowndownOptionsMin = ["Min", "1000", "2000", "3000", "4000", "5000"];
  var _dropDowndownOptionsMax = [
    "Max",
    "10000",
    "20000",
    "30000",
    "40000",
    "50000"
  ];

  String _ShowAdvance = "Show Advance Filters";
  String _HideAdvance = "Hide Advance Filters";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(padding: const EdgeInsets.all(16.0), children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              // borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search location ',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  // color: Colors.teal,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    // borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Icon(
                    Icons.location_on,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 20,bottom: 10),
          //   child: Text("House Type",style: TextStyle(fontSize: 15)),
          // ),
          Text("House Type", style: TextStyle(fontSize: 15)),
          SizedBox(
            height: 10,
          ),
          Container(
            // color: Colors.grey[200],
            // height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildHouseOption(HosueType.FullHouse, "Full House"),
                _buildHouseOption(HosueType.PG, "PG/Hostel"),
                _buildHouseOption(HosueType.PentHosue, "Pent Hosue")
              ],
            ),
          ),
// Full House
          if (_selectedType == HosueType.FullHouse)
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
                            _RoomTypeOption(RoomType.SingleRoom, "Single Room"),
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text("Select Range"),
          ),
          Row(
            children: [
              Expanded(
                child: _dropDown(
                  options: _dropDowndownOptionsMin,
                  onChanged: (String? newvalue) {
                    setState(() {
                      _selectedDropdownMin = newvalue!;
                    });
                  },
                  selectedValue: _selectedDropdownMin,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: _dropDown(
                  options: _dropDowndownOptionsMax,
                  onChanged: (String? newvalue) {
                    setState(() {
                      _selectedDropdownMax = newvalue!;
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

          GestureDetector(
              onTap: () {
                setState(() {
                  _showAdvanceFilters = !_showAdvanceFilters;
                });
                // print(_showAdvanceFilters);
              },
              child: _showAdvanceFilters
                  ? RetangularBorderBox(_HideAdvance)
                  : RetangularBorderBox(_ShowAdvance)),
          if (_showAdvanceFilters) Text("advance")
        ]),
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
          // print(type);
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
              if (type == HosueType.FullHouse)
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
          selectedBHKTypes[type] = !selectedBHKTypes[type]!;
          // print(selectedBHKTypes);
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

enum HosueType { FullHouse, PG, PentHosue }

enum BHKType { BHK1, BHK2, BHK3, BHK4, BHK5, BHK6 }

enum RoomType { SingleRoom, DoubleSharing, TripleSharing, FourSharing }
