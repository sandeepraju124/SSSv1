import 'dart:convert';

List<Businessprofile> businessprofileFromJson(String str) =>
    List<Businessprofile>.from(
        json.decode(str).map((x) => Businessprofile.fromJson(x)));

String businessprofileToJson(List<Businessprofile> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

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
  Hosingdetails? hosingdetails;
  Malldetails? malldetails;

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
    this.hosingdetails,
    this.malldetails,
  });

  factory Businessprofile.fromJson(Map<String, dynamic> json) =>
      Businessprofile(
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
        hosingdetails: json["hosingdetails"] == null
            ? null
            : Hosingdetails.fromJson(json["hosingdetails"]),
        malldetails: json["malldetails"] == null
            ? null
            : Malldetails.fromJson(json["malldetails"]),
        //  malldetails: json['malldetails'] != null ? Malldetails.fromJson(json['malldetails']) : null,
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
        "hosingdetails": hosingdetails?.toJson(),
        "malldetails": malldetails?.toJson(),
      };
}

enum Country { COUNTRY_INDIA, HYDERABAD_INDIA, INDIA }

final countryValues = EnumValues({
  "India": Country.COUNTRY_INDIA,
  "Hyderabad (india)": Country.HYDERABAD_INDIA,
  "india": Country.INDIA
});

class Hosingdetails {
  String ageofBuilding;
  String bathroom;
  String facing;
  String furnishingStatus;
  String gatedSecurity;
  String rooms;

  Hosingdetails({
    required this.ageofBuilding,
    required this.bathroom,
    required this.facing,
    required this.furnishingStatus,
    required this.gatedSecurity,
    required this.rooms,
  });

  factory Hosingdetails.fromJson(Map<String, dynamic> json) => Hosingdetails(
        ageofBuilding: json["AgeofBuilding"],
        bathroom: json["Bathroom"],
        facing: json["Facing"],
        furnishingStatus: json["FurnishingStatus"],
        gatedSecurity: json["GatedSecurity"],
        rooms: json["Rooms"],
      );

  Map<String, dynamic> toJson() => {
        "AgeofBuilding": ageofBuilding,
        "Bathroom": bathroom,
        "Facing": facing,
        "FurnishingStatus": furnishingStatus,
        "GatedSecurity": gatedSecurity,
        "Rooms": rooms,
      };
}

class Malldetails {
  String cinemaScreens;
  String foodCourtSeating;
  String footfalls;
  String sqFt;

  Malldetails({
    required this.cinemaScreens,
    required this.foodCourtSeating,
    required this.footfalls,
    required this.sqFt,
  });

  factory Malldetails.fromJson(Map<String, dynamic> json) => Malldetails(
        cinemaScreens: json["Cinema Screens"].toString(),
        foodCourtSeating: json["Food Court Seating"].toString(),
        footfalls: json["Footfalls"].toString(),
        sqFt: json["Sq.ft"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "Cinema Screens": cinemaScreens,
        "Food Court Seating": foodCourtSeating,
        "Footfalls": footfalls,
        "Sq.ft": sqFt,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
