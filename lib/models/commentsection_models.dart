import 'dart:convert';

CommentSectionModels commentSectionModelsFromJson(String str) =>
    CommentSectionModels.fromJson(json.decode(str));

String commentSectionModelsToJson(CommentSectionModels data) =>
    json.encode(data.toJson());

class CommentSectionModels {
  String id;
  String businessUid;
  List<Review> reviews;

  CommentSectionModels({
    required this.id,
    required this.businessUid,
    required this.reviews,
  });

  factory CommentSectionModels.fromJson(Map<String, dynamic> json) {
    var reviewsJson = json["reviews"] as List<dynamic>? ?? [];
    var reviewsList = reviewsJson.map((x) => Review.fromJson(x)).toList();
    return CommentSectionModels(
      id: json["_id"],
      businessUid: json["business_uid"],
      reviews: reviewsList,
    );
  }
  Map<String, dynamic> toJson() => {
        "_id": id,
        "business_uid": businessUid,
        "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
      };

  List<Review> get reversedReviews {
    List<Review> reversed = List.from(reviews);
    reversed = reversed.reversed.toList();
    return reversed;
  }
}

class Review {
  String comment;
  DateTime createdAt;
  int rating;
  String userId;

  Review({
    required this.comment,
    required this.createdAt,
    required this.rating,
    required this.userId,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        comment: json["comment"],
        createdAt: DateTime.parse(json["created_at"]),
        rating: json["rating"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "comment": comment,
        "created_at": createdAt.toIso8601String(),
        "rating": rating,
        "user_id": userId,
      };
}
