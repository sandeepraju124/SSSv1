// // ignore_for_file: prefer_const_constructors
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:sssv1/HousingServices/business_houseModel.dart';
// import 'package:sssv1/models/business_models.dart';
// import 'package:sssv1/providers/business_profile_provider.dart';
// import 'package:sssv1/utils/constants.dart';

// class OverviewPage extends StatelessWidget {
//   const OverviewPage({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     var data = Provider.of<BusinessProfileProvider>(context);
//     var businessProfileData = data.businessProfileData;

//     if (businessProfileData == null) {
//       return Center(child: CircularProgressIndicator());
//     }

//     // Determine the type of business and return the appropriate widget
//     Widget detailsWidget;
//     switch (businessProfileData.category) {
//       case 'Housing':
//         detailsWidget = _buildHousingDetails(businessProfileData);
//         break;
//       case 'Restaurant':
//         detailsWidget = _buildRestaurantDetails(businessProfileData);
//         break;
//       case 'Shopping':
//         detailsWidget = _buildMallDetails(businessProfileData);
//         break;
//       default:
//         detailsWidget = _buildGenericDetails(businessProfileData);
//         break;
//     }

//     /// Below code is for Heading

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _buildHeadingWithUnderline("Overview", tgDarkPrimaryColor),
//         detailsWidget, // Insert the details widget based on the business category
//       ],
//     );
//   }

//   // below are the helper widgets for respective business///

//   Widget _buildHousingDetails(BusinessHousemodel businessProfileData) {
//     var housingDetails = businessProfileData;
//     if (housingDetails == null) {
//       return Text("No housing details available");
//     }
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _buildDetailRow("Furnishing Status", housingDetails.furnishingStatus),
//           _buildDetailRow("Facing", housingDetails.facing),
//           _buildDetailRow("Gated Security", housingDetails.gatedSecurity),
//           _buildDetailRow("Age of Building", housingDetails.ageofBuilding),
//           _buildDetailRow("Rooms", housingDetails.rooms),
//           // Add more housing-specific details as needed
//         ],
//       ),
//     );
//   }

//   Widget _buildRestaurantDetails(BusinessModel businessProfileData) {
//     // Assuming 'restaurantDetails' is specific to 'Restaurant' category
//     // You will need to implement this method based on your actual data model
//     return Container(); // Placeholder for actual implementation
//   }

//   Widget _buildMallDetails(BusinessModel businessProfileData) {
//     var mallDetails = businessProfileData.malldetails;
//     if (mallDetails == null) {
//       return Text("No mall details available");
//     }
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _buildDetailRow("Cinema Screens", mallDetails.cinemaScreens),
//           _buildDetailRow("Food Court Seating", mallDetails.foodCourtSeating),
//           _buildDetailRow("Footfalls", mallDetails.footfalls),
//           _buildDetailRow("Square Feet", mallDetails.sqFt),
//           // Add more mall-specific details as needed
//         ],
//       ),
//     );
//   }

//   Widget _buildGenericDetails(Businessprofile businessProfileData) {
//     // Build a generic overview for other business categories
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // _buildDetailRow("Business Name", businessProfileData.businessName),
//           _buildDetailRow("No overview details available for ",
//               businessProfileData.businessName)
//           // Add more generic details as needed
//         ],
//       ),
//     );
//   }

//   Widget _buildDetailRow(String label, String? value) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 15),
//       child: Row(
//         children: [
//           Icon(Icons.circle, size: 8, color: secondaryColor20LightTheme),
//           SizedBox(width: 10),
//           Text(
//             "$label : ${value ?? "N/A"}",
//             style: TextStyle(
//                 color: secondaryColor40LightTheme,
//                 overflow: TextOverflow.ellipsis),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildHeadingWithUnderline(String text, Color underlineColor) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 11, top: 7),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             decoration: BoxDecoration(
//                 border: Border(bottom: BorderSide(color: tgPrimaryColor))),
//             child: Text(
//               text,
//               style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:sssv1/HousingServices/business_houseModel.dart';
// import 'package:sssv1/providers/business_profile_provider.dart';
// import 'package:sssv1/utils/constants.dart';

