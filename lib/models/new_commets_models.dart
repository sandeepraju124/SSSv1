// To parse this JSON data, do
//
//     final nearbyComments = nearbyCommentsFromJson(jsonString);

import 'dart:convert';

List<NearbyComments> nearbyCommentsFromJson(String str) => List<NearbyComments>.from(json.decode(str).map((x) => NearbyComments.fromJson(x)));

String nearbyCommentsToJson(List<NearbyComments> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NearbyComments {
  String businessId;
  String comment;
  int commentId;
  String createdAt;
  String lat;
  String long;
  dynamic profileImageUrl;
  int rating;
  String updatedAt;
  String userId;
  String userName;

  NearbyComments({
    required this.businessId,
    required this.comment,
    required this.commentId,
    required this.createdAt,
    required this.lat,
    required this.long,
    required this.profileImageUrl,
    required this.rating,
    required this.updatedAt,
    required this.userId,
    required this.userName,
  });

  factory NearbyComments.fromJson(Map<String, dynamic> json) => NearbyComments(
    businessId: json["business_id"],
    comment: json["comment"],
    commentId: json["comment_id"],
    createdAt: json["created_at"],
    lat: json["lat"],
    long: json["long"],
    profileImageUrl: json["profile_image_url"],
    rating: json["rating"],
    updatedAt: json["updated_at"],
    userId: json["user_id"],
    userName: json["user_name"],
  );

  Map<String, dynamic> toJson() => {
    "business_id": businessId,
    "comment": comment,
    "comment_id": commentId,
    "created_at": createdAt,
    "lat": lat,
    "long": long,
    "profile_image_url": profileImageUrl,
    "rating": rating,
    "updated_at": updatedAt,
    "user_id": userId,
    "user_name": userName,
  };
}
