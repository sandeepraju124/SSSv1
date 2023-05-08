// To parse this JSON data, do
//
//     final businessprofile = businessprofileFromJson(jsonString);

import 'dart:convert';

Businessprofile businessprofileFromJson(String str) => Businessprofile.fromJson(json.decode(str));

String businessprofileToJson(Businessprofile data) => json.encode(data.toJson());

class Businessprofile {
    String id;
    String businessDescription;
    String businessName;
    String businessUid;
    String category;
    String contactInformation;
    String country;
    List<String> images;
    String latitude;
    String longitude;
    String profileImage;
    String subCategory;

    Businessprofile({
        required this.id,
        required this.businessDescription,
        required this.businessName,
        required this.businessUid,
        required this.category,
        required this.contactInformation,
        required this.country,
        required this.images,
        required this.latitude,
        required this.longitude,
        required this.profileImage,
        required this.subCategory,
    });

    factory Businessprofile.fromJson(Map<String, dynamic> json) => Businessprofile(
        id: json["_id"],
        businessDescription: json["business_description"],
        businessName: json["business_name"],
        businessUid: json["business_uid"],
        category: json["category"],
        contactInformation: json["contact_information"],
        country: json["country"],
        images: List<String>.from(json["images"].map((x) => x)),
        latitude: json["latitude"],
        longitude: json["longitude"],
        profileImage: json["profile_image"],
        subCategory: json["sub_category"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "business_description": businessDescription,
        "business_name": businessName,
        "business_uid": businessUid,
        "category": category,
        "contact_information": contactInformation,
        "country": country,
        "images": List<dynamic>.from(images.map((x) => x)),
        "latitude": latitude,
        "longitude": longitude,
        "profile_image": profileImage,
        "sub_category": subCategory,
    };
}