// class OverviewPage extends StatelessWidget {
//   const OverviewPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var data = Provider.of<BusinessProfileProvider>(context);
//     var businessProfileData = data.businessProfileData;
//     var businessHouseModelData = data.businessHouseModelData;

//     if (businessProfileData == null) {
//       return Center(child: CircularProgressIndicator());
//     }

//     // Assuming businessProfileData is now of type BusinessHousemodel
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _buildHeadingWithUnderline("Overview", tgDarkPrimaryColor),
//         _buildHousingDetails(businessHouseModelData!),
//       ],
//     );
//   }

//   Widget _buildHousingDetails(BusinessHousemodel housingDetails) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _buildDetailRow("Advance", housingDetails.advance),
//           _buildDetailRow("Bedrooms", housingDetails.bedrooms.toString()),
//           _buildDetailRow(
//               "Building Age", "${housingDetails.buildingAge} years"),
//           _buildDetailRow("Car Parking",
//               housingDetails.carParking ? "Available" : "Not Available"),
//           _buildDetailRow("Furnishing Level", housingDetails.furnishingLevel),
//           _buildDetailRow("House Facing", housingDetails.houseFacing),
//           _buildDetailRow("House Type", housingDetails.houseType),
//           _buildDetailRow("Location", housingDetails.location),
//           _buildDetailRow("Preferred", housingDetails.preferred),
//           _buildDetailRow("Price", housingDetails.price),
//         ],
//       ),
//     );
//   }

//   Widget _buildDetailRow(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 15),
//       child: Row(
//         children: [
//           Icon(Icons.circle, size: 8, color: secondaryColor20LightTheme),
//           SizedBox(width: 10),
//           Expanded(
//             child: Text(
//               "$label: $value",
//               style: TextStyle(
//                 color: secondaryColor40LightTheme,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

// ignore_for_file: prefer_const_constructors

//   Widget _buildHeadingWithUnderline(String text, Color underlineColor) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 11, top: 7),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               border: Border(bottom: BorderSide(color: tgPrimaryColor)),
//             ),
//             child: Text(
//               text,
//               style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:sssv1/HousingServices/business_houseModel.dart';
// import 'package:sssv1/providers/business_profile_provider.dart';
// import 'package:sssv1/utils/constants.dart';

// class OverviewPage extends StatelessWidget {
//   const OverviewPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var data = Provider.of<BusinessProfileProvider>(context);
//     var businessProfileData = data.businessProfileData;
//     var businessHouseModelData = data.businessHouseModelData;

//     if (data.isLoading) {
//       return Center(child: CircularProgressIndicator());
//     }

//     if (businessProfileData == null) {
//       return Center(child: Text("No business data available"));
//     }

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _buildHeadingWithUnderline("Overview", tgDarkPrimaryColor),
//         if (businessHouseModelData != null)
//           _buildHousingDetails(businessHouseModelData)
//         else
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(" No Overview Details Available for this business"),
//           ),
//       ],
//     );
//   }

//   Widget _buildHousingDetails(BusinessHousemodel housingDetails) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _buildDetailRow("Advance", housingDetails.advance),
//           _buildDetailRow("Bedrooms", housingDetails.bedrooms.toString()),
//           _buildDetailRow(
//               "Building Age", "${housingDetails.buildingAge} years"),
//           _buildDetailRow("Car Parking",
//               housingDetails.carParking ? "Available" : "Not Available"),
//           _buildDetailRow("Furnishing Level", housingDetails.furnishingLevel),
//           _buildDetailRow("House Facing", housingDetails.houseFacing),
//           _buildDetailRow("House Type", housingDetails.houseType),
//           _buildDetailRow("Location", housingDetails.location),
//           _buildDetailRow("Preferred", housingDetails.preferred),
//           _buildDetailRow("Price", housingDetails.price),
//         ],
//       ),
//     );
//   }

