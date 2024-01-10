import 'package:flutter/material.dart';


class MyHomePageee extends StatefulWidget {
  @override
  _MyHomePageeeState createState() => _MyHomePageeeState();
}

class _MyHomePageeeState extends State<MyHomePageee> {
  String _selectedDropdownMax = "1000";
  var _dropDowndownOptionsMax = ["1000", "2000", "3000", "4000", "5000"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown Example'),
      ),
      body: Center(
        child: _dropDown(_dropDowndownOptionsMax, _selectedDropdownMax),
      ),
    );
  }

  Widget _dropDown(List<String> options, String selectedvalue) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          items: options.map((String item) {
            return DropdownMenuItem<String>(value: item, child: Text(item));
          }).toList(),
          onChanged: (String? newvalue) {
            setState(() {
              selectedvalue = newvalue!;
            });
          },
          value: selectedvalue,
        ),
      ),
    );
  }
}
