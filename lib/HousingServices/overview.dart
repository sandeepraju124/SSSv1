// // // ignore_for_file: prefer_const_constructors

// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// // import 'package:sssv1/providers/business_profile_provider.dart';

// // class OverviewPage extends StatelessWidget {
// //   const OverviewPage({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     var data = Provider.of<BusinessProfileProvider>(context);

// //     return Column(children: [
// //       if (data.businessProfileData?.hosingdetails != null) ...[
// //         Text(
// //             "Age of Building :  ${data.businessProfileData?.hosingdetails!.ageofBuilding.toString()}"),
// //         Text(
// //             "Bathroom : ${data.businessProfileData?.hosingdetails!.bathroom.toString()}"),
// //         Text(
// //             'Facing: ${data.businessProfileData?.hosingdetails!.facing.toString()}'),
// //         Text(
// //             'Furnishing Status: ${data.businessProfileData?.hosingdetails!.furnishingStatus.toString()}'),
// //         Text(
// //             'Gated Security: ${data.businessProfileData?.hosingdetails!.gatedSecurity.toString()}'),
// //         Text(
// //             'Rooms: ${data.businessProfileData?.hosingdetails!.rooms.toString()}'),
// //       ],
// //     ]);
// //   }
// // }

// // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:sssv1/providers/business_profile_provider.dart';
// import 'package:sssv1/utils/constants.dart';

// class OverviewPage extends StatelessWidget {
//   const OverviewPage({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     var data = Provider.of<BusinessProfileProvider>(context);

//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(left: 11, top: 7),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Overview",
//                 style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
//               ),
//               Container(
//                 margin: EdgeInsets.only(
//                   left: 6,
//                 ),
//                 height: 3, // Adjust the height of the line as needed
//                 width: 75, // Adjust the width of the line as needed
//                 decoration: BoxDecoration(
//                     border: Border(
//                         bottom: BorderSide(
//                             color:
//                                 tgPrimaryColor))), // Set the color of the line
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(top: 15),
//                     child: Row(
//                       children: [
//                         Icon(Icons.circle,
//                             size: 8, color: secondaryColor20LightTheme),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Text(
//                           "Furnishing Status : ${data.businessProfileData?.hosingdetails?.furnishingStatus.toString() ?? "N/A"}",
//                           style: TextStyle(color: secondaryColor40LightTheme),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),

//               ////////// 2nd //////////
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(top: 15),
//                     child: Row(
//                       children: [
//                         Icon(Icons.circle,
//                             size: 8, color: secondaryColor20LightTheme),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Text(
//                           "Facing : ${data.businessProfileData?.hosingdetails?.facing.toString() ?? "N/A"}",
//                           style: TextStyle(color: secondaryColor40LightTheme),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),

//               ////////// 3rd /////
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(top: 15),
//                     child: Row(
//                       children: [
//                         Icon(Icons.circle,
//                             size: 8, color: secondaryColor20LightTheme),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Text(
//                           "GatedSecurity : ${data.businessProfileData?.hosingdetails?.gatedSecurity.toString() ?? "N/A"}",
//                           style: TextStyle(color: secondaryColor40LightTheme),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),

//               ////////////// 4th ////////////////

//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(top: 15),
//                     child: Row(
//                       children: [
//                         Icon(Icons.circle,
//                             size: 8, color: secondaryColor20LightTheme),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Text(
//                           " Age of building : ${data.businessProfileData?.hosingdetails?.ageofBuilding.toString() ?? "N/A"}",
//                           style: TextStyle(color: secondaryColor40LightTheme),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),

//               // 5th //////////////////////

//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(top: 15),
//                     child: Row(
//                       children: [
//                         Icon(Icons.circle,
//                             size: 8, color: secondaryColor20LightTheme),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Text(
//                           " Rooms : ${data.businessProfileData?.hosingdetails?.rooms.toString() ?? "N/A"}",
//                           style: TextStyle(color: secondaryColor40LightTheme),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         // Divider(
//         //   color: Colors.blueGrey,
//         //   thickness: .7,
//         // ),
//       ],
//     );
//   }
// }

// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/models/business_profile.dart';
import 'package:sssv1/providers/business_profile_provider.dart';
import 'package:sssv1/utils/constants.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<BusinessProfileProvider>(context);
    var businessProfileData = data.businessProfileData;

    if (businessProfileData == null) {
      return Center(child: CircularProgressIndicator());
    }

    // Determine the type of business and return the appropriate widget
    Widget detailsWidget;
    switch (businessProfileData.category) {
      case 'Housing':
        detailsWidget = _buildHousingDetails(businessProfileData);
        break;
      case 'Restaurant':
        detailsWidget = _buildRestaurantDetails(businessProfileData);
        break;
      case 'Shopping':
        detailsWidget = _buildMallDetails(businessProfileData);
        break;
      default:
        detailsWidget = _buildGenericDetails(businessProfileData);
        break;
    }

    /// Below code is for Heading

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeadingWithUnderline("Overview", tgDarkPrimaryColor),
        detailsWidget, // Insert the details widget based on the business category
      ],
    );
  }

  // below are the helper widgets for respective business///

  Widget _buildHousingDetails(Businessprofile businessProfileData) {
    var housingDetails = businessProfileData.hosingdetails;
    if (housingDetails == null) {
      return Text("No housing details available");
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDetailRow("Furnishing Status", housingDetails.furnishingStatus),
          _buildDetailRow("Facing", housingDetails.facing),
          _buildDetailRow("Gated Security", housingDetails.gatedSecurity),
          _buildDetailRow("Age of Building", housingDetails.ageofBuilding),
          _buildDetailRow("Rooms", housingDetails.rooms),
          // Add more housing-specific details as needed
        ],
      ),
    );
  }

  Widget _buildRestaurantDetails(Businessprofile businessProfileData) {
    // Assuming 'restaurantDetails' is specific to 'Restaurant' category
    // You will need to implement this method based on your actual data model
    return Container(); // Placeholder for actual implementation
  }

  Widget _buildMallDetails(Businessprofile businessProfileData) {
    var mallDetails = businessProfileData.malldetails;
    if (mallDetails == null) {
      return Text("No mall details available");
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDetailRow("Cinema Screens", mallDetails.cinemaScreens),
          _buildDetailRow("Food Court Seating", mallDetails.foodCourtSeating),
          _buildDetailRow("Footfalls", mallDetails.footfalls),
          _buildDetailRow("Square Feet", mallDetails.sqFt),
          // Add more mall-specific details as needed
        ],
      ),
    );
  }

  Widget _buildGenericDetails(Businessprofile businessProfileData) {
    // Build a generic overview for other business categories
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // _buildDetailRow("Business Name", businessProfileData.businessName),
          _buildDetailRow("No overview details available for ",
              businessProfileData.businessName)
          // Add more generic details as needed
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        children: [
          Icon(Icons.circle, size: 8, color: secondaryColor20LightTheme),
          SizedBox(width: 10),
          Text(
            "$label : ${value ?? "N/A"}",
            style: TextStyle(color: secondaryColor40LightTheme),
          ),
        ],
      ),
    );
  }

  Widget _buildHeadingWithUnderline(String text, Color underlineColor) {
    return Padding(
      padding: const EdgeInsets.only(left: 11, top: 7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: tgPrimaryColor))),
            child: Text(
              text,
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