//   Widget _buildDetailRow(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 15),
//       child: Row(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(right: 5),
//             child: Icon(Icons.circle, size: 8, color: tgPrimaryColor),
//           ),
//           SizedBox(width: 10),
//           Expanded(
//             child: Text(
//               "$label: $value",
//               style: TextStyle(
//                 color: secondaryColor40LightTheme,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildHeadingWithUnderline(String text, Color underlineColor) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 11, top: 7),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               border: Border(bottom: BorderSide(color: tgDarkPrimaryColor)),
//             ),
//             child: Text(
//               text,
//               style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }




// this is working currently commenting

//
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:provider/provider.dart';
// import 'package:sssv1/HousingServices/business_houseModel.dart';
// import 'package:sssv1/providers/business_profile_provider.dart';
// import 'package:sssv1/utils/constants.dart';
// import 'package:sssv1/utils/success_lottiejson.dart';
//
// class OverviewPage extends StatelessWidget {
//   const OverviewPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var data = Provider.of<BusinessProfileProvider>(context);
//     // var businessProfileData = data.businessProfileData;
//     var businessHouseModelData = [];
//     // print("Business House Model Data: $businessHouseModelData");
//
//     if (data.isLoading) {
//       return Center(child: CircularProgressIndicator());
//     }
//     if (data.error != null) {
//       return Center(child: Text("Error: ${data.error}"));
//     }
//     if (businessProfileData == null) {
//       return Center(child: Text("No business profile data available"));
//     }
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _buildHeadingWithUnderline("Overview", tgDarkPrimaryColor),
//         if (businessHouseModelData != null)
//           _buildHousingDetails(context, businessHouseModelData)
//         else
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Center(
//               child: Column(
//                 children: [
//                   Lottie.asset("images/OverviewEmpty.json", height: 150),
//                   Text("No Overview Details Available for this business",
//                       style: TextStyle(fontSize: 12)),
//                 ],
//               ),
//             ),
//           ),
//       ],
//     );
//   }
//
//   Widget _buildHousingDetails(
//       BuildContext context, BusinessHousemodel housingDetails) {
//     List<Widget> detailRows = [
//       _buildDetailRow("Advance", housingDetails.advance.toString()),
//       _buildDetailRow("Bedrooms", housingDetails.bedrooms.toString()),
//       _buildDetailRow("Building Age", "${housingDetails.buildingAge} years"),
//       _buildDetailRow("Car Parking",
//           housingDetails.carParking == true ? "Available" : "Not Available"),
//       _buildDetailRow("Furnishing Level", housingDetails.furnishingLevel),
//     ];
//
//     List<Widget> allDetailRows = [
//       ...detailRows,
//       _buildDetailRow("House Facing", housingDetails.houseFacing),
//       _buildDetailRow("House Type", housingDetails.houseType),
//       _buildDetailRow("Location", housingDetails.location),
//       _buildDetailRow("Preferred", housingDetails.preferred),
//       _buildDetailRow("Price", housingDetails.price),
//     ];
//
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ...detailRows,
//           SizedBox(height: 10),
//           TextButton(
//               onPressed: () {
//                 showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return AlertDialog(
//                       title: Text("All Overview Details"),
//                       content: SingleChildScrollView(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisSize: MainAxisSize.min,
//                           children: allDetailRows,
//                         ),
//                       ),
//                       actions: <Widget>[
//                         TextButton(
//                           child: Text(
//                             "Close",
//                             style: TextStyle(color: tgDarkPrimaryColor),
//                           ),
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           },
//                         ),
//                       ],
//                     );
//                   },
//                 );
//               },
//               child: Text(
//                 "More ...",
//                 style: TextStyle(color: tgDarkPrimaryColor),
//               ))
//         ],
//       ),
//     );
//   }
//
//   Widget _buildDetailRow(String label, String? value) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 15, left: 10),
//       child: Row(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(right: 5),
//             child: Icon(Icons.circle, size: 8, color: tgPrimaryColor),
//           ),
//           SizedBox(width: 10),
//           Expanded(
//             child: Text(
//               "$label: ${value ?? 'N/A'}",
//               style: TextStyle(
//                 color: secondaryColor60LightTheme,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildHeadingWithUnderline(String text, Color underlineColor) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 11, top: 7),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               border: Border(bottom: BorderSide(color: tgDarkPrimaryColor)),
//             ),
//             child: Text(
//               text,
//               style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
