import 'package:flutter/material.dart';
import 'package:sssv1/providers/business_profile_provider.dart';
import 'package:provider/provider.dart';

class AmenitiesGridView extends StatelessWidget {
  // final List<String> amenities = [
  //   'WiFi',
  //   'Parking',
  //   'Takeout',
  //   'Delivery',
  //   'Dine-In',
  //   'Outdoor Seating',
  //   'Family-Friendly',

  // ];

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<BusinessProfileProvider>(context);
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: data.businessProfileData!.amenities.length,
      // amenities.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns
        childAspectRatio: 5.0, // Width to height ratio of each item
      ),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 0.0,
          ),
          child: Row(
            children: [
              const Icon(Icons.check, color: Colors.green),
              const SizedBox(
                  width: 3.0), // Add spacing between the icon and text
              Expanded(
                child: Text(
                  data.businessProfileData!.amenities[index].toString(),
                  // amenities[index],
                  style: const TextStyle(fontSize: 16.0),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
