// To parse this JSON data, do
//
//     final businessModel = businessModelFromJson(jsonString);

import 'dart:convert';

List<BusinessModel> businessModelFromJson(String str) => List<BusinessModel>.from(json.decode(str).map((x) => BusinessModel.fromJson(x)));

String businessModelToJson(List<BusinessModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

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
    });

    factory BusinessModel.fromJson(Map<String, dynamic> json) => BusinessModel(
        address: json["address"],
        businessDescription: json["business_description"],
        businessName: json["business_name"],
        businessUid: json["business_uid"],
        category: json["category"],
        contactInformation: json["contact_information"],
        country: json["country"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        profileImageUrl: json["profile_image_url"],
        subCategory: json["sub_category"],
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
