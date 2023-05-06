// To parse this JSON data, do
//
//     final subcategory = subcategoryFromJson(jsonString);

import 'dart:convert';

Subcategory subcategoryFromJson(String str) => Subcategory.fromJson(json.decode(str));

String subcategoryToJson(Subcategory data) => json.encode(data.toJson());

class Subcategory {
    List<Service> services;
    List<String> subcategories;

    Subcategory({
        required this.services,
        required this.subcategories,
    });

    factory Subcategory.fromJson(Map<String, dynamic> json) => Subcategory(
        services: List<Service>.from(json["services"].map((x) => Service.fromJson(x))),
        subcategories: List<String>.from(json["subcategories"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "services": List<dynamic>.from(services.map((x) => x.toJson())),
        "subcategories": List<dynamic>.from(subcategories.map((x) => x)),
    };
}

class Service {
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

    Service({
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

    factory Service.fromJson(Map<String, dynamic> json) => Service(
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
