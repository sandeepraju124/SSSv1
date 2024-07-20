// // To parse this JSON data, do
// //
// //     final userModels = userModelsFromJson(jsonString);

// import 'dart:convert';

// UserModels userModelsFromJson(String str) => UserModels.fromJson(json.decode(str));

// String userModelsToJson(UserModels data) => json.encode(data.toJson());

// class UserModels {
//     String id;
//     Address address;
//     String dp;
//     String email;
//     String name;
//     String userid;
//     String username;
//     String zipcode;

//     UserModels({
//         required this.id,
//         required this.address,
//         required this.dp,
//         required this.email,
//         required this.name,
//         required this.userid,
//         required this.username,
//         required this.zipcode,
//     });

//     factory UserModels.fromJson(Map<String, dynamic> json) => UserModels(
//         id: json["_id"],
//         address: Address.fromJson(json["address"]),
//         dp: json["dp"].toString(),
//         email: json["email"],
//         name: json["name"],
//         userid: json["userid"],
//         username: json["username"],
//         zipcode: json["zipcode"],
//     );

//     Map<String, dynamic> toJson() => {
//         "_id": id,
//         "address": address.toJson(),
//         "dp": dp,
//         "email": email,
//         "name": name,
//         "userid": userid,
//         "username": username,
//         "zipcode": zipcode,
//     };
// }

// class Address {
//     Geo geo;
//     String state;
//     String street;

//     Address({
//         required this.geo,
//         required this.state,
//         required this.street,
//     });

//     factory Address.fromJson(Map<String, dynamic> json) => Address(
//         geo: Geo.fromJson(json["geo"]),
//         state: json["state"],
//         street: json["street"],
//     );

//     Map<String, dynamic> toJson() => {
//         "geo": geo.toJson(),
//         "state": state,
//         "street": street,
//     };
// }

// class Geo {
//     String lat;
//     String lng;

//     Geo({
//         required this.lat,
//         required this.lng,
//     });

//     factory Geo.fromJson(Map<String, dynamic> json) => Geo(
//         lat: json["lat"],
//         lng: json["lng"],
//     );

//     Map<String, dynamic> toJson() => {
//         "lat": lat,
//         "lng": lng,
//     };
// }


// To parse this JSON data, do
//
//     final userModels = userModelsFromJson(jsonString);

import 'dart:convert';

UserModels userModelsFromJson(String str) => UserModels.fromJson(json.decode(str));

String userModelsToJson(UserModels data) => json.encode(data.toJson());

class UserModels {
    String id;
    dynamic profile_image_url;
    String? email;
    dynamic name;
    String userid;
    dynamic username;

    UserModels({
        required this.id,
        required this.profile_image_url,
        required this.email,
        required this.name,
        required this.userid,
        required this.username,
    });

    factory UserModels.fromJson(Map<String, dynamic> json) => UserModels(
        id: json["_id"],
        profile_image_url: json["profile_image_url"],
        email: json["email"],
        name: json["name"],
        userid: json["userid"],
        username: json["username"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "profile_image_url": profile_image_url,
        "email": email,
        "name": name,
        "userid": userid,
        "username": username,
    };
}
