// To parse this JSON data, do
//
//     final restaurantModels = restaurantModelsFromJson(jsonString);

import 'dart:convert';

List<RestaurantModels> restaurantModelsFromJson(String str) => List<RestaurantModels>.from(json.decode(str).map((x) => RestaurantModels.fromJson(x)));

String restaurantModelsToJson(List<RestaurantModels> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RestaurantModels {
    RestaurantModels({
        required this.name,
        required this.desp,
        required this.image,
        required this.rating,
        required this.reviewers,
    });

    String name;
    String desp;
    String image;
    double rating;
    int reviewers;

    factory RestaurantModels.fromJson(Map<String, dynamic> json) => RestaurantModels(
        name: json["Name"],
        desp: json["Desp"],
        image: json["Image"],
        rating: json["Rating"].toDouble(),
        reviewers: json["Reviewers"],
    );

    Map<String, dynamic> toJson() => {
        "Name": name,
        "Desp": desp,
        "Image": image,
        "Rating": rating,
        "Reviewers": reviewers,
    };
}

