// To parse this JSON data, do
//
//     final businessprofile = businessprofileFromJson(jsonString);

import 'dart:convert';

List<Businessprofile> businessprofileFromJson(String str) => List<Businessprofile>.from(json.decode(str).map((x) => Businessprofile.fromJson(x)));

String businessprofileToJson(List<Businessprofile> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Businessprofile {
    String id;
    List<String> amenities;
    String businessDescription;
    String businessName;
    String businessUid;
    String category;
    String contactInformation;
    Country country;
    List<String> images;
    dynamic latitude;
    String longitude;
    String profileImage;
    String subCategory;

    Businessprofile({
        required this.id,
        required this.amenities,
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
        amenities: List<String>.from(json["amenities"].map((x) => x)),
        businessDescription: json["business_description"],
        businessName: json["business_name"],
        businessUid: json["business_uid"],
        category: json["category"],
        contactInformation: json["contact_information"],
        country: countryValues.map[json["country"]]!,
        images: List<String>.from(json["images"].map((x) => x)),
        latitude: json["latitude"],
        longitude: json["longitude"],
        profileImage: json["profile_image"],
        subCategory: json["sub_category"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "amenities": List<dynamic>.from(amenities.map((x) => x)),
        "business_description": businessDescription,
        "business_name": businessName,
        "business_uid": businessUid,
        "category": category,
        "contact_information": contactInformation,
        "country": countryValues.reverse[country],
        "images": List<dynamic>.from(images.map((x) => x)),
        "latitude": latitude,
        "longitude": longitude,
        "profile_image": profileImage,
        "sub_category": subCategory,
    };
}

enum Country { INDIA, COUNTRY_INDIA }

final countryValues = EnumValues({
    "India": Country.COUNTRY_INDIA,
    "india": Country.INDIA
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
