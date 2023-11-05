import 'package:flutter/material.dart';
import 'package:sssv1/providers/business_profile_provider.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/utils/constants.dart';

class AmenitiesGridView extends StatelessWidget {
  const AmenitiesGridView({super.key});

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Container(
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(color: tgPrimaryColor, width: 3),
            )),
            child: Text(
              'Amenities',
              style: TextStyle(
                fontSize: 22, // adjust the size as needed
              ),
            ),
          ),
        ),
        Expanded(
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: data.businessProfileData?.amenities.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns
              childAspectRatio: 5.0, // Width to height ratio of each item
            ),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(Icons.check, color: tgPrimaryColor),
                    const SizedBox(width: 3.0),
                    Text(data.businessProfileData!.amenities[index].toString()),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}



// ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:sssv1/providers/business_profile_provider.dart';

// class AmenitiesPage extends StatefulWidget {
//   const AmenitiesPage({super.key});

//   @override
//   State<AmenitiesPage> createState() => _AmenitiesPageState();
// }

// class _AmenitiesPageState extends State<AmenitiesPage> {
//   @override
//   Widget build(BuildContext context) {
//     var data = Provider.of<BusinessProfileProvider>(context);
//     return ListView.builder(
//       physics: NeverScrollableScrollPhysics(),
//       itemCount: data.businessProfileData!.amenities.length,
//       itemBuilder: (context, index) {
//         if (data.businessProfileData != null &&
//             data.businessProfileData!.amenities != null) {
//           return Row(
//             children: [
//               const Icon(Icons.check, color: Colors.green),
//               const SizedBox(
//                   width: 3.0), // Add spacing between the icon and text
//               Expanded(
//                 child: Text(
//                   data.businessProfileData!.amenities[index].toString(),
//                   style: const TextStyle(fontSize: 16.0),
//                 ),
//               ),
//             ],
//           );
//         } else {
//           return Container(); // Return an empty container if businessProfileData or amenities is null
//         }
//       },
//     );
//   }
// }
