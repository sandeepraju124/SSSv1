// To parse this JSON data, do
//
//     final businessprofileadd = businessprofileaddFromJson(jsonString);

import 'dart:convert';

Businessprofileadd businessprofileaddFromJson(String str) => Businessprofileadd.fromJson(json.decode(str));

String businessprofileaddToJson(Businessprofileadd data) => json.encode(data.toJson());

class Businessprofileadd {
    String id;
    List<String> amenities;
    String businessUid;
    List<String> images;

    Businessprofileadd({
        required this.id,
        required this.amenities,
        required this.businessUid,
        required this.images,
    });

    factory Businessprofileadd.fromJson(Map<String, dynamic> json) => Businessprofileadd(
        id: json["_id"],
        amenities: List<String>.from(json["amenities"].map((x) => x)),
        businessUid: json["business_uid"],
        images: List<String>.from(json["images"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "amenities": List<dynamic>.from(amenities.map((x) => x)),
        "business_uid": businessUid,
        "images": List<dynamic>.from(images.map((x) => x)),
    };
}
