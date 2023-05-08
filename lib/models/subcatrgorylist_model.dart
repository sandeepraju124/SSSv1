// To parse this JSON data, do
//
//     final subcategorylist = subcategorylistFromJson(jsonString);

import 'dart:convert';

List<Subcategorylist> subcategorylistFromJson(String str) => List<Subcategorylist>.from(json.decode(str).map((x) => Subcategorylist.fromJson(x)));

String subcategorylistToJson(List<Subcategorylist> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Subcategorylist {
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

    Subcategorylist({
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

    factory Subcategorylist.fromJson(Map<String, dynamic> json) => Subcategorylist(
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
