// To parse this JSON data, do
//
//     final favouriteModels = favouriteModelsFromJson(jsonString);

import 'dart:convert';

List<FavouriteModels> favouriteModelsFromJson(String str) => List<FavouriteModels>.from(json.decode(str).map((x) => FavouriteModels.fromJson(x)));

String favouriteModelsToJson(List<FavouriteModels> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FavouriteModels {
  String businessId;
  String businessName;
  dynamic businessProfileImageUrl;
  String createdAt;
  int favouriteId;
  String subCategory;
  String userId;
  String userName;

  FavouriteModels({
    required this.businessId,
    required this.businessName,
    required this.businessProfileImageUrl,
    required this.createdAt,
    required this.favouriteId,
    required this.subCategory,
    required this.userId,
    required this.userName,
  });

  factory FavouriteModels.fromJson(Map<String, dynamic> json) => FavouriteModels(
    businessId: json["business_id"],
    businessName: json["business_name"],
    businessProfileImageUrl: json["business_profile_image_url"],
    createdAt: json["created_at"],
    favouriteId: json["favourite_id"],
    subCategory: json["sub_category"],
    userId: json["user_id"],
    userName: json["user_name"],
  );

  Map<String, dynamic> toJson() => {
    "business_id": businessId,
    "business_name": businessName,
    "business_profile_image_url": businessProfileImageUrl,
    "created_at": createdAt,
    "favourite_id": favouriteId,
    "sub_category": subCategory,
    "user_id": userId,
    "user_name": userName,
  };
}
