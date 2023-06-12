// To parse this JSON data, do
//
//     final commentSectionModels = commentSectionModelsFromJson(jsonString);

import 'dart:convert';

CommentSectionModels commentSectionModelsFromJson(String str) => CommentSectionModels.fromJson(json.decode(str));

String commentSectionModelsToJson(CommentSectionModels data) => json.encode(data.toJson());

class CommentSectionModels {
    String id;
    String businessUid;
    List<Review> reviews;
    double overallRating;
    Map<String, int> ratingCount;

    CommentSectionModels({
        required this.id,
        required this.businessUid,
        required this.reviews,
        required this.overallRating,
        required this.ratingCount,
    });

    factory CommentSectionModels.fromJson(Map<String, dynamic> json) => CommentSectionModels(
        id: json["_id"],
        businessUid: json["business_uid"],
        reviews: List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
        overallRating: json["overall_rating"]?.toDouble(),
        ratingCount: Map.from(json["rating_count"]).map((k, v) => MapEntry<String, int>(k, v)),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "business_uid": businessUid,
        "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
        "overall_rating": overallRating,
        "rating_count": Map.from(ratingCount).map((k, v) => MapEntry<String, dynamic>(k, v)),
    };
}

class Review {
    String comment;
    DateTime createdAt;
    String dp;
    int rating;
    String userId;
    String username;

    Review({
        required this.comment,
        required this.createdAt,
        required this.dp,
        required this.rating,
        required this.userId,
        required this.username,
    });

    factory Review.fromJson(Map<String, dynamic> json) => Review(
        comment: json["comment"],
        createdAt: DateTime.parse(json["created_at"]),
        dp: json["dp"],
        rating: json["rating"],
        userId: json["user_id"],
        username: json["username"],
    );

    Map<String, dynamic> toJson() => {
        "comment": comment,
        "created_at": createdAt.toIso8601String(),
        "dp": dp,
        "rating": rating,
        "user_id": userId,
        "username": username,
    };
}
