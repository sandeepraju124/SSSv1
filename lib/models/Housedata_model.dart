// To parse this JSON data, do
//
//     final housedataModel = housedataModelFromJson(jsonString);

import 'dart:convert';

List<HousedataModel> housedataModelFromJson(String str) => List<HousedataModel>.from(json.decode(str).map((x) => HousedataModel.fromJson(x)));

String housedataModelToJson(List<HousedataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HousedataModel {
    String advance;
    int bedrooms;
    int buildingAge;
    double businessLatitude;
    double businessLongitude;
    String businessName;
    String businessUid;
    bool carParking;
    String category;
    String contactInformation;
    String country;
    String houseFacing;
    String houseType;
    String location;
    String price;
    String profileImageUrl;
    String subCategory;

    HousedataModel({
        required this.advance,
        required this.bedrooms,
        required this.buildingAge,
        required this.businessLatitude,
        required this.businessLongitude,
        required this.businessName,
        required this.businessUid,
        required this.carParking,
        required this.category,
        required this.contactInformation,
        required this.country,
        required this.houseFacing,
        required this.houseType,
        required this.location,
        required this.price,
        required this.profileImageUrl,
        required this.subCategory,
    });

    factory HousedataModel.fromJson(Map<String, dynamic> json) => HousedataModel(
        advance: json["advance"],
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
        houseFacing: json["house_facing"],
        houseType: json["house_type"],
        location: json["location"],
        price: json["price"],
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
        "house_facing": houseFacing,
        "house_type": houseType,
        "location": location,
        "price": price,
        "profile_image_url": profileImageUrl,
        "sub_category": subCategory,
    };
}
