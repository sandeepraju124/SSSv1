import 'dart:convert';

List<BusinessHousemodel> businessHousemodelFromJson(String str) =>
    List<BusinessHousemodel>.from(
        json.decode(str).map((x) => BusinessHousemodel.fromJson(x)));

String businessHousemodelToJson(List<BusinessHousemodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BusinessHousemodel {
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
  String furnishingLevel;
  String houseFacing;
  String houseType;
  double latitude;
  String location;
  double longitude;
  String preferred;
  String price;
  String profileImageUrl;
  String subCategory;
  String? userid;

  BusinessHousemodel({
    required this.address,
    required this.advance,
    required this.bedrooms,
    required this.buildingAge,
    required this.businessDescription,
    this.businessEmail,
    required this.businessName,
    required this.businessUid,
    required this.carParking,
    required this.category,
    required this.contactInformation,
    required this.country,
    required this.dateColumn,
    required this.furnishingLevel,
    required this.houseFacing,
    required this.houseType,
    required this.latitude,
    required this.location,
    required this.longitude,
    required this.preferred,
    required this.price,
    required this.profileImageUrl,
    required this.subCategory,
    this.userid,
  });

  factory BusinessHousemodel.fromJson(Map<String, dynamic> json) =>
      BusinessHousemodel(
        address: json["address"] ?? "",
        advance: json["advance"] ?? "",
        bedrooms: json["bedrooms"] ?? 0,
        buildingAge: json["building_age"] ?? 0,
        businessDescription: json["business_description"] ?? "",
        businessEmail: json["business_email"],
        businessName: json["business_name"] ?? "",
        businessUid: json["business_uid"] ?? "",
        carParking: json["car_parking"] ?? false,
        category: json["category"] ?? "",
        contactInformation: json["contact_information"] ?? "",
        country: json["country"] ?? "",
        dateColumn: json["date_column"] ?? "",
        furnishingLevel: json["furnishing_level"] ?? "",
        houseFacing: json["house_facing"] ?? "",
        houseType: json["house_type"] ?? "",
        latitude: (json["latitude"] ?? 0).toDouble(),
        location: json["location"] ?? "",
        longitude: (json["longitude"] ?? 0).toDouble(),
        preferred: json["preferred "] ?? "",
        price: json["price"] ?? "",
        profileImageUrl: json["profile_image_url"] ?? "",
        subCategory: json["sub_category"] ?? "",
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
        "furnishing_level": furnishingLevel,
        "house_facing": houseFacing,
        "house_type": houseType,
        "latitude": latitude,
        "location": location,
        "longitude": longitude,
        "preferred ": preferred,
        "price": price,
        "profile_image_url": profileImageUrl,
        "sub_category": subCategory,
        "userid": userid,
      };
}
