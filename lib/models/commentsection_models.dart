// To parse this JSON data, do
//
//     final commentSectionModels = commentSectionModelsFromJson(jsonString);

import 'dart:convert';

CommentSectionModels commentSectionModelsFromJson(String str) => CommentSectionModels.fromJson(json.decode(str));

String commentSectionModelsToJson(CommentSectionModels data) => json.encode(data.toJson());

class CommentSectionModels {
    String id;
    String businessUid;
    List<Comment> comments;

    CommentSectionModels({
        required this.id,
        required this.businessUid,
        required this.comments,
    });

    factory CommentSectionModels.fromJson(Map<String, dynamic> json) => CommentSectionModels(
        id: json["_id"],
        businessUid: json["business_uid"],
        comments: List<Comment>.from(json["comments"].map((x) => Comment.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "business_uid": businessUid,
        "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
    };
}

class Comment {
    String comment;
    DateTime createdAt;
    String dp;
    String userId;
    String username;

    Comment({
        required this.comment,
        required this.createdAt,
        required this.dp,
        required this.userId,
        required this.username,
    });

    factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        comment: json["comment"],
        createdAt: DateTime.parse(json["created_at"]),
        dp: json["dp"],
        userId: json["user_id"],
        username: json["username"],
    );

    Map<String, dynamic> toJson() => {
        "comment": comment,
        "created_at": createdAt.toIso8601String(),
        "dp": dp,
        "user_id": userId,
        "username": username,
    };
}
