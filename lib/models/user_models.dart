// To parse this JSON data, do
//
//     final usermodel = usermodelFromJson(jsonString);

import 'dart:convert';

Usermodel? usermodelFromJson(String str) => Usermodel.fromJson(json.decode(str));

String usermodelToJson(Usermodel? data) => json.encode(data!.toJson());

class Usermodel {
    Usermodel({
        this.id,
        this.address,
        this.dp,
        this.email,
        this.name,
        this.userid,
        this.username,
    });

    String? id;
    Address? address;
    String? dp;
    String? email;
    String? name;
    String? userid;
    String? username;

    factory Usermodel.fromJson(Map<String, dynamic> json) => Usermodel(
        id: json["_id"],
        address: Address.fromJson(json["address"]),
        dp: json["dp"],
        email: json["email"],
        name: json["name"],
        userid: json["userid"],
        username: json["username"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "address": address!.toJson(),
        "dp": dp,
        "email": email,
        "name": name,
        "userid": userid,
        "username": username,
    };
}

class Address {
    Address({
        this.city,
        this.geo,
        this.state,
        this.street,
        this.zipcode,
    });

    String? city;
    Geo? geo;
    String? state;
    String? street;
    String? zipcode;

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        city: json["city"],
        geo: Geo.fromJson(json["geo"]),
        state: json["state"],
        street: json["street"],
        zipcode: json["zipcode"],
    );

    Map<String, dynamic> toJson() => {
        "city": city,
        "geo": geo!.toJson(),
        "state": state,
        "street": street,
        "zipcode": zipcode,
    };
}

class Geo {
    Geo({
        this.lat,
        this.lng,
    });

    String? lat;
    String? lng;

    factory Geo.fromJson(Map<String, dynamic> json) => Geo(
        lat: json["lat"],
        lng: json["lng"],
    );

    Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
    };
}
