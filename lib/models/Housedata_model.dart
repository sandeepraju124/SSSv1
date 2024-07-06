// // To parse this JSON data, do
// //
// //     final housedataModel = housedataModelFromJson(jsonString);

// import 'dart:convert';

// List<HousedataModel> housedataModelFromJson(String str) => List<HousedataModel>.from(json.decode(str).map((x) => HousedataModel.fromJson(x)));

// String housedataModelToJson(List<HousedataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class HousedataModel {
//     String advance;
//     int bedrooms;
//     int buildingAge;
//     double businessLatitude;
//     double businessLongitude;
//     String businessName;
//     String businessUid;
//     bool carParking;
//     String category;
//     String contactInformation;
//     String country;
//     String furnishingLevel;
//     String houseFacing;
//     String houseType;
//     String location;
//     String preferred;
//     String price;
//     String profileImageUrl;
//     String subCategory;

//     HousedataModel({
//         required this.advance,
//         required this.bedrooms,
//         required this.buildingAge,
//         required this.businessLatitude,
//         required this.businessLongitude,
//         required this.businessName,
//         required this.businessUid,
//         required this.carParking,
//         required this.category,
//         required this.contactInformation,
//         required this.country,
//         required this.furnishingLevel,
//         required this.houseFacing,
//         required this.houseType,
//         required this.location,
//         required this.preferred,
//         required this.price,
//         required this.profileImageUrl,
//         required this.subCategory,
//     });

//     factory HousedataModel.fromJson(Map<String, dynamic> json) => HousedataModel(
//         advance: json["advance"],
//         bedrooms: json["bedrooms"],
//         buildingAge: json["building_age"],
//         businessLatitude: json["business_latitude"]?.toDouble(),
//         businessLongitude: json["business_longitude"]?.toDouble(),
//         businessName: json["business_name"],
//         businessUid: json["business_uid"],
//         carParking: json["car_parking"],
//         category: json["category"],
//         contactInformation: json["contact_information"],
//         country: json["country"],
//         furnishingLevel: json["furnishing_level"],
//         houseFacing: json["house_facing"],
//         houseType: json["house_type"],
//         location: json["location"],
//         preferred: json["preferred "],
//         price: json["price"],
//         profileImageUrl: json["profile_image_url"],
//         subCategory: json["sub_category"],
//     );

//     Map<String, dynamic> toJson() => {
//         "advance": advance,
//         "bedrooms": bedrooms,
//         "building_age": buildingAge,
//         "business_latitude": businessLatitude,
//         "business_longitude": businessLongitude,
//         "business_name": businessName,
//         "business_uid": businessUid,
//         "car_parking": carParking,
//         "category": category,
//         "contact_information": contactInformation,
//         "country": country,
//         "furnishing_level": furnishingLevel,
//         "house_facing": houseFacing,
//         "house_type": houseType,
//         "location": location,
//         "preferred ": preferred,
//         "price": price,
//         "profile_image_url": profileImageUrl,
//         "sub_category": subCategory,
//     };
// }

class HousedataModel {
  String? advance;
  int? bedrooms;
  int? buildingAge;
  double? businessLatitude;
  double? businessLongitude;
  String? businessName;
  String? businessUid;
  bool? carParking;
  String? category;
  String? contactInformation;
  String? country;
  String? furnishingLevel;
  String? houseFacing;
  String? houseType;
  String? location;
  String? preferred;
  String? price;
  String? profileImageUrl;
  String? subCategory;

  HousedataModel({
    this.advance,
    this.bedrooms,
    this.buildingAge,
    this.businessLatitude,
    this.businessLongitude,
    this.businessName,
    this.businessUid,
    this.carParking,
    this.category,
    this.contactInformation,
    this.country,
    this.furnishingLevel,
    this.houseFacing,
    this.houseType,
    this.location,
    this.preferred,
    this.price,
    this.profileImageUrl,
    this.subCategory,
  });

  factory HousedataModel.fromJson(Map<String, dynamic> json) => HousedataModel(
        advance: json["advance"]?.toString(),
        bedrooms: json["bedrooms"],
        buildingAge: json["building_age"],
        businessLatitude: json["business_latitude"]?.toDouble(),
        businessLongitude: json["business_longitude"]?.toDouble(),
        businessName: json["business_name"],
        businessUid: json["business_uid"],
        carParking: json["car_parking"],
        category: json["category"],
        contactInformation: json["contact_information"],
        country: json["country"],
        furnishingLevel: json["furnishing_level"],
        houseFacing: json["house_facing"],
        houseType: json["house_type"],
        location: json["location"],
        preferred: json["preferred"], // Note: Removed extra space
        price: json["price"]?.toString(),
        profileImageUrl: json["profile_image_url"],
        subCategory: json["sub_category"],
      );

  Map<String, dynamic> toJson() => {
        "advance": advance,
        "bedrooms": bedrooms,
        "building_age": buildingAge,
        "business_latitude": businessLatitude,
        "business_longitude": businessLongitude,
        "business_name": businessName,
        "business_uid": businessUid,
        "car_parking": carParking,
        "category": category,
        "contact_information": contactInformation,
        "country": country,
        "furnishing_level": furnishingLevel,
        "house_facing": houseFacing,
        "house_type": houseType,
        "location": location,
        "preferred": preferred, // Note: Removed extra space
        "price": price,
        "profile_image_url": profileImageUrl,
        "sub_category": subCategory,
      };
}
