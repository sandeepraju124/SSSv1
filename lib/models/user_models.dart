// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    UserModel({
        required this.id,
        required this.address,
        required this.dp,
        required this.email,
        required this.name,
        required this.userid,
        required this.username,
        required this.zipcode,
    });

    String id;
    Address address;
    String dp;
    String email;
    String name;
    String userid;
    String username;
    String zipcode;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["_id"],
        address: Address.fromJson(json["address"]),
        dp: json["dp"],
        email: json["email"],
        name: json["name"],
        userid: json["userid"],
        username: json["username"],
        zipcode: json["zipcode"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "address": address.toJson(),
        "dp": dp,
        "email": email,
        "name": name,
        "userid": userid,
        "username": username,
        "zipcode": zipcode,
    };
}

class Address {
    Address({
        required this.geo,
        required this.state,
        required this.street,
    });

    Geo geo;
    String state;
    String street;

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        geo: Geo.fromJson(json["geo"]),
        state: json["state"],
        street: json["street"],
    );

    Map<String, dynamic> toJson() => {
        "geo": geo.toJson(),
        "state": state,
        "street": street,
    };
}

class Geo {
    Geo({
        required this.lat,
        required this.lng,
    });

    String lat;
    String lng;

    factory Geo.fromJson(Map<String, dynamic> json) => Geo(
        lat: json["lat"],
        lng: json["lng"],
    );

    Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
    };
}
