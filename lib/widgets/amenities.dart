//
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sssv1/providers/business_profile_provider.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/utils/constants.dart';

class AmenitiesGridView extends StatefulWidget {
  const AmenitiesGridView({super.key});

  @override
  _AmenitiesGridViewState createState() => _AmenitiesGridViewState();
}

class _AmenitiesGridViewState extends State<AmenitiesGridView> {
  void _showAllAmenitiesDialog(BuildContext context, List<String> amenities) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.teal[50],
          title: const Text('All Amenities'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: amenities.length,
              itemBuilder: (BuildContext context, int index) {
                print(amenities);
                print("amenities..........");
                return ListTile(
                  leading: const Icon(
                    Icons.check,
                    color: tgPrimaryColor,
                    size: 17,
                  ),
                  title: Text(
                    amenities[index],
                    style: TextStyle(fontSize: 14.5),
                  ),
                );
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Close',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<BusinessProfileProvider>(context);
    var amenities = data.businessProfileAddData?.amenities ?? [];
    int initialAmenitiesCount = 3;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: tgPrimaryColor))),
            child: Text(
              "Amenities",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        // Display the first 3 amenities
        amenities.length > 0
            ? ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: amenities.length > initialAmenitiesCount
                    ? initialAmenitiesCount
                    : amenities.length,
                itemBuilder: (BuildContext context, int index) {
                  print(amenities);
                  print("amenities.length..........................");
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.start,
                      spacing: 3.0,
                      children: [
                        const Icon(
                          Icons.check,
                          color: tgPrimaryColor,
                          size: 17,
                        ),
                        SizedBox(width: 7),
                        Text(
                          amenities[index],
                          style: const TextStyle(
                              color: secondaryColor40LightTheme),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ],
                    ),
                  );
                },
              )
            : Text("empty"),

        // "More" button
        if (amenities.length > initialAmenitiesCount)
          TextButton(
            onPressed: () => _showAllAmenitiesDialog(context, amenities),
            child: const Text(
              'More ...',
              style: TextStyle(color: secondaryColor60LightTheme),
            ),
          ),
      ],
    );
  }
}
