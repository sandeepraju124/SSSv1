// To parse this JSON data, do
//
//     final subcategorylist = subcategorylistFromJson(jsonString);

import 'dart:convert';

List<Subcategorylist> subcategorylistFromJson(String str) => List<Subcategorylist>.from(json.decode(str).map((x) => Subcategorylist.fromJson(x)));

String subcategorylistToJson(List<Subcategorylist> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Subcategorylist {
    String businessDescription;
    String businessName;
    String businessUid;
    String contactInformation;
    String latitude;
    String longitude;
    double overallRating;
    String profileImage;
    int reviewsLength;

    Subcategorylist({
        required this.businessDescription,
        required this.businessName,
        required this.businessUid,
        required this.contactInformation,
        required this.latitude,
        required this.longitude,
        required this.overallRating,
        required this.profileImage,
        required this.reviewsLength,
    });

    factory Subcategorylist.fromJson(Map<String, dynamic> json) => Subcategorylist(
        businessDescription: json["business_description"],
        businessName: json["business_name"],
        businessUid: json["business_uid"],
        contactInformation: json["contact_information"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        overallRating: json["overall_rating"]?.toDouble(),
        profileImage: json["profile_image"],
        reviewsLength: json["reviews_length"],
    );

    Map<String, dynamic> toJson() => {
        "business_description": businessDescription,
        "business_name": businessName,
        "business_uid": businessUid,
        "contact_information": contactInformation,
        "latitude": latitude,
        "longitude": longitude,
        "overall_rating": overallRating,
        "profile_image": profileImage,
        "reviews_length": reviewsLength,
    };
}
