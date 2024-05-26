// To parse this JSON data, do
//
//     final housedataModel = housedataModelFromJson(jsonString);

import 'dart:convert';

List<HousedataModel> housedataModelFromJson(String str) =>
    List<HousedataModel>.from(
        json.decode(str).map((x) => HousedataModel.fromJson(x)));

String housedataModelToJson(List<HousedataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HousedataModel {
  String address;
  String advance;
  int bedrooms;
  int buildingAge;
  String businessDescription;
  String? businessEmail;
  String businessName;
  String businessUid;
  bool carParking;
  String category;
  String contactInformation;
  String country;
  String dateColumn;
  String houseFacing;
  String houseType;
  double latitude;
  String location;
  double longitude;
  String price;
  String profileImageUrl;
  String subCategory;
  String? userid;

  HousedataModel({
    required this.address,
    required this.advance,
    required this.bedrooms,
    required this.buildingAge,
    required this.businessDescription,
    required this.businessEmail,
    required this.businessName,
    required this.businessUid,
    required this.carParking,
    required this.category,
    required this.contactInformation,
    required this.country,
    required this.dateColumn,
    required this.houseFacing,
    required this.houseType,
    required this.latitude,
    required this.location,
    required this.longitude,
    required this.price,
    required this.profileImageUrl,
    required this.subCategory,
    required this.userid,
  });

  factory HousedataModel.fromJson(Map<String, dynamic> json) => HousedataModel(
        address: json["address"],
        advance: json["advance"],
        bedrooms: json["bedrooms"],
        buildingAge: json["building_age"],
        businessDescription: json["business_description"],
        businessEmail: json["business_email"],
        businessName: json["business_name"],
        businessUid: json["business_uid"],
        carParking: json["car_parking"],
        category: json["category"],
        contactInformation: json["contact_information"],
        country: json["country"],
        dateColumn: json["date_column"],
        houseFacing: json["house_facing"],
        houseType: json["house_type"],
        latitude: json["latitude"]?.toDouble(),
        location: json["location"],
        longitude: json["longitude"]?.toDouble(),
        price: json["price"],
        profileImageUrl: json["profile_image_url"],
        subCategory: json["sub_category"],
        userid: json["userid"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "advance": advance,
        "bedrooms": bedrooms,
        "building_age": buildingAge,
        "business_description": businessDescription,
        "business_email": businessEmail,
        "business_name": businessName,
        "business_uid": businessUid,
        "car_parking": carParking,
        "category": category,
        "contact_information": contactInformation,
        "country": country,
        "date_column": dateColumn,
        "house_facing": houseFacing,
        "house_type": houseType,
        "latitude": latitude,
        "location": location,
        "longitude": longitude,
        "price": price,
        "profile_image_url": profileImageUrl,
        "sub_category": subCategory,
        "userid": userid,
      };
}
