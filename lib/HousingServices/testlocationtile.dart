// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LocationListTile extends StatelessWidget {
  final VoidCallback press;
  final String location;
  const LocationListTile(
      {Key? key, required this.location, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: press,
          horizontalTitleGap: 0,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Icon(
              Icons.location_on_rounded,
              size: 17.3,
            ),
          ),
          title: Text(
            location,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 13.6),
          ),
        ),
        Divider(
          thickness: 1,
          height: 2,
        )
      ],
    );
  }
}
