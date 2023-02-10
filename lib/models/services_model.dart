// To parse this JSON data, do
//
//     final servicesModel = servicesModelFromJson(jsonString);

import 'dart:convert';

List<ServicesModel> servicesModelFromJson(String str) => List<ServicesModel>.from(json.decode(str).map((x) => ServicesModel.fromJson(x)));

String servicesModelToJson(List<ServicesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ServicesModel {
    ServicesModel({
        required this.id,
        required this.catagory,
        required this.despription,
        required this.image,
        required this.imagenext,
        required this.name,
        this.populardishes,
        required this.rating,
        required this.reviews,
        this.servicesoffered,
    });

    String id;
    Catagory catagory;
    String despription;
    String image;
    String imagenext;
    String name;
    List<Populardish>? populardishes;
    String rating;
    String reviews;
    List<Servicesoffered>? servicesoffered;

    factory ServicesModel.fromJson(Map<String, dynamic> json) => ServicesModel(
        id: json["_id"],
        catagory: catagoryValues.map[json["catagory"]]!,
        despription: json["despription"],
        image: json["image"],
        imagenext: json["imagenext"],
        name: json["name"],
        populardishes: json["populardishes"] == null ? [] : List<Populardish>.from(json["populardishes"]!.map((x) => Populardish.fromJson(x))),
        rating: json["rating"],
        reviews: json["reviews"],
        servicesoffered: json["servicesoffered"] == null ? [] : List<Servicesoffered>.from(json["servicesoffered"]!.map((x) => servicesofferedValues.map[x]!)),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "catagory": catagoryValues.reverse[catagory],
        "despription": despription,
        "image": image,
        "imagenext": imagenext,
        "name": name,
        "populardishes": populardishes == null ? [] : List<dynamic>.from(populardishes!.map((x) => x.toJson())),
        "rating": rating,
        "reviews": reviews,
        "servicesoffered": servicesoffered == null ? [] : List<dynamic>.from(servicesoffered!.map((x) => servicesofferedValues.reverse[x])),
    };
}

enum Catagory { RESTAURANT, PLUMBER, BARBER }

final catagoryValues = EnumValues({
    "barber": Catagory.BARBER,
    "plumber": Catagory.PLUMBER,
    "restaurant": Catagory.RESTAURANT
});

class Populardish {
    Populardish({
        required this.image,
        required this.name,
    });

    String image;
    String name;

    factory Populardish.fromJson(Map<String, dynamic> json) => Populardish(
        image: json["image"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "image": image,
        "name": name,
    };
}

enum Servicesoffered { EMERGENCY_SERVICES, WATER_HEATER_REPAIR, SINK_INSTALLATION, PIPE_REPAIR, DRAIN_CLEANING }

final servicesofferedValues = EnumValues({
    "Drain Cleaning": Servicesoffered.DRAIN_CLEANING,
    "Emergency Services": Servicesoffered.EMERGENCY_SERVICES,
    "Pipe Repair": Servicesoffered.PIPE_REPAIR,
    "Sink Installation": Servicesoffered.SINK_INSTALLATION,
    "Water Heater Repair": Servicesoffered.WATER_HEATER_REPAIR
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
