// To parse this JSON data, do
//
//     final businessModel = businessModelFromJson(jsonString);

import 'dart:convert';

List<BusinessModel> businessModelFromJson(String str) =>
    List<BusinessModel>.from(
        json.decode(str).map((x) => BusinessModel.fromJson(x)));

String businessModelToJson(List<BusinessModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BusinessModel {
  String address;
  String businessDescription;
  String businessName;
  String businessUid;
  String category;
  String contactInformation;
  String country;
  double latitude;
  double longitude;
  String profileImageUrl;
  String subCategory;
  bool? isPremium;

  BusinessModel({
    required this.address,
    required this.businessDescription,
    required this.businessName,
    required this.businessUid,
    required this.category,
    required this.contactInformation,
    required this.country,
    required this.latitude,
    required this.longitude,
    required this.profileImageUrl,
    required this.subCategory,
    required this.isPremium,
  });

  factory BusinessModel.fromJson(Map<String, dynamic> json) => BusinessModel(
        address: json["address"] ?? "",
        businessDescription: json["business_description"] ?? "",
        businessName: json["business_name"] ?? "",
        businessUid: json["business_uid"] ?? "",
        category: json["category"] ?? "",
        contactInformation: json["contact_information"] ?? "",
        country: json["country"] ?? "",
        latitude: json["latitude"]?.toDouble() ?? 0.0,
        longitude: json["longitude"]?.toDouble() ?? 0.0,
        profileImageUrl: json["profile_image_url"] ?? "",
        subCategory: json["sub_category"] ?? "",
        isPremium:
            json["is_premium"] == null ? null : json["is_premium"] as bool,
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "business_description": businessDescription,
        "business_name": businessName,
        "business_uid": businessUid,
        "category": category,
        "contact_information": contactInformation,
        "country": country,
        "latitude": latitude,
        "longitude": longitude,
        "profile_image_url": profileImageUrl,
        "sub_category": subCategory,
      };
}

// To parse this JSON data, do
//
//     final businessModel = businessModelFromJson(jsonString);

// import 'dart:convert';

// List<BusinessModel> businessModelFromJson(String str) =>
//     List<BusinessModel>.from(
//         json.decode(str).map((x) => BusinessModel.fromJson(x)));

// String businessModelToJson(List<BusinessModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class BusinessModel {
//   String address;
//   String businessDescription;
//   dynamic businessEmail;
//   String businessName;
//   String businessUid;
//   String category;
//   String contactInformation;
//   String country;
//   String dateColumn;
//   double latitude;
//   double longitude;
//   String profileImageUrl;
//   String subCategory;
//   String? userid;

//   BusinessModel({
//     required this.address,
//     required this.businessDescription,
//     required this.businessEmail,
//     required this.businessName,
//     required this.businessUid,
//     required this.category,
//     required this.contactInformation,
//     required this.country,
//     required this.dateColumn,
//     required this.latitude,
//     required this.longitude,
//     required this.profileImageUrl,
//     required this.subCategory,
//     required this.userid,
//   });

//   factory BusinessModel.fromJson(Map<String, dynamic> json) => BusinessModel(
//         address: json["address"],
//         businessDescription: json["business_description"],
//         businessEmail: json["business_email"],
//         businessName: json["business_name"],
//         businessUid: json["business_uid"],
//         category: json["category"],
//         contactInformation: json["contact_information"],
//         country: json["country"],
//         dateColumn: json["date_column"],
//         latitude: json["latitude"]?.toDouble(),
//         longitude: json["longitude"]?.toDouble(),
//         profileImageUrl: json["profile_image_url"],
//         subCategory: json["sub_category"],
//         userid: json["userid"],
//       );

//   Map<String, dynamic> toJson() => {
//         "address": address,
//         "business_description": businessDescription,
//         "business_email": businessEmail,
//         "business_name": businessName,
//         "business_uid": businessUid,
//         "category": category,
//         "contact_information": contactInformation,
//         "country": country,
//         "date_column": dateColumn,
//         "latitude": latitude,
//         "longitude": longitude,
//         "profile_image_url": profileImageUrl,
//         "sub_category": subCategory,
//         "userid": userid,
//       };
// }
