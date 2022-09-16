// To parse this JSON data, do
//
//     final searchListModels = searchListModelsFromJson(jsonString);

import 'dart:convert';

List<SearchListModels> searchListModelsFromJson(String str) => List<SearchListModels>.from(json.decode(str).map((x) => SearchListModels.fromJson(x)));

String searchListModelsToJson(List<SearchListModels> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchListModels {
    SearchListModels({
        required this.id,
        required this.address,
        required this.comments,
        required this.contactNumber,
        required this.coverImage,
        required this.dpImage,
        required this.nreviews,
        required this.rating,
        required this.restaurantName,
    });

    String id;
    String address;
    List<String> comments;
    int contactNumber;
    String coverImage;
    String dpImage;
    int nreviews;
    double rating;
    String restaurantName;

    factory SearchListModels.fromJson(Map<String, dynamic> json) => SearchListModels(
        id: json["_id"],
        address: json["address"],
        comments: List<String>.from(json["comments"].map((x) => x)),
        contactNumber: json["contact_number"],
        coverImage: json["cover_image"],
        dpImage: json["dp_image"],
        nreviews: json["nreviews"],
        rating: json["rating"].toDouble(),
        restaurantName: json["restaurant_name"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "address": address,
        "comments": List<dynamic>.from(comments.map((x) => x)),
        "contact_number": contactNumber,
        "cover_image": coverImage,
        "dp_image": dpImage,
        "nreviews": nreviews,
        "rating": rating,
        "restaurant_name": restaurantName,
    };
}
